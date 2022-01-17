import 'dart:convert';

import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
// import 'package:furg_interactive_map/app/widgets/buildEventSheet_widget.dart';
import 'package:furg_interactive_map/app/widgets/buildMapInfoSheet_widget.dart';
import 'package:furg_interactive_map/app/widgets/customDrawer.dart';
import 'package:furg_interactive_map/models/coordinates/polygon_coordinates.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:furg_interactive_map/app/modules/furgMap/furgMap_store.dart';

class FurgMapPage extends StatefulWidget {
  final String title;
  const FurgMapPage({Key? key, this.title = 'FurgMapPage'}) : super(key: key);
  @override
  FurgMapPageState createState() => FurgMapPageState();
}

class FurgMapPageState extends State<FurgMapPage> {
  final FurgMapStore store = Modular.get();

  @override
  void initState() {
    AppBar appBar = AppBar(
      title: Text("Carreiros"),
      centerTitle: true,
      actions: [],
    );
    store.appBarSize = appBar.preferredSize.height;
    store.loadMapStyles();
    createPolygonForEachBuilding();
    super.initState();
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
      String siteExeple = "http://c3.furg.br";

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
            onTap: () {
              store.updateBuildingInfoBottonSheet(
                  tempName, tempDescription, siteExeple);
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20),
                  ),
                ),
                builder: (context) => BuildMapInfoSheetWidget(),
              );
            },
          ),
        );
      }
    }
    // * Make the map widget visiable
    return store.isAllMarkersFetched = !store.isAllMarkersFetched;
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
      body: Observer(
        builder: (_) {
          return Stack(
            children: [
              Container(
                height: deviceHeight,
                child: Visibility(
                  visible: store.isAllMarkersFetched,
                  child: GoogleMap(
                    mapType: MapType.normal,
                    zoomControlsEnabled: false,
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
            ],
          );
        },
      ),
    );
  }
}
