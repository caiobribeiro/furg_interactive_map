import 'dart:async';
import 'dart:convert';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:furg_interactive_map/app/widgets/buildEventSheet_widget.dart';
import 'package:furg_interactive_map/app/widgets/buildMapInfoSheet_widget.dart';
import 'package:furg_interactive_map/app/widgets/customDrawer.dart';
import 'package:furg_interactive_map/app/widgets/moreLinks_widget.dart';
import 'package:furg_interactive_map/models/coordinates/polygon_coordinates.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:furg_interactive_map/app/modules/furgMap/furgMap_store.dart';
import 'package:intl/intl.dart';
import 'package:location/location.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class FurgMapPage extends StatefulWidget {
  final String title;
  const FurgMapPage({Key? key, this.title = 'FurgMapPage'}) : super(key: key);
  @override
  FurgMapPageState createState() => FurgMapPageState();
}

class FurgMapPageState extends State<FurgMapPage> {
  final FurgMapStore store = Modular.get();
  OverlayEntry? entry;
  Offset offset = Offset(20, 40);
  @override
  void initState() {
    AppBar appBar = AppBar(
      title: Text("Carreiros"),
      centerTitle: true,
      actions: [],
    );
    store.appBarSize = appBar.preferredSize.height;
    _getAllEvents();
    store.loadMapStyles();
    createPolygonForEachBuilding();
    super.initState();
  }

  Future<List<ParseObject>> _getAllEvents() async {
    QueryBuilder<ParseObject> allEvents =
        QueryBuilder<ParseObject>(ParseObject('Event'));
    final ParseResponse apiResponse = await allEvents.query();

    if (apiResponse.success && apiResponse.results != null) {
      store.eventsResponse = apiResponse.results as List<ParseObject>;
      final apiReponseLength = store.eventsResponse.length;

      for (var index = 0; index < apiReponseLength; index++) {
        var allEventsApiResponse = store.eventsResponse[index];
        final eventName = allEventsApiResponse.get<String>('eventName')!;
        final eventDescription =
            allEventsApiResponse.get<String>('eventDescription')!;
        final eventUserEmail =
            allEventsApiResponse.get<String>('userFurgEmail')!;
        final eventOficialSite =
            allEventsApiResponse.get<String>('eventOficialSite')!;
        final eventImageLink =
            allEventsApiResponse.get<String>('eventImageLink')!;
        // ignore: unused_local_variable
        final userNickName = allEventsApiResponse.get<String>('userNickName')!;
        final eventPosition =
            allEventsApiResponse.get<ParseGeoPoint>('eventPosition')!;
        final eventStart = DateFormat('dd-MM-yyyy')
            .format(allEventsApiResponse.get<DateTime>('eventStart')!);
        final eventEnd = DateFormat('dd-MM-yyyy')
            .format(allEventsApiResponse.get<DateTime>('eventEnd')!);
        // *************************************

        store.allBuildings.add(
          Marker(
            markerId: MarkerId("$eventName"),
            draggable: false,
            infoWindow: InfoWindow(title: "$eventName"),
            onTap: () => showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
              ),
              builder: (context) => BuildEventSheetWidget(
                eventName: eventName,
                eventDescription: eventDescription,
                eventImageLink: eventImageLink,
                eventOficialSite: eventOficialSite,
                userFurgEmail: eventUserEmail,
                eventStart: eventStart,
                eventEnd: eventEnd,
                eventPosition:
                    LatLng(eventPosition.latitude, eventPosition.longitude),
              ),
            ),

            position: LatLng(eventPosition.latitude, eventPosition.longitude),
            // icon: customIcon!,
          ),
        );
      }
      store.allMarkersFetched = true;

