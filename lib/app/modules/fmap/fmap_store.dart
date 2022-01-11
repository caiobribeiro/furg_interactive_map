import 'dart:async';
import 'dart:collection';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:furg_interactive_map/app/app_store.dart';
import 'package:furg_interactive_map/models/coordinates/polygon_coordinates.dart';
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
    loadCustomMarker();
    loadMapStyles();
    createPolygonForEachBuilding();
  }

  // * Get all markers to fill campus
  @observable
  List<Marker> allBuildings = [];

  @observable
  String? allBuildingsJson;

  @observable
  bool isAllMarkersFetched = false;

  @observable
  BitmapDescriptor? customIcon;

  @observable
  String? allPolygonBuildingsJson;

  @observable
  List<Polygon> allPolygonBuildings = [];

  @observable
  List<String> allBuildingNames = [];

  @observable
  Set<Polygon> polygons = HashSet<Polygon>();

  @observable
  bool isABuildingSelected = false;

  @action
  toggleMoreInfoElevetedButtonVisibity() {
    isABuildingSelected = !isABuildingSelected;
  }

  @observable
  var jsonDecodedMarkers;

  @observable
  var jsonDecodedLatLngPolygons;

  // Refatorado
  @observable
  var jsonDecodedPoints;

  @observable
  var jsonDecodedLatLngPolygonss;

  // Fim refatoramento

  // * BottomSheet

  @observable
  bool isBottonSheetActivated = false;

  @computed
  bool get showBottonSheet => isBottonSheetActivated;

  @action
  toggleBottonSheet() {
    isBottonSheetActivated = !isBottonSheetActivated;
  }

  @observable
  String? buildingName;

  @observable
  String? buildingDescription;

  @action
  updateBuildingInfoBottonSheet(currentName, currentDescription) {
    buildingName = currentName;
    buildingDescription = currentDescription;
  }

  // * API Response
  @action
  Future apiResponse() async {
    // * Load json file
    allBuildingsJson = await rootBundle
        .loadString('assets/coordinates/furg_map_just_points.json');

    // * Decode json file
    final jsonMarkers = jsonDecode(allBuildingsJson!);
    var jsonDecodedMarkers = CampusMarkers.fromJson(jsonMarkers);
    return jsonDecodedMarkers;
  }

  // * Load custom markers
  @action
  Future loadCustomMarker() async {
    BitmapDescriptor.fromAssetImage(
            ImageConfiguration(size: Size(3, 3)), 'assets/markers/marker.png')
        .then(
      (d) {
        customIcon = d;
      },
    );
  }

  @action
  Future loadingsPolygons() async {
    // * Load json file
    allPolygonBuildingsJson = await rootBundle
        .loadString('assets/coordinates/mapa_interativo_furg_att.json');

    // * Decode json file
    final jsonPolygons = jsonDecode(allPolygonBuildingsJson!);
    jsonDecodedLatLngPolygons = PolygonCoordinates.fromJson(jsonPolygons);
  }

  // ! Create a polygon for each building
  Future createPolygonForEachBuilding() async {
    // * Load json file
    allPolygonBuildingsJson = await rootBundle
        .loadString('assets/coordinates/mapa_interativo_furg_att.json');

    // * Decode json file
    final jsonPolygons = jsonDecode(allPolygonBuildingsJson!);
    jsonDecodedLatLngPolygons = PolygonCoordinates.fromJson(jsonPolygons);

    // * Create a marker for each building in json file
    for (var i = 0; i < jsonDecodedLatLngPolygons.features!.length; i++) {
      List<LatLng> tempPolygonList = [];
      String tempDescription = "Não há descrição";
      for (var j = 0;
          j <
              jsonDecodedLatLngPolygons
                  .features![i].geometry!.coordinates![0].length;
          j++) {
        tempPolygonList.add(LatLng(
            jsonDecodedLatLngPolygons
                .features![i].geometry!.coordinates!.single[j].last,
            jsonDecodedLatLngPolygons
                .features![i].geometry!.coordinates!.single[j].first));
        String tempName =
            jsonDecodedLatLngPolygons.features![i].properties!.name;
        if (jsonDecodedLatLngPolygons.features![i].properties!.description !=
            null) {
          tempDescription =
              jsonDecodedLatLngPolygons.features![i].properties!.description;
        }

        polygons.add(
          Polygon(
            consumeTapEvents: true,
            polygonId: PolygonId(tempName),
            points: tempPolygonList,
            fillColor: Colors.greenAccent,
            strokeWidth: 1,
            onTap: () {
              // changeSize();
              updateBuildingInfoBottonSheet(tempName, tempDescription);
              if (isBottonSheetActivated == false) {
                // toggleBottonSheet();
                toggleMoreInfoElevetedButtonVisibity();
              }
            },
          ),
        );
      }
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




 // // * Load custom markers for each type of building
  // @action
  // Future loadMarkersForEachBuildings() async {
  //   // * Load json file
  //   allBuildingsJson = await rootBundle
  //       .loadString('assets/coordinates/furg_map_just_points.json');

  //   // * Decode json file
  //   final jsonMarkers = jsonDecode(allBuildingsJson!);
  //   jsonDecodedMarkers = CampusMarkers.fromJson(jsonMarkers);

  //   // * Create a marker for each building in json file
  //   for (var i = 0; i < jsonDecodedMarkers.features!.length; i++) {
  //     if (allBuildingNames.isEmpty) {
  //       allBuildingNames.add(jsonDecodedMarkers.features![i].properties!.name);
  //     }
  //     allBuildings.add(
  //       Marker(
  //         markerId:
  //             MarkerId("${jsonDecodedMarkers.features![i].properties!.name}"),
  //         draggable: false,
  //         infoWindow: InfoWindow(
  //             title: "${jsonDecodedMarkers.features![i].properties!.name}"),
  //         onTap: () => {
  //           print(
  //               "entrei aqui ___ ___ ___ ___ ___ ___ ___ ___ ___ ___ ___ ___ ___"),
  //         },
  //         position: LatLng(
  //             jsonDecodedMarkers.features![i].geometry!.coordinates!.last,
  //             jsonDecodedMarkers.features![i].geometry!.coordinates!.first),
  //         // icon: customIcon!,
  //       ),
  //     );
  //   }
  //   // * Make the map widget visiable
  //   return isAllMarkersFetched = !isAllMarkersFetched;
  // }
