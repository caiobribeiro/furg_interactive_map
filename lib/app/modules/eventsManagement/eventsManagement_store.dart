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

  _EventsManagementStore() {
    autorun(
      (_) {
        print(eventName);
      },
    );
  }

  @observable
  List<Marker> allEventsPositions = [];

  @observable
  String eventName = "";

  @action
  void setEventName(String value) => eventName = value;

  @observable
  String eventDescription = "";

  @action
  void setEventDescription(String value) => eventDescription = value;

  @action
  void addNewwMarkerEvent(LatLng pos) {
    // allEventsPositions.add(Marker(markerId: eventName))
  }

  _EventsManagementStoreBase() {
    loadMapStyles();
  }

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
      print("dark");
    } else {
      controller.setMapStyle(lightMapStyle);
      print("bright");
    }
  }
}
