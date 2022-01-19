// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'eventUpdater_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$EventUpdaterStore on _EventUpdaterStoreBase, Store {
  Computed<bool>? _$isUserTermAgreementAcceptedComputed;

  @override
  bool get isUserTermAgreementAccepted =>
      (_$isUserTermAgreementAcceptedComputed ??= Computed<bool>(
              () => super.isUserTermAgreementAccepted,
              name: '_EventUpdaterStoreBase.isUserTermAgreementAccepted'))
          .value;
  Computed<bool>? _$isEventCreationFormValidComputed;

  @override
  bool get isEventCreationFormValid => (_$isEventCreationFormValidComputed ??=
          Computed<bool>(() => super.isEventCreationFormValid,
              name: '_EventUpdaterStoreBase.isEventCreationFormValid'))
      .value;

  final _$parseEventPositionAtom =
      Atom(name: '_EventUpdaterStoreBase.parseEventPosition');

  @override
  dynamic get parseEventPosition {
    _$parseEventPositionAtom.reportRead();
    return super.parseEventPosition;
  }

  @override
  set parseEventPosition(dynamic value) {
    _$parseEventPositionAtom.reportWrite(value, super.parseEventPosition, () {
      super.parseEventPosition = value;
    });
  }

  final _$eventsResponseAtom =
      Atom(name: '_EventUpdaterStoreBase.eventsResponse');

  @override
  dynamic get eventsResponse {
    _$eventsResponseAtom.reportRead();
    return super.eventsResponse;
  }

  @override
  set eventsResponse(dynamic value) {
    _$eventsResponseAtom.reportWrite(value, super.eventsResponse, () {
      super.eventsResponse = value;
    });
  }

  final _$eventIdAtom = Atom(name: '_EventUpdaterStoreBase.eventId');

  @override
  String get eventId {
    _$eventIdAtom.reportRead();
    return super.eventId;
  }

  @override
  set eventId(String value) {
    _$eventIdAtom.reportWrite(value, super.eventId, () {
      super.eventId = value;
    });
  }

  final _$eventStartAtom = Atom(name: '_EventUpdaterStoreBase.eventStart');

  @override
  String get eventStart {
    _$eventStartAtom.reportRead();
    return super.eventStart;
  }

  @override
  set eventStart(String value) {
    _$eventStartAtom.reportWrite(value, super.eventStart, () {
      super.eventStart = value;
    });
  }

  final _$eventEndAtom = Atom(name: '_EventUpdaterStoreBase.eventEnd');

  @override
  String get eventEnd {
    _$eventEndAtom.reportRead();
    return super.eventEnd;
  }

  @override
  set eventEnd(String value) {
    _$eventEndAtom.reportWrite(value, super.eventEnd, () {
      super.eventEnd = value;
    });
  }

  final _$userNickNameAtom = Atom(name: '_EventUpdaterStoreBase.userNickName');

  @override
  String get userNickName {
    _$userNickNameAtom.reportRead();
    return super.userNickName;
  }

  @override
  set userNickName(String value) {
    _$userNickNameAtom.reportWrite(value, super.userNickName, () {
      super.userNickName = value;
    });
  }

  final _$eventUserEmailAtom =
      Atom(name: '_EventUpdaterStoreBase.eventUserEmail');

  @override
  String get eventUserEmail {
    _$eventUserEmailAtom.reportRead();
    return super.eventUserEmail;
  }

  @override
  set eventUserEmail(String value) {
    _$eventUserEmailAtom.reportWrite(value, super.eventUserEmail, () {
      super.eventUserEmail = value;
    });
  }

  final _$usersTermEmailAtom =
      Atom(name: '_EventUpdaterStoreBase.usersTermEmail');

  @override
  String get usersTermEmail {
    _$usersTermEmailAtom.reportRead();
    return super.usersTermEmail;
  }

  @override
  set usersTermEmail(String value) {
    _$usersTermEmailAtom.reportWrite(value, super.usersTermEmail, () {
      super.usersTermEmail = value;
    });
  }

  final _$customTileExpandedAtom =
      Atom(name: '_EventUpdaterStoreBase.customTileExpanded');

  @override
  bool get customTileExpanded {
    _$customTileExpandedAtom.reportRead();
    return super.customTileExpanded;
  }

  @override
  set customTileExpanded(bool value) {
    _$customTileExpandedAtom.reportWrite(value, super.customTileExpanded, () {
      super.customTileExpanded = value;
    });
  }

  final _$allPolygonBuildingsJsonAtom =
      Atom(name: '_EventUpdaterStoreBase.allPolygonBuildingsJson');

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
      Atom(name: '_EventUpdaterStoreBase.jsonDecodedLatLngPolygons');

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

  final _$polygonsAtom = Atom(name: '_EventUpdaterStoreBase.polygons');

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
      Atom(name: '_EventUpdaterStoreBase.isAllMarkersFetched');

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

  final _$missingValueAtom = Atom(name: '_EventUpdaterStoreBase.missingValue');

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

  final _$eventNameAtom = Atom(name: '_EventUpdaterStoreBase.eventName');

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
      Atom(name: '_EventUpdaterStoreBase.eventDescription');

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
      Atom(name: '_EventUpdaterStoreBase.eventOficialSite');

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
      Atom(name: '_EventUpdaterStoreBase.thereIsNoOficialSite');

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
      Atom(name: '_EventUpdaterStoreBase.eventImageLink');

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

  final _$userTermAgreementAcceptedAtom =
      Atom(name: '_EventUpdaterStoreBase.userTermAgreementAccepted');

  @override
  bool get userTermAgreementAccepted {
    _$userTermAgreementAcceptedAtom.reportRead();
    return super.userTermAgreementAccepted;
  }

  @override
  set userTermAgreementAccepted(bool value) {
    _$userTermAgreementAcceptedAtom
        .reportWrite(value, super.userTermAgreementAccepted, () {
      super.userTermAgreementAccepted = value;
    });
  }

  final _$eventPositionAtom =
      Atom(name: '_EventUpdaterStoreBase.eventPosition');

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
      Atom(name: '_EventUpdaterStoreBase.selectedEventStartDate');

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
      Atom(name: '_EventUpdaterStoreBase.selectedEventEndDate');

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
      Atom(name: '_EventUpdaterStoreBase.eventLocantion');

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

  final _$darkMapStyleAtom = Atom(name: '_EventUpdaterStoreBase.darkMapStyle');

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
      Atom(name: '_EventUpdaterStoreBase.lightMapStyle');

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
      Atom(name: '_EventUpdaterStoreBase.googleMapController');

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
      Atom(name: '_EventUpdaterStoreBase.initialCameraPositionSmallHill');

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
      AsyncAction('_EventUpdaterStoreBase.loadMapStyles');

  @override
  Future<dynamic> loadMapStyles() {
    return _$loadMapStylesAsyncAction.run(() => super.loadMapStyles());
  }

  final _$setMapStyleAsyncAction =
      AsyncAction('_EventUpdaterStoreBase.setMapStyle');

  @override
  Future<dynamic> setMapStyle() {
    return _$setMapStyleAsyncAction.run(() => super.setMapStyle());
  }

  final _$_EventUpdaterStoreBaseActionController =
      ActionController(name: '_EventUpdaterStoreBase');

  @override
  void setEventName(String value) {
    final _$actionInfo = _$_EventUpdaterStoreBaseActionController.startAction(
        name: '_EventUpdaterStoreBase.setEventName');
    try {
      return super.setEventName(value);
    } finally {
      _$_EventUpdaterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEventDescription(String value) {
    final _$actionInfo = _$_EventUpdaterStoreBaseActionController.startAction(
        name: '_EventUpdaterStoreBase.setEventDescription');
    try {
      return super.setEventDescription(value);
    } finally {
      _$_EventUpdaterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEventOficialSite(String value) {
    final _$actionInfo = _$_EventUpdaterStoreBaseActionController.startAction(
        name: '_EventUpdaterStoreBase.setEventOficialSite');
    try {
      return super.setEventOficialSite(value);
    } finally {
      _$_EventUpdaterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setThereIsNoOficialSite(bool value) {
    final _$actionInfo = _$_EventUpdaterStoreBaseActionController.startAction(
        name: '_EventUpdaterStoreBase.setThereIsNoOficialSite');
    try {
      return super.setThereIsNoOficialSite(value);
    } finally {
      _$_EventUpdaterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEventImageLink(String value) {
    final _$actionInfo = _$_EventUpdaterStoreBaseActionController.startAction(
        name: '_EventUpdaterStoreBase.setEventImageLink');
    try {
      return super.setEventImageLink(value);
    } finally {
      _$_EventUpdaterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setUserTermAgreementAccepted(bool value) {
    final _$actionInfo = _$_EventUpdaterStoreBaseActionController.startAction(
        name: '_EventUpdaterStoreBase.setUserTermAgreementAccepted');
    try {
      return super.setUserTermAgreementAccepted(value);
    } finally {
      _$_EventUpdaterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
parseEventPosition: ${parseEventPosition},
eventsResponse: ${eventsResponse},
eventId: ${eventId},
eventStart: ${eventStart},
eventEnd: ${eventEnd},
userNickName: ${userNickName},
eventUserEmail: ${eventUserEmail},
usersTermEmail: ${usersTermEmail},
customTileExpanded: ${customTileExpanded},
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
userTermAgreementAccepted: ${userTermAgreementAccepted},
eventPosition: ${eventPosition},
selectedEventStartDate: ${selectedEventStartDate},
selectedEventEndDate: ${selectedEventEndDate},
eventLocantion: ${eventLocantion},
darkMapStyle: ${darkMapStyle},
lightMapStyle: ${lightMapStyle},
googleMapController: ${googleMapController},
initialCameraPositionSmallHill: ${initialCameraPositionSmallHill},
isUserTermAgreementAccepted: ${isUserTermAgreementAccepted},
isEventCreationFormValid: ${isEventCreationFormValid}
    ''';
  }
}
