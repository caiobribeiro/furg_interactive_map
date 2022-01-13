// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'allBuildings_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AllBuildingsStore on _AllBuildingsStoreBase, Store {
  final _$polygonsAtom = Atom(name: '_AllBuildingsStoreBase.polygons');

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
      Atom(name: '_AllBuildingsStoreBase.isAllMarkersFetched');

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

  final _$allPolygonBuildingsJsonAtom =
      Atom(name: '_AllBuildingsStoreBase.allPolygonBuildingsJson');

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
      Atom(name: '_AllBuildingsStoreBase.jsonDecodedLatLngPolygons');

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

  final _$buildingNameAtom = Atom(name: '_AllBuildingsStoreBase.buildingName');

  @override
  String get buildingName {
    _$buildingNameAtom.reportRead();
    return super.buildingName;
  }

  @override
  set buildingName(String value) {
    _$buildingNameAtom.reportWrite(value, super.buildingName, () {
      super.buildingName = value;
    });
  }

  final _$buildingDescriptionAtom =
      Atom(name: '_AllBuildingsStoreBase.buildingDescription');

  @override
  String get buildingDescription {
    _$buildingDescriptionAtom.reportRead();
    return super.buildingDescription;
  }

  @override
  set buildingDescription(String value) {
    _$buildingDescriptionAtom.reportWrite(value, super.buildingDescription, () {
      super.buildingDescription = value;
    });
  }

  final _$buildingOficialSiteAtom =
      Atom(name: '_AllBuildingsStoreBase.buildingOficialSite');

  @override
  String get buildingOficialSite {
    _$buildingOficialSiteAtom.reportRead();
    return super.buildingOficialSite;
  }

  @override
  set buildingOficialSite(String value) {
    _$buildingOficialSiteAtom.reportWrite(value, super.buildingOficialSite, () {
      super.buildingOficialSite = value;
    });
  }

  final _$urlOficialSiteAtom =
      Atom(name: '_AllBuildingsStoreBase.urlOficialSite');

  @override
  String get urlOficialSite {
    _$urlOficialSiteAtom.reportRead();
    return super.urlOficialSite;
  }

  @override
  set urlOficialSite(String value) {
    _$urlOficialSiteAtom.reportWrite(value, super.urlOficialSite, () {
      super.urlOficialSite = value;
    });
  }

  @override
  String toString() {
    return '''
polygons: ${polygons},
isAllMarkersFetched: ${isAllMarkersFetched},
allPolygonBuildingsJson: ${allPolygonBuildingsJson},
jsonDecodedLatLngPolygons: ${jsonDecodedLatLngPolygons},
buildingName: ${buildingName},
buildingDescription: ${buildingDescription},
buildingOficialSite: ${buildingOficialSite},
urlOficialSite: ${urlOficialSite}
    ''';
  }
}
