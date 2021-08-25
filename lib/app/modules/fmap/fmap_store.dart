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

  @observable
  bool isAllMarkersFetched = false;

  @action
  Future loadBuildings() async {
    // * Load json file
    allBuildingsJson = await rootBundle
        .loadString('assets/coordinates/furg_map_just_points.json');
    // * Decode json file
    final jsonMarkers = jsonDecode(allBuildingsJson!);
    var jsonDecodedMarkers = CampusMarkers.fromJson(jsonMarkers);
    // * Create a marker for each building in json file
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
    // * Make the map widget visiable
    return isAllMarkersFetched = !isAllMarkersFetched;
  }

  // * Map styles loading part

  @observable
  String? darkMapStyle;

  @observable
  String? lightMapStyle;

  @observable
  String? coordinates;

  // * Define google map controller
  @observable
  Completer<GoogleMapController>? googleMapController = Completer();

  // * Definition of my initial location for map controller
  @observable
  CameraPosition initialCameraPositionSmallHill = CameraPosition(
    target: LatLng(
      -32.075526,
      -52.163279,
    ),
    zoom: 14.4746,
  );

  // * Load each map style
  @action
  Future loadMapStyles() async {
    darkMapStyle =
        await rootBundle.loadString('assets/map_styles/dark_map.json');
    lightMapStyle =
        await rootBundle.loadString('assets/map_styles/light_map.json');
  }

  // * Set map style based at the app style
  @action
  Future setMapStyle() async {
    final controller = await googleMapController!.future;
    if (_appStore.isDark)
      controller.setMapStyle(darkMapStyle);
    else
      controller.setMapStyle(lightMapStyle);
  }
}