      return apiResponse.results as List<ParseObject>;
    } else {
      store.allMarkersFetched = true;
      return [];
    }
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
      String tempDescription = "Não há descrição";
      String oficialBuildingSite = "Site não disponível";
      String tempimage = "";
      LatLng buildingPostion = LatLng(0, 0);

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
        if (store.jsonDecodedLatLngPolygons.features![i].properties!
                .oficialSite !=
            null) {
          oficialBuildingSite = store
              .jsonDecodedLatLngPolygons.features![i].properties!.oficialSite;
        }

        if (store.jsonDecodedLatLngPolygons.features![i].properties!
                .imageBuilding !=
            null) {
          tempimage = store
              .jsonDecodedLatLngPolygons.features![i].properties!.imageBuilding;
        }
        buildingPostion = LatLng(
            store.jsonDecodedLatLngPolygons.features![i].geometry!.coordinates!
                .single[0].last,
            store.jsonDecodedLatLngPolygons.features![i].geometry!.coordinates!
                .single[0].first);

        store.polygons.add(
          Polygon(
            consumeTapEvents: true,
            polygonId: PolygonId(tempName),
            points: tempPolygonList,
            fillColor: Colors.greenAccent,
            strokeWidth: 1,
            onTap: () {
              animateTo(buildingPostion.latitude, buildingPostion.longitude);
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20),
                  ),
                ),
                builder: (context) => BuildMapInfoSheetWidget(
                  buildingName: tempName,
                  buildingDescription: tempDescription,
                  buildingOficialSite: oficialBuildingSite,
                  buildingImageLink: tempimage,
                  buildingPostion: buildingPostion,
                ),
              );
            },
          ),
        );
      }
    }
    // * Make the map widget visiable
    return store.allPolygonsFetched = !store.allPolygonsFetched;
  }

  Location location = new Location();
  Location _locationTracker = Location();
  void _getCurrentposition() async {
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _locationData = await location.getLocation();
    updateMarkerAndCircle(_locationData);
  }

  void updateMarkerAndCircle(LocationData newLocalData) async {
    var location = await _locationTracker.getLocation();

    this.setState(
      () {
        animateTo(location.latitude!, location.longitude!);
      },
    );
  }

  Future<void> animateTo(double lat, double lng) async {
    final c = await store.googleMapController!.future;
    final p = CameraPosition(target: LatLng(lat, lng), zoom: 16.4746);
    c.animateCamera(CameraUpdate.newCameraPosition(p));
  }

  void showOberlay(urlPage) {
    final deviceWidth = MediaQuery.of(context).size.width;
    entry = OverlayEntry(
      builder: (context) => Positioned(
        left: offset.dx,
        top: offset.dy,
        child: Column(
          children: [
            GestureDetector(
              onPanUpdate: (details) {
                offset += details.delta;
                entry!.markNeedsBuild();
              },
              child: Container(
                color: Colors.grey,
                width: deviceWidth * 0.7,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      margin: EdgeInsets.all(5),
                      child: ElevatedButton(
                        onPressed: () {
                          hideOverlay();
                        },
                        child: Icon(Icons.close, color: Colors.white),
                        style: ElevatedButton.styleFrom(
                          maximumSize: Size(64, 45),
                          shape: CircleBorder(),
                          padding: EdgeInsets.all(10),
                          primary: Colors.blue, // <-- Button color
                          onPrimary: Colors.red, // <-- Splash color
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            MoreLinks(
              urlPage: urlPage,
            ),
          ],
        ),
      ),
    );

    final overlay = Overlay.of(context);
    overlay!.insert(entry!);
  }

  void hideOverlay() {
    entry?.remove();
    entry = null;
  }

  @override
  Widget build(BuildContext context) {
    AppBar appBar = AppBar(
      title: Text("Carreiros"),
      centerTitle: true,
      actions: [],
    );

    final screenHeight = MediaQuery.of(context).size.height;
    final appBarHeight = appBar.preferredSize.height;
    final statusBarHeight = MediaQuery.of(context).padding.top;
    final deviceHeight = screenHeight - appBarHeight - statusBarHeight;
    return Scaffold(
      appBar: appBar,
      drawer: DrawerCustom(),
      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.menu_close,
        children: [
          SpeedDialChild(
            child: Icon(Icons.link),
            label: "Site Furg",
            onTap: () {
              if (entry == null) {
                showOberlay("https://www.furg.br/");
              } else {
                hideOverlay();
              }
            },
          ),
          SpeedDialChild(
            child: Icon(Icons.link),
            label: "Sistemas Furg",
            onTap: () {
              if (entry == null) {
                showOberlay("https://api.furg.br/account/login");
              } else {
                hideOverlay();
              }
            },
          ),
          SpeedDialChild(
            child: Icon(Icons.link),
            label: "AVA Furg",
            onTap: () {
              if (entry == null) {
                showOberlay("https://ava.furg.br/login/index.php");
              } else {
                hideOverlay();
              }
            },
          ),
          SpeedDialChild(
            child: Icon(Icons.link),
            label: "Repositório SI",
            onTap: () {
              if (entry == null) {
                showOberlay("https://repositoriosi.com/index.php");
              } else {
                hideOverlay();
              }
            },
          ),
        ],
      ),
      body: Observer(
        builder: (_) {
          return Stack(
            children: [
              Container(
                height: deviceHeight,
                child: Visibility(
                  visible: store.isMapPopulated,
                  child: GoogleMap(
                    mapType: MapType.normal,
                    myLocationEnabled: true,
                    initialCameraPosition: store.initialCameraPositionSmallHill,
                    onMapCreated: (GoogleMapController controller) {
                      store.googleMapController!.complete(controller);
                      store.setMapStyle();
                    },
                    markers: Set.from(store.allBuildings),
                    polygons: store.polygons,
                  ),
                ),
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.all(20),
                          child: ElevatedButton.icon(
                            icon: Icon(
                              Icons.my_location,
                              size: 24.0,
                            ),
                            label: Text('Onde Estou'),
                            onPressed: () => _getCurrentposition(),
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size(
                                  MediaQuery.of(context).size.width * 0.2, 45),
                              shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
