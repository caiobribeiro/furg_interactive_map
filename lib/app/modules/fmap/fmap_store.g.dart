// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fmap_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FmapStore on _FmapStoreBase, Store {
  final _$polygonsAtom = Atom(name: '_FmapStoreBase.polygons');

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

  final _$emptyPolygonsAtom = Atom(name: '_FmapStoreBase.emptyPolygons');

  @override
  Set<Polygon> get emptyPolygons {
    _$emptyPolygonsAtom.reportRead();
    return super.emptyPolygons;
  }

  @override
  set emptyPolygons(Set<Polygon> value) {
    _$emptyPolygonsAtom.reportWrite(value, super.emptyPolygons, () {
      super.emptyPolygons = value;
    });
  }

  final _$darkMapStyleAtom = Atom(name: '_FmapStoreBase.darkMapStyle');

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

  final _$lightMapStyleAtom = Atom(name: '_FmapStoreBase.lightMapStyle');

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

  final _$coordinatesAtom = Atom(name: '_FmapStoreBase.coordinates');

  @override
  String? get coordinates {
    _$coordinatesAtom.reportRead();
    return super.coordinates;
  }

  @override
  set coordinates(String? value) {
    _$coordinatesAtom.reportWrite(value, super.coordinates, () {
      super.coordinates = value;
    });
  }

  final _$googleMapControllerAtom =
      Atom(name: '_FmapStoreBase.googleMapController');

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
      Atom(name: '_FmapStoreBase.initialCameraPositionSmallHill');

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

  final _$fillCampusAsyncAction = AsyncAction('_FmapStoreBase.fillCampus');

  @override
  Future<dynamic> fillCampus() {
    return _$fillCampusAsyncAction.run(() => super.fillCampus());
  }

  final _$fillCordinatesAsyncAction =
      AsyncAction('_FmapStoreBase.fillCordinates');

  @override
  Future<Coordinates> fillCordinates() {
    return _$fillCordinatesAsyncAction.run(() => super.fillCordinates());
  }

  final _$loadCoordinatesAsyncAction =
      AsyncAction('_FmapStoreBase.loadCoordinates');

  @override
  Future<dynamic> loadCoordinates() {
    return _$loadCoordinatesAsyncAction.run(() => super.loadCoordinates());
  }

  final _$loadMapStylesAsyncAction =
      AsyncAction('_FmapStoreBase.loadMapStyles');

  @override
  Future<dynamic> loadMapStyles() {
    return _$loadMapStylesAsyncAction.run(() => super.loadMapStyles());
  }

  final _$setMapStyleAsyncAction = AsyncAction('_FmapStoreBase.setMapStyle');

  @override
  Future<dynamic> setMapStyle() {
    return _$setMapStyleAsyncAction.run(() => super.setMapStyle());
  }

  final _$_FmapStoreBaseActionController =
      ActionController(name: '_FmapStoreBase');

  @override
  dynamic addPolygontest01() {
    final _$actionInfo = _$_FmapStoreBaseActionController.startAction(
        name: '_FmapStoreBase.addPolygontest01');
    try {
      return super.addPolygontest01();
    } finally {
      _$_FmapStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic emptyPolygon() {
    final _$actionInfo = _$_FmapStoreBaseActionController.startAction(
        name: '_FmapStoreBase.emptyPolygon');
    try {
      return super.emptyPolygon();
    } finally {
      _$_FmapStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
polygons: ${polygons},
emptyPolygons: ${emptyPolygons},
darkMapStyle: ${darkMapStyle},
lightMapStyle: ${lightMapStyle},
coordinates: ${coordinates},
googleMapController: ${googleMapController},
initialCameraPositionSmallHill: ${initialCameraPositionSmallHill}
    ''';
  }
}
