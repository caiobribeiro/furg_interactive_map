// ignore_for_file: unnecessary_brace_in_string_interps

import 'dart:collection';

import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobx/mobx.dart';
import 'package:furg_interactive_map/app/app_store.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:async';

import '../../app_store.dart';
part 'eventsManagement_store.g.dart';

class EventsManagementStore = _EventsManagementStoreBase
    with _$EventsManagementStore;

abstract class _EventsManagementStoreBase with Store {
  final AppStore _appStore = Modular.get();

  _EventsManagementStoreBase() {
    loadMapStyles();
    autorun(
      (_) {},
    );
  }

  @observable
  String usersTermEmail = "";

  @observable
  bool customTileExpanded = false;

  @observable
  String? allPolygonBuildingsJson;

  @observable
  var jsonDecodedLatLngPolygons;

  @observable
  Set<Polygon> polygons = HashSet<Polygon>();

  @observable
  bool isAllMarkersFetched = false;

  @observable
  List<String> missingValue = [];

  @observable
  String eventName = "";

  @action
  void setEventName(String value) => eventName = value;

  @observable
  String eventDescription = "";

  @action
  void setEventDescription(String value) => eventDescription = value;

  @observable
  String eventOficialSite = "";

  @action
  void setEventOficialSite(String value) => eventOficialSite = value;

  @observable
  bool thereIsNoOficialSite = false;

  @action
  void setThereIsNoOficialSite(bool value) => thereIsNoOficialSite = value;

  @observable
  String eventImageLink = "";

  @action
  void setEventImageLink(String value) => eventImageLink = value;

  @observable
  bool userTermAgreementAccepted = false;

  @action
  void setUserTermAgreementAccepted(bool value) =>
      userTermAgreementAccepted = value;

  @observable
  LatLng eventPosition = LatLng(-32.074618722943924, -52.16706030070782);

  @computed
  bool get isEventNameValid => eventName.isNotEmpty;

  @computed
  bool get isEvenetDescriptionValid => eventDescription.isNotEmpty;

  @computed
  bool get isEventOficialSiteValid =>
      eventOficialSite.isNotEmpty && thereIsNoOficialSite == true;

  @computed
  bool get isEventImageLinkValid => eventImageLink.isNotEmpty;

  @computed
  bool get isEventPositionValid =>
      eventPosition != LatLng(-32.074618722943924, -52.16706030070782);

  @computed
  bool get isEventCreationFormValid =>
      isEventNameValid &&
      isEvenetDescriptionValid &&
      isEventOficialSiteValid &&
      isEventImageLinkValid &&
      isEventPositionValid;

  @action
  isAnyFieldEmpty() {
    if (eventName == "") {
      missingValue.add("Nome");
    }
    if (eventImageLink == "") {
      missingValue.add("URL da Imagem de Capa");
    }
    if (eventOficialSite == "") {
      missingValue.add("Site Oficial");
    }
    if (eventDescription == "") {
      missingValue.add("Descrição");
    }
    if (!isEventPositionValid) {
      missingValue.add("Localização");
    }
    if (missingValue.isEmpty) {
      print("enviado");
      // função de enviar para o server
      return true;
    } else {
      return false;
    }
  }

  @observable
  DateTime selectedEventStartDate = DateTime.now();

  @observable
  DateTime selectedEventEndDate = DateTime.now();

  @observable
  Marker? eventLocantion;

  @observable
  String? darkMapStyle;

  @observable
  String? lightMapStyle;

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
    zoom: 14,
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
    if (_appStore.isDark) {
      controller.setMapStyle(darkMapStyle);
    } else {
      controller.setMapStyle(lightMapStyle);
    }
  }
}
