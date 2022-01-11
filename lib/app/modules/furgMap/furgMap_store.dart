import 'dart:async';
import 'dart:collection';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:furg_interactive_map/app/app_store.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter/services.dart' show rootBundle;
part 'furgMap_store.g.dart';

class FurgMapStore = _FurgMapStoreBase with _$FurgMapStore;

abstract class _FurgMapStoreBase with Store {
  final AppStore _appStore = Modular.get();

  @observable
  String? allPolygonBuildingsJson;

  @observable
  var jsonDecodedLatLngPolygons;

  @observable
  String buildingName = "";

  @observable
  String buildingDescription = "";

  @observable
  String buildingOficialSite = "";

  @observable
  String urlOficialSite =
      "https://www.google.com/url?sa=i&url=https%3A%2F%2Fencrypted-tbn0.gstatic.com%2Fimages%3Fq%3Dtbn%3AANd9GcQR-KiRO_wvDeoDAoLU7kd7zlaTak2e0u7iNHT5xqOrYW_z41BJ34g8GZ-h3tMAc7ZI_bk%26usqp%3DCAU&psig=AOvVaw0CJZHylTqFTBH0a2cBDePa&ust=1641326696532000&source=images&cd=vfe&ved=0CAoQ3YkBahcKEwiQ1PavsJb1AhUAAAAAHQAAAAAQAw";

  @observable
  var appBarSize;

  @action
  updateBuildingInfoBottonSheet(
      currentName, currentDescription, currentOficialSite) {
    buildingName = currentName;
    buildingDescription = currentDescription;
    buildingOficialSite = currentOficialSite;
  }

  // * Map styles loading part

  @observable
  String? darkMapStyle;

  @observable
  String? lightMapStyle;

  @observable
  String? coordinates;

  @observable
  Set<Polygon> polygons = HashSet<Polygon>();

  @observable
  bool isAllMarkersFetched = false;

  @observable
  List<Marker> allBuildings = [];

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
    zoom: 16.4746,
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
