// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'eventsManagement_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$EventsManagementStore on _EventsManagementStoreBase, Store {
  Computed<bool>? _$isEventNameValidComputed;

  @override
  bool get isEventNameValid => (_$isEventNameValidComputed ??= Computed<bool>(
          () => super.isEventNameValid,
          name: '_EventsManagementStoreBase.isEventNameValid'))
      .value;
  Computed<bool>? _$isEvenetDescriptionValidComputed;

  @override
  bool get isEvenetDescriptionValid => (_$isEvenetDescriptionValidComputed ??=
          Computed<bool>(() => super.isEvenetDescriptionValid,
              name: '_EventsManagementStoreBase.isEvenetDescriptionValid'))
      .value;
  Computed<bool>? _$isEventOficialSiteValidComputed;

  @override
  bool get isEventOficialSiteValid => (_$isEventOficialSiteValidComputed ??=
          Computed<bool>(() => super.isEventOficialSiteValid,
              name: '_EventsManagementStoreBase.isEventOficialSiteValid'))
      .value;
  Computed<bool>? _$isEventImageLinkValidComputed;

  @override
  bool get isEventImageLinkValid => (_$isEventImageLinkValidComputed ??=
          Computed<bool>(() => super.isEventImageLinkValid,
              name: '_EventsManagementStoreBase.isEventImageLinkValid'))
      .value;
  Computed<bool>? _$isEventPositionValidComputed;

  @override
  bool get isEventPositionValid => (_$isEventPositionValidComputed ??=
          Computed<bool>(() => super.isEventPositionValid,
              name: '_EventsManagementStoreBase.isEventPositionValid'))
      .value;
  Computed<bool>? _$isEventCreationFormValidComputed;

  @override
  bool get isEventCreationFormValid => (_$isEventCreationFormValidComputed ??=
          Computed<bool>(() => super.isEventCreationFormValid,
              name: '_EventsManagementStoreBase.isEventCreationFormValid'))
      .value;

  final _$allPolygonBuildingsJsonAtom =
      Atom(name: '_EventsManagementStoreBase.allPolygonBuildingsJson');

  @override
  String? get allPolygonBuildingsJson {
    _$allPolygonBuildingsJsonAtom.reportRead();
    return super.allPolygonBuildingsJson;
  }

  @override
  set allPolygonBuildingsJson(String? value) {
    _$allPolygonBuildingsJsonAtom
        .reportWrite(value, super.allPolygonBuildingsJson, () {
      super.allPolygonBuildingsJson = value;
    });
  }

  final _$jsonDecodedLatLngPolygonsAtom =
      Atom(name: '_EventsManagementStoreBase.jsonDecodedLatLngPolygons');

  @override
  dynamic get jsonDecodedLatLngPolygons {
    _$jsonDecodedLatLngPolygonsAtom.reportRead();
    return super.jsonDecodedLatLngPolygons;
  }

  @override
  set jsonDecodedLatLngPolygons(dynamic value) {
    _$jsonDecodedLatLngPolygonsAtom
        .reportWrite(value, super.jsonDecodedLatLngPolygons, () {
      super.jsonDecodedLatLngPolygons = value;
    });
  }

  final _$polygonsAtom = Atom(name: '_EventsManagementStoreBase.polygons');

  @override
  Set<Polygon> get polygons {
    _$polygonsAtom.reportRead();
    return super.polygons;
  }

  @override
  set polygons(Set<Polygon> value) {
    _$polygonsAtom.reportWrite(value, super.polygons, () {
      super.polygons = value;
    });
  }

  final _$isAllMarkersFetchedAtom =
      Atom(name: '_EventsManagementStoreBase.isAllMarkersFetched');

  @override
  bool get isAllMarkersFetched {
    _$isAllMarkersFetchedAtom.reportRead();
    return super.isAllMarkersFetched;
  }

  @override
  set isAllMarkersFetched(bool value) {
    _$isAllMarkersFetchedAtom.reportWrite(value, super.isAllMarkersFetched, () {
      super.isAllMarkersFetched = value;
    });
  }

  final _$missingValueAtom =
      Atom(name: '_EventsManagementStoreBase.missingValue');

  @override
  List<String> get missingValue {
    _$missingValueAtom.reportRead();
    return super.missingValue;
  }

  @override
  set missingValue(List<String> value) {
    _$missingValueAtom.reportWrite(value, super.missingValue, () {
      super.missingValue = value;
    });
  }

  final _$eventNameAtom = Atom(name: '_EventsManagementStoreBase.eventName');

  @override
  String get eventName {
    _$eventNameAtom.reportRead();
    return super.eventName;
  }

  @override
  set eventName(String value) {
    _$eventNameAtom.reportWrite(value, super.eventName, () {
      super.eventName = value;
    });
  }

  final _$eventDescriptionAtom =
      Atom(name: '_EventsManagementStoreBase.eventDescription');

  @override
  String get eventDescription {
    _$eventDescriptionAtom.reportRead();
    return super.eventDescription;
  }

  @override
  set eventDescription(String value) {
    _$eventDescriptionAtom.reportWrite(value, super.eventDescription, () {
      super.eventDescription = value;
    });
  }

  final _$eventOficialSiteAtom =
      Atom(name: '_EventsManagementStoreBase.eventOficialSite');

  @override
  String get eventOficialSite {
    _$eventOficialSiteAtom.reportRead();
    return super.eventOficialSite;
  }

  @override
  set eventOficialSite(String value) {
    _$eventOficialSiteAtom.reportWrite(value, super.eventOficialSite, () {
      super.eventOficialSite = value;
    });
  }

  final _$thereIsNoOficialSiteAtom =
      Atom(name: '_EventsManagementStoreBase.thereIsNoOficialSite');

  @override
  bool get thereIsNoOficialSite {
    _$thereIsNoOficialSiteAtom.reportRead();
    return super.thereIsNoOficialSite;
  }

  @override
  set thereIsNoOficialSite(bool value) {
    _$thereIsNoOficialSiteAtom.reportWrite(value, super.thereIsNoOficialSite,
        () {
      super.thereIsNoOficialSite = value;
    });
  }

  final _$eventImageLinkAtom =
      Atom(name: '_EventsManagementStoreBase.eventImageLink');

  @override
  String get eventImageLink {
    _$eventImageLinkAtom.reportRead();
    return super.eventImageLink;
  }

  @override
  set eventImageLink(String value) {
    _$eventImageLinkAtom.reportWrite(value, super.eventImageLink, () {
      super.eventImageLink = value;
    });
  }

  final _$eventPositionAtom =
      Atom(name: '_EventsManagementStoreBase.eventPosition');

  @override
  LatLng get eventPosition {
    _$eventPositionAtom.reportRead();
    return super.eventPosition;
  }

  @override
  set eventPosition(LatLng value) {
    _$eventPositionAtom.reportWrite(value, super.eventPosition, () {
      super.eventPosition = value;
    });
  }

  final _$selectedEventStartDateAtom =
      Atom(name: '_EventsManagementStoreBase.selectedEventStartDate');

  @override
  DateTime get selectedEventStartDate {
    _$selectedEventStartDateAtom.reportRead();
    return super.selectedEventStartDate;
  }

  @override
  set selectedEventStartDate(DateTime value) {
    _$selectedEventStartDateAtom
        .reportWrite(value, super.selectedEventStartDate, () {
      super.selectedEventStartDate = value;
    });
  }

  final _$selectedEventEndDateAtom =
      Atom(name: '_EventsManagementStoreBase.selectedEventEndDate');

  @override
  DateTime get selectedEventEndDate {
    _$selectedEventEndDateAtom.reportRead();
    return super.selectedEventEndDate;
  }

  @override
  set selectedEventEndDate(DateTime value) {
    _$selectedEventEndDateAtom.reportWrite(value, super.selectedEventEndDate,
        () {
      super.selectedEventEndDate = value;
    });
  }

  final _$eventLocantionAtom =
      Atom(name: '_EventsManagementStoreBase.eventLocantion');

  @override
  Marker? get eventLocantion {
    _$eventLocantionAtom.reportRead();
    return super.eventLocantion;
  }

  @override
  set eventLocantion(Marker? value) {
    _$eventLocantionAtom.reportWrite(value, super.eventLocantion, () {
      super.eventLocantion = value;
    });
  }

  final _$darkMapStyleAtom =
      Atom(name: '_EventsManagementStoreBase.darkMapStyle');

  @override
  String? get darkMapStyle {
    _$darkMapStyleAtom.reportRead();
    return super.darkMapStyle;
  }

  @override
  set darkMapStyle(String? value) {
    _$darkMapStyleAtom.reportWrite(value, super.darkMapStyle, () {
      super.darkMapStyle = value;
    });
  }

  final _$lightMapStyleAtom =
      Atom(name: '_EventsManagementStoreBase.lightMapStyle');

  @override
  String? get lightMapStyle {
    _$lightMapStyleAtom.reportRead();
    return super.lightMapStyle;
  }

  @override
  set lightMapStyle(String? value) {
    _$lightMapStyleAtom.reportWrite(value, super.lightMapStyle, () {
      super.lightMapStyle = value;
    });
  }

  final _$googleMapControllerAtom =
      Atom(name: '_EventsManagementStoreBase.googleMapController');

  @override
  Completer<GoogleMapController>? get googleMapController {
    _$googleMapControllerAtom.reportRead();
    return super.googleMapController;
  }

  @override
  set googleMapController(Completer<GoogleMapController>? value) {
    _$googleMapControllerAtom.reportWrite(value, super.googleMapController, () {
      super.googleMapController = value;
    });
  }

  final _$initialCameraPositionSmallHillAtom =
      Atom(name: '_EventsManagementStoreBase.initialCameraPositionSmallHill');

  @override
  CameraPosition get initialCameraPositionSmallHill {
    _$initialCameraPositionSmallHillAtom.reportRead();
    return super.initialCameraPositionSmallHill;
  }

  @override
  set initialCameraPositionSmallHill(CameraPosition value) {
    _$initialCameraPositionSmallHillAtom
        .reportWrite(value, super.initialCameraPositionSmallHill, () {
      super.initialCameraPositionSmallHill = value;
    });
  }

  final _$loadMapStylesAsyncAction =
      AsyncAction('_EventsManagementStoreBase.loadMapStyles');

  @override
  Future<dynamic> loadMapStyles() {
    return _$loadMapStylesAsyncAction.run(() => super.loadMapStyles());
  }

  final _$setMapStyleAsyncAction =
      AsyncAction('_EventsManagementStoreBase.setMapStyle');

  @override
  Future<dynamic> setMapStyle() {
    return _$setMapStyleAsyncAction.run(() => super.setMapStyle());
  }

  final _$_EventsManagementStoreBaseActionController =
      ActionController(name: '_EventsManagementStoreBase');

  @override
  void setEventName(String value) {
    final _$actionInfo = _$_EventsManagementStoreBaseActionController
        .startAction(name: '_EventsManagementStoreBase.setEventName');
    try {
      return super.setEventName(value);
    } finally {
      _$_EventsManagementStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEventDescription(String value) {
    final _$actionInfo = _$_EventsManagementStoreBaseActionController
        .startAction(name: '_EventsManagementStoreBase.setEventDescription');
    try {
      return super.setEventDescription(value);
    } finally {
      _$_EventsManagementStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEventOficialSite(String value) {
    final _$actionInfo = _$_EventsManagementStoreBaseActionController
        .startAction(name: '_EventsManagementStoreBase.setEventOficialSite');
    try {
      return super.setEventOficialSite(value);
    } finally {
      _$_EventsManagementStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setThereIsNoOficialSite(bool value) {
    final _$actionInfo =
        _$_EventsManagementStoreBaseActionController.startAction(
            name: '_EventsManagementStoreBase.setThereIsNoOficialSite');
    try {
      return super.setThereIsNoOficialSite(value);
    } finally {
      _$_EventsManagementStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEventImageLink(String value) {
    final _$actionInfo = _$_EventsManagementStoreBaseActionController
        .startAction(name: '_EventsManagementStoreBase.setEventImageLink');
    try {
      return super.setEventImageLink(value);
    } finally {
      _$_EventsManagementStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic isAnyFieldEmpty() {
    final _$actionInfo = _$_EventsManagementStoreBaseActionController
        .startAction(name: '_EventsManagementStoreBase.isAnyFieldEmpty');
    try {
      return super.isAnyFieldEmpty();
    } finally {
      _$_EventsManagementStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
allPolygonBuildingsJson: ${allPolygonBuildingsJson},
jsonDecodedLatLngPolygons: ${jsonDecodedLatLngPolygons},
polygons: ${polygons},
isAllMarkersFetched: ${isAllMarkersFetched},
missingValue: ${missingValue},
eventName: ${eventName},
eventDescription: ${eventDescription},
eventOficialSite: ${eventOficialSite},
thereIsNoOficialSite: ${thereIsNoOficialSite},
eventImageLink: ${eventImageLink},
eventPosition: ${eventPosition},
selectedEventStartDate: ${selectedEventStartDate},
selectedEventEndDate: ${selectedEventEndDate},
eventLocantion: ${eventLocantion},
darkMapStyle: ${darkMapStyle},
lightMapStyle: ${lightMapStyle},
googleMapController: ${googleMapController},
initialCameraPositionSmallHill: ${initialCameraPositionSmallHill},
isEventNameValid: ${isEventNameValid},
isEvenetDescriptionValid: ${isEvenetDescriptionValid},
isEventOficialSiteValid: ${isEventOficialSiteValid},
isEventImageLinkValid: ${isEventImageLinkValid},
isEventPositionValid: ${isEventPositionValid},
isEventCreationFormValid: ${isEventCreationFormValid}
    ''';
  }
}
