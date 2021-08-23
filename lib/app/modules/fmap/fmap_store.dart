import 'dart:async';
import 'dart:collection';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:furg_interactive_map/app/app_store.dart';
import 'package:furg_interactive_map/models/coordinates/coordinates_model.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter/services.dart' show rootBundle;
part 'fmap_store.g.dart';

class FmapStore = _FmapStoreBase with _$FmapStore;

abstract class _FmapStoreBase with Store {
  // * Create store to access my appStore
  final AppStore _appStore;

  // * Run function when render widget
  _FmapStoreBase(this._appStore) {
    loadMapStyles();
    loadCoordinates();
    // _setPolygons();
    addPolygontest01();
    // fillCordinates();
    // fillCampus();
  }

  @observable
  Set<Polygon> polygons = HashSet<Polygon>();

  @observable
  Set<Polygon> emptyPolygons = HashSet<Polygon>();

  @action
  addPolygontest01() {
    polygons.add(
      Polygon(
        polygonId: PolygonId("1"),
        points: polygonLatLong1,
        fillColor: Colors.white,
        strokeWidth: 1,
      ),
    );
    polygons.add(
      Polygon(
        polygonId: PolygonId("2"),
        points: polygonLatLong2,
        fillColor: Colors.white,
        strokeWidth: 1,
      ),
    );
  }

  List<LatLng> polygonLatLong1 = [
    LatLng(-32.072717, -52.168965),
    LatLng(-32.072618, -52.168894),
    LatLng(-32.072685, -52.168761),
    LatLng(-32.072633, -52.16865),
    LatLng(-32.072738, -52.168564),
    LatLng(-32.072793, -52.168674),
    LatLng(-32.072827, -52.168696),
    LatLng(-32.072931, -52.168696),
    LatLng(-32.072937, -52.168551),
    LatLng(-32.072996, -52.168436),
    LatLng(-32.073028, -52.16846),
    LatLng(-32.07305, -52.168425),
    LatLng(-32.073097, -52.168452),
    LatLng(-32.073072, -52.168501),
    LatLng(-32.073086, -52.168521),
    LatLng(-32.073044, -52.168599),
    LatLng(-32.073044, -52.168947),
    LatLng(-32.073084, -52.169022),
    LatLng(-32.073075, -52.169038),
    LatLng(-32.073097, -52.169091),
    LatLng(-32.073044, -52.169129),
    LatLng(-32.073014, -52.169094),
    LatLng(-32.072993, -52.169106),
    LatLng(-32.072925, -52.168987),
    LatLng(-32.07292, -52.168834),
    LatLng(-32.072827, -52.168833),
    LatLng(-32.072779, -52.168863),
    LatLng(-32.072717, -52.168965),
  ];
  List<LatLng> polygonLatLong2 = [
    LatLng(-32.075462, -52.163317),
    LatLng(-32.075467, -52.163884),
    LatLng(-32.075336, -52.163883),
    LatLng(-32.075332, -52.163321),
    LatLng(-32.075462, -52.163317),
  ];

  @action
  Future fillCampus() async {
    FutureBuilder<Coordinates>(
      future: fillCordinates(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final coordinatesData = snapshot.data;
          final buildings = coordinatesData!.features?.length;
          for (var i = 0; i < buildings!; i++) {
            List<LatLng> buildingLatLong = [];
            final latlngLength =
                coordinatesData.features![i].geometry!.coordinates!.length;
            for (var j = 0; j < latlngLength; j++) {
              buildingLatLong.add(LatLng(
                  coordinatesData.features![i].geometry!
                      .coordinates![latlngLength].first.first,
                  coordinatesData.features![i].geometry!
                      .coordinates![latlngLength].last.last));
            }
            polygons.add(
              Polygon(
                polygonId: PolygonId("${i}"),
                points: buildingLatLong,
                fillColor: Colors.white,
                strokeWidth: 1,
              ),
            );
          }
          // Container(
          //   child: ListView.builder(
          //     itemCount: coordinatesData!.features?.length,
          //     itemBuilder: (BuildContext context, i) {
          //       return ListTile(
          //         title:
          //             Text('${coordinatesData.features![i].properties!.name}'),
          //       );
          //     },
          //   ),
          // );
        }
        return Text("------------------------------------------merda");
      },
    );
  }

  @action
  emptyPolygon() {
    polygons = emptyPolygons;
  }

  @action
  Future<Coordinates> fillCordinates() async {
    final jsonCoordinates = json.decode(await loadCoordinates());
    return (Coordinates.fromJson(jsonCoordinates));
  }

  // * Mão mexer daqui pra baixo

  @observable
  String? darkMapStyle;

  @observable
  String? lightMapStyle;

  @observable
  String? coordinates;

  @observable
  Completer<GoogleMapController>? googleMapController = Completer();

  // @observable

  @action
  Future loadCoordinates() async {
    return coordinates =
        await rootBundle.loadString('assets/coordinates/coordinates.json');
  }

  @observable
  CameraPosition initialCameraPositionSmallHill = CameraPosition(
    target: LatLng(
      -32.075526,
      -52.163279,
    ),
    zoom: 14.4746,
  );

  @action
  Future loadMapStyles() async {
    darkMapStyle =
        await rootBundle.loadString('assets/map_styles/dark_map.json');
    lightMapStyle =
        await rootBundle.loadString('assets/map_styles/light_map.json');
  }

  @action
  Future setMapStyle() async {
    final controller = await googleMapController!.future;
    if (_appStore.isDark)
      controller.setMapStyle(darkMapStyle);
    else
      controller.setMapStyle(lightMapStyle);
  }
}
