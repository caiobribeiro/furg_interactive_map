// To parse this JSON data, do
//
//     final CampusMarkers = CampusMarkersFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

// ignore: non_constant_identifier_names
CampusMarkers CampusMarkersFromJson(String str) =>
    CampusMarkers.fromJson(json.decode(str));

class CampusMarkers {
  CampusMarkers({
    @required this.type,
    @required this.features,
  });

  final String? type;
  final List<Feature>? features;

  factory CampusMarkers.fromJson(Map<String, dynamic> json) => CampusMarkers(
        type: json["type"],
        features: List<Feature>.from(
            json["features"].map((x) => Feature.fromJson(x))),
      );
}

class Feature {
  Feature({
    @required this.type,
    @required this.properties,
    @required this.geometry,
  });

  final String? type;
  final Properties? properties;
  final Geometry? geometry;

  factory Feature.fromJson(Map<String, dynamic> json) => Feature(
        type: json["type"],
        properties: Properties.fromJson(json["properties"]),
        geometry: Geometry.fromJson(json["geometry"]),
      );
}

class Geometry {
  Geometry({
    @required this.type,
    @required this.coordinates,
  });

  final String? type;
  final List<double>? coordinates;

  factory Geometry.fromJson(Map<String, dynamic> json) => Geometry(
        type: json["type"],
        coordinates:
            List<double>.from(json["coordinates"].map((x) => x.toDouble())),
      );
}

class Properties {
  Properties({
    @required this.name,
  });

  final String? name;

  factory Properties.fromJson(Map<String, dynamic> json) => Properties(
        name: json["name"],
      );
}
