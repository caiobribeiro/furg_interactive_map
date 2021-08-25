import 'dart:async';
import 'dart:convert';
import 'package:furg_interactive_map/app/app_store.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobx/mobx.dart';
import 'package:furg_interactive_map/models/coordinates/coordinates_model.dart';
import 'package:flutter/services.dart' show rootBundle;
part 'fmap_store.g.dart';

class FmapStore = _FmapStoreBase with _$FmapStore;

abstract class _FmapStoreBase with Store {
  // * Create store to access my appStore
  final AppStore _appStore;

  // * Run function when render widget
  _FmapStoreBase(this._appStore) {
    loadMapStyles();
    loadBuildings();
  }

  // * Get all markers to fill campus
  @observable
  List<Marker> allBuildings = [];

  @observable
  String? allBuildingsJson;

  @action
  Future loadBuildings() async {
    allBuildingsJson = await rootBundle
        .loadString('assets/coordinates/furg_map_just_points.json');
    final jsonMarkers = jsonDecode(allBuildingsJson!);
    var jsonDecodedMarkers = CampusMarkers.fromJson(jsonMarkers);
    print(jsonDecodedMarkers);
    for (var i = 0; i < jsonDecodedMarkers.features!.length; i++) {
      allBuildings.add(
        Marker(
          markerId:
              MarkerId("${jsonDecodedMarkers.features![i].properties!.name}"),
          draggable: false,
          onTap: () {
            print('Maker tapped');
          },
          position: LatLng(
              jsonDecodedMarkers.features![i].geometry!.coordinates!.first,
              jsonDecodedMarkers.features![i].geometry!.coordinates!.last),
        ),
      );
    }
  }

  // * Map styles loading part

  @observable
  String? darkMapStyle;

  @observable
  String? lightMapStyle;

  @observable
  String? coordinates;

  @observable
  Completer<GoogleMapController>? googleMapController = Completer();

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
