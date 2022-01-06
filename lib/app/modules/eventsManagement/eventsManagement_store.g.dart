// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'eventsManagement_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$EventsManagementStore on _EventsManagementStoreBase, Store {
  final _$allEventsPositionsAtom =
      Atom(name: '_EventsManagementStoreBase.allEventsPositions');

  @override
  List<Marker> get allEventsPositions {
    _$allEventsPositionsAtom.reportRead();
    return super.allEventsPositions;
  }

  @override
  set allEventsPositions(List<Marker> value) {
    _$allEventsPositionsAtom.reportWrite(value, super.allEventsPositions, () {
      super.allEventsPositions = value;
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
  void addNewwMarkerEvent(LatLng pos) {
    final _$actionInfo = _$_EventsManagementStoreBaseActionController
        .startAction(name: '_EventsManagementStoreBase.addNewwMarkerEvent');
    try {
      return super.addNewwMarkerEvent(pos);
    } finally {
      _$_EventsManagementStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
allEventsPositions: ${allEventsPositions},
eventName: ${eventName},
eventDescription: ${eventDescription},
darkMapStyle: ${darkMapStyle},
lightMapStyle: ${lightMapStyle},
googleMapController: ${googleMapController},
initialCameraPositionSmallHill: ${initialCameraPositionSmallHill}
    ''';
  }
}
