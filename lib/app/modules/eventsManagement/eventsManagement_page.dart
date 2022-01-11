import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:furg_interactive_map/app/modules/eventsManagement/eventsManagement_store.dart';
import 'package:flutter/material.dart';
import 'package:furg_interactive_map/app/widgets/buildEventSheet_widget.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';

class EventsManagementPage extends StatefulWidget {
  final String title;
  const EventsManagementPage({Key? key, this.title = 'Criar Evento'})
      : super(key: key);
  @override
  EventsManagementPageState createState() => EventsManagementPageState();
}

class EventsManagementPageState extends State<EventsManagementPage> {
  final EventsManagementStore store = Modular.get();

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

  _addNewwMarkerEvent(LatLng pos) {
    print(pos);
    store.eventPosition = pos;
    store.eventLocantion = Marker(
      markerId: MarkerId(store.eventName),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
      position: pos,
      onTap: () => showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
        builder: (context) => BuildEventSheetWidget(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        margin: EdgeInsets.all(5),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
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
              ElevatedButton.icon(
                icon: Icon(
                  Icons.date_range,
                  size: 24.0,
                ),
                label: Text('Selecionar Data'),
                onPressed: () {
                  _selectDate(context);
                },
                style: ElevatedButton.styleFrom(
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(20.0),
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
                        return GoogleMap(
                          mapType: MapType.normal,
                          zoomControlsEnabled: false,
                          initialCameraPosition:
                              store.initialCameraPositionSmallHill,
                          onMapCreated: (GoogleMapController controller) {
                            store.googleMapController!.complete(controller);
                            store.setMapStyle();
                          },
                          markers: {
                            if (store.eventLocantion != null)
                              store.eventLocantion!,
                          },
                          onLongPress: _addNewwMarkerEvent,
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
              ElevatedButton.icon(
                icon: Icon(
                  Icons.save_alt_rounded,
                  size: 24.0,
                ),
                label: Text('Criar Evento'),
                onPressed: () {
                  var missingValues = store.missingValue;
                  // store.isAnyFieldEmpty();
                  store.isAnyFieldEmpty()
                      ? showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            title: const Text('Evento Criado com Sucesso'),
                            content:
                                const Text('Você será direcionado ao mapa'),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () =>
                                    Modular.to.pushNamed('/furgMap'),
                                child: const Text('OK'),
                              ),
                            ],
                          ),
                        )
                      : ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Campos Vazios: $missingValues"),
                            action: SnackBarAction(
                              label: 'Dispensar',
                              onPressed: () {
                                // Code to execute.
                              },
                            ),
                          ),
                        );
                  store.missingValue.clear();
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(20.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
