import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:furg_interactive_map/app/widgets/buildEventSheet_widget.dart';
import 'package:furg_interactive_map/app/widgets/customDrawer.dart';
import 'package:furg_interactive_map/models/coordinates/polygon_coordinates.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:furg_interactive_map/app/modules/eventUpdater/eventUpdater_store.dart';

class EventUpdaterPage extends StatefulWidget {
  final String title;
  final String eventId;
  const EventUpdaterPage({
    Key? key,
    this.title = 'Atualizar Evento',
    required this.eventId,
  }) : super(key: key);
  @override
  EventUpdaterPageState createState() => EventUpdaterPageState();
}

class EventUpdaterPageState extends State<EventUpdaterPage> {
  final EventUpdaterStore store = Modular.get();

  @override
  void initState() {
    loadUserIds();
    store.loadMapStyles();
    createPolygonForEachBuilding();
    super.initState();
  }

  Future loadUserIds() async {
    final currentUser = await ParseUser.currentUser() as ParseUser?;
    store.usersTermEmail = currentUser!.emailAddress!;
  }

  Future<void> _selectDate(BuildContext context) async {
    final picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365)),
    );
    if (picked != null) {
      store.selectedEventStartDate = picked.start;
      store.selectedEventEndDate = picked.end;
    }
  }

  Future _addNewwMarkerEvent(LatLng pos) async {
    store.eventPosition = pos;
    final currentUser = await ParseUser.currentUser() as ParseUser?;
    store.usersTermEmail = currentUser!.emailAddress!;
    store.eventLocantion = Marker(
      markerId: MarkerId(store.eventName),
      position: pos,
      onTap: () => showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
        builder: (context) => BuildEventSheetWidget(
          eventName: store.eventName,
          eventDescription: store.eventDescription,
          eventImageLink: store.eventImageLink,
          eventOficialSite: store.eventOficialSite,
          userFurgEmail: currentUser.emailAddress,
          eventPosition: pos,
          eventStart:
              DateFormat('dd/MM/yyyy').format(store.selectedEventStartDate),
          eventEnd: DateFormat('dd/MM/yyyy').format(store.selectedEventEndDate),
        ),
      ),
    );
  }

  // ! Create a polygon for each building
  Future createPolygonForEachBuilding() async {
    // * Load json file
    store.allPolygonBuildingsJson = await rootBundle
        .loadString('assets/coordinates/mapa_interativo_furg_att.json');

    // * Decode json file
    final jsonPolygons = jsonDecode(store.allPolygonBuildingsJson!);
    store.jsonDecodedLatLngPolygons = PolygonCoordinates.fromJson(jsonPolygons);

    // * Create a marker for each building in json file
    for (var i = 0; i < store.jsonDecodedLatLngPolygons.features!.length; i++) {
      List<LatLng> tempPolygonList = [];
      // ignore: unused_local_variable
      String tempDescription = "Não há descrição";

      for (var j = 0;
          j <
              store.jsonDecodedLatLngPolygons.features![i].geometry!
                  .coordinates![0].length;
          j++) {
        tempPolygonList.add(LatLng(
            store.jsonDecodedLatLngPolygons.features![i].geometry!.coordinates!
                .single[j].last,
            store.jsonDecodedLatLngPolygons.features![i].geometry!.coordinates!
                .single[j].first));
        String tempName =
            store.jsonDecodedLatLngPolygons.features![i].properties!.name;
        if (store.jsonDecodedLatLngPolygons.features![i].properties!
                .description !=
            null) {
          tempDescription = store
              .jsonDecodedLatLngPolygons.features![i].properties!.description;
        }

        store.polygons.add(
          Polygon(
            consumeTapEvents: true,
            polygonId: PolygonId(tempName),
            points: tempPolygonList,
            fillColor: Colors.greenAccent,
            strokeWidth: 1,
            onTap: () {},
          ),
        );
      }
    }
    // * Make the map widget visiable
    return store.isAllMarkersFetched = !store.isAllMarkersFetched;
  }

  @override
  Widget build(BuildContext context) {
    Future<List<ParseObject>> _getEspecificEvents() async {
      QueryBuilder<ParseObject> queryEvent =
          QueryBuilder<ParseObject>(ParseObject('Event'));
      queryEvent.whereContains('objectId', '${widget.eventId}');

      final ParseResponse apiResponse = await queryEvent.query();

      if (apiResponse.success && apiResponse.results != null) {
        store.eventsResponse = apiResponse.results as List<ParseObject>;
        return apiResponse.results as List<ParseObject>;
      } else {
        return [];
      }
    }

    _updateEvent() async {
      final currentUser = await ParseUser.currentUser() as ParseUser?;
      var event = ParseObject('Event')
        ..objectId = widget.eventId
        ..set('userNickName', currentUser?.username)
        ..set('eventName', store.eventName)
        ..set('eventDescription', store.eventDescription)
        ..set('eventImageLink', store.eventImageLink)
        ..set('eventOficialSite', store.eventOficialSite)
        ..set('eventStart', store.selectedEventStartDate)
        ..set('eventEnd', store.selectedEventEndDate)
        ..set('userFurgEmail', currentUser?.emailAddress)
        ..set(
            'eventPosition',
            ParseGeoPoint(
                latitude: store.eventPosition.latitude,
                longitude: store.eventPosition.longitude));

      await event.save();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: DrawerCustom(),
      body: FutureBuilder<List<ParseObject>>(
        future: _getEspecificEvents(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return Center(
                child: Container(
                    width: 100,
                    height: 100,
                    child: CircularProgressIndicator()),
              );
            default:
              if (snapshot.hasError) {
                return Center(
                  child: Text("Error..."),
                );
              }
              if (!snapshot.hasData) {
                return Center(
                  child: Text("No Data..."),
                );
              } else {
                final allEventsApiResponse = snapshot.data![0];
                store.eventName =
                    allEventsApiResponse.get<String>('eventName')!;
                store.eventDescription =
                    allEventsApiResponse.get<String>('eventDescription')!;
                store.eventUserEmail =
                    allEventsApiResponse.get<String>('userFurgEmail')!;
                store.eventOficialSite =
                    allEventsApiResponse.get<String>('eventOficialSite')!;
                store.eventImageLink =
                    allEventsApiResponse.get<String>('eventImageLink')!;
                store.userNickName =
                    allEventsApiResponse.get<String>('userNickName')!;
                store.eventId = allEventsApiResponse.get<String>('objectId')!;
                store.eventStart = DateFormat('dd-MM-yyyy')
                    .format(allEventsApiResponse.get<DateTime>('eventStart')!);
                store.eventEnd = DateFormat('dd-MM-yyyy')
                    .format(allEventsApiResponse.get<DateTime>('eventEnd')!);
                store.parseEventPosition =
                    allEventsApiResponse.get<ParseGeoPoint>('eventPosition')!;

                store.eventPosition = LatLng(store.parseEventPosition.latitude,
                    store.parseEventPosition.longitude);
                _addNewwMarkerEvent(store.eventPosition);
                store.userTermAgreementAccepted = false;

                return Container(
                  margin: EdgeInsets.all(5),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("Nome atual: ${store.eventName}"),
                        Container(
                          margin: EdgeInsets.fromLTRB(5, 0, 5, 15),
                          child: TextFormField(
                            decoration: const InputDecoration(
                              border: UnderlineInputBorder(),
                              labelText: 'Nome do Evento',
                            ),
                            onChanged: store.setEventName,
                          ),
                        ),
                        Text("Descrição atual: ${store.eventDescription}"),
                        Container(
                          margin: EdgeInsets.fromLTRB(5, 5, 5, 15),
                          child: TextFormField(
                            decoration: const InputDecoration(
                              border: UnderlineInputBorder(),
                              labelText: 'Descrição',
                            ),
                            onChanged: store.setEventDescription,
                          ),
                        ),
                        Text("URL imagem atual: ${store.eventImageLink}"),
                        Container(
                          margin: EdgeInsets.fromLTRB(5, 5, 5, 15),
                          child: TextFormField(
                            decoration: const InputDecoration(
                              border: UnderlineInputBorder(),
                              labelText: 'Link imagem de capa do evento',
                            ),
                            onChanged: store.setEventImageLink,
                          ),
                        ),
                        Text("Site atual: ${store.eventOficialSite}"),
                        !store.thereIsNoOficialSite
                            ? Container(
                                margin: EdgeInsets.fromLTRB(5, 5, 5, 15),
                                child: TextFormField(
                                  decoration: const InputDecoration(
                                    border: UnderlineInputBorder(),
                                    labelText: 'Site Oficial',
                                  ),
                                  onChanged: store.setEventOficialSite,
                                ),
                              )
                            : Container(),
                        CheckboxListTile(
                          title: Text("Este evento não tem site oficial"),
                          checkColor: Colors.white,
                          // fillColor: MaterialStateProperty.resolveWith(getColor),
                          value: store.thereIsNoOficialSite,
                          onChanged: (bool? value) {
                            setState(() {
                              store.thereIsNoOficialSite = value!;
                            });
                          },
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 15, 0, 15),
                          child: Divider(
                            color: Colors.grey,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(5, 5, 5, 15),
                              child: Observer(builder: (_) {
                                return Text(
                                  "Início: ${DateFormat('dd/MM/yyyy').format(store.selectedEventStartDate)} ",
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                );
                              }),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(5, 5, 5, 15),
                              child: Observer(builder: (_) {
                                return Text(
                                  "Término: ${DateFormat('dd/MM/yyyy').format(store.selectedEventEndDate)} ",
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                );
                              }),
                            ),
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                          child: ElevatedButton.icon(
                            icon: Icon(
                              Icons.date_range,
                              size: 24.0,
                            ),
                            label: Text('Selecionar Data'),
                            onPressed: () => _selectDate(context),
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size(
                                  MediaQuery.of(context).size.width * 0.65, 45),
                              shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
                          child: Divider(
                            color: Colors.grey,
                          ),
                        ),
                        Column(
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(5, 15, 5, 0),
                              child: Text(
                                "Mantenha pressionado para definir a localização do evento.",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(5, 15, 5, 15),
                              width: MediaQuery.of(context).size.width - 10,
                              height: MediaQuery.of(context).size.height * 0.3,
                              child: Observer(
                                builder: (_) {
                                  return Visibility(
                                    visible: store.isAllMarkersFetched,
                                    child: GoogleMap(
                                      mapType: MapType.normal,
                                      zoomControlsEnabled: false,
                                      initialCameraPosition:
                                          store.initialCameraPositionSmallHill,
                                      onMapCreated:
                                          (GoogleMapController controller) {
                                        store.googleMapController!
                                            .complete(controller);
                                        store.setMapStyle();
                                      },
                                      markers: {
                                        if (store.eventLocantion != null)
                                          store.eventLocantion!,
                                      },
                                      polygons: store.polygons,
                                      onLongPress: _addNewwMarkerEvent,
                                    ),
                                  );
                                },
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(5, 5, 5, 50),
                              child: Text(
                                "Clique no marcador para ver a pré visualização do evento",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Observer(builder: (_) {
                          return ExpansionTile(
                            title: Text("Termos de uso"),
                            subtitle: Text(
                                'O usuário, ${store.usersTermEmail}, concorda com os termos de Uso'),
                            trailing: Icon(
                              store.customTileExpanded
                                  ? Icons.arrow_drop_down_circle
                                  : Icons.arrow_drop_down,
                            ),
                            onExpansionChanged: (bool expanded) {
                              store.customTileExpanded = expanded;
                            },
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.all(10),
                                child: Text(
                                  "O usuário ${store.usersTermEmail} concorda em publicar um evento no Mapa Interativo Furg seguindo os Termos de Uso.\nO usuário ${store.usersTermEmail} é responsável pelo conteúdo e isenta os criadores do aplicativo e suas dependência de toda e qualquer responsabilidade sob o conteúdo de um evento.\n   Não é permitido: \n     - Conteúdo adulto;\n     - Qualquer tipo de discriminação;",
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              CheckboxListTile(
                                title: Text(
                                    "Eu, ${store.usersTermEmail}, concordo com os Termos de Uso"),
                                checkColor: Colors.white,
                                // fillColor: MaterialStateProperty.resolveWith(getColor),
                                value: store.userTermAgreementAccepted,
                                onChanged: (bool? value) {
                                  setState(() {
                                    store.userTermAgreementAccepted = value!;
                                  });
                                },
                              ),
                            ],
                          );
                        }),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                          child: ElevatedButton.icon(
                            icon: Icon(
                              Icons.update,
                              size: 24.0,
                            ),
                            label: Text('Atualizar Evento'),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.green,
                              minimumSize: Size(
                                  MediaQuery.of(context).size.width * 0.65, 45),
                              shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(10.0),
                              ),
                            ),
                            onPressed: () {
                              store.isEventCreationFormValid == true
                                  ? showDialog<String>(
                                      context: context,
                                      builder: (BuildContext context) =>
                                          AlertDialog(
                                        title: const Text(
                                            'Evento Criado com Sucesso'),
                                        content: const Text(
                                            'Você será direcionado ao mapa'),
                                        actions: <Widget>[
                                          TextButton(
                                            onPressed: () {
                                              _updateEvent();
                                              Modular.to.navigate('/furgMap');
                                            },
                                            child: const Text('OK'),
                                          ),
                                        ],
                                      ),
                                    )
                                  : null;

                              store.missingValue.clear();
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }
          }
        },
      ),
    );
  }
}
