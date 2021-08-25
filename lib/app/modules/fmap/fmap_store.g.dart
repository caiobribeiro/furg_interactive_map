// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fmap_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FmapStore on _FmapStoreBase, Store {
  final _$allBuildingsAtom = Atom(name: '_FmapStoreBase.allBuildings');

  @override
  List<Marker> get allBuildings {
    _$allBuildingsAtom.reportRead();
    return super.allBuildings;
  }

  @override
  set allBuildings(List<Marker> value) {
    _$allBuildingsAtom.reportWrite(value, super.allBuildings, () {
      super.allBuildings = value;
    });
  }

  final _$allBuildingsJsonAtom = Atom(name: '_FmapStoreBase.allBuildingsJson');

  @override
  String? get allBuildingsJson {
    _$allBuildingsJsonAtom.reportRead();
    return super.allBuildingsJson;
  }

  @override
  set allBuildingsJson(String? value) {
    _$allBuildingsJsonAtom.reportWrite(value, super.allBuildingsJson, () {
      super.allBuildingsJson = value;
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

  final _$loadBuildingsAsyncAction =
      AsyncAction('_FmapStoreBase.loadBuildings');

  @override
  Future<dynamic> loadBuildings() {
    return _$loadBuildingsAsyncAction.run(() => super.loadBuildings());
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

  @override
  String toString() {
    return '''
allBuildings: ${allBuildings},
allBuildingsJson: ${allBuildingsJson},
darkMapStyle: ${darkMapStyle},
lightMapStyle: ${lightMapStyle},
coordinates: ${coordinates},
googleMapController: ${googleMapController},
initialCameraPositionSmallHill: ${initialCameraPositionSmallHill}
    ''';
  }
}
