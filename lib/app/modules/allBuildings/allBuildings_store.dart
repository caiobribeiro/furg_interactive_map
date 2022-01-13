import 'dart:collection';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobx/mobx.dart';

part 'allBuildings_store.g.dart';

class AllBuildingsStore = _AllBuildingsStoreBase with _$AllBuildingsStore;

abstract class _AllBuildingsStoreBase with Store {
  @observable
  Set<Polygon> polygons = HashSet<Polygon>();

  @observable
  bool isAllMarkersFetched = false;

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
}
