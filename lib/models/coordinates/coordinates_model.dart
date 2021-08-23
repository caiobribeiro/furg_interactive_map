// To parse this JSON data, do
//
//     final coordinates = coordinatesFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Coordinates? coordinatesFromJson(String str) =>
    Coordinates?.fromJson(json.decode(str));

class Coordinates {
  Coordinates({
    @required this.type,
    @required this.features,
  });

  final String? type;
  final List<Feature>? features;

  factory Coordinates.fromJson(Map<String, dynamic> json) => Coordinates(
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
  final List<List<List<double>>>? coordinates;

  factory Geometry.fromJson(Map<String, dynamic> json) => Geometry(
        type: json["type"],
        coordinates: List<List<List<double>>>.from(json["coordinates"].map(
            (x) => List<List<double>>.from(
                x.map((x) => List<double>.from(x.map((x) => x.toDouble())))))),
      );
}

class Properties {
  Properties({
    @required this.name,
    @required this.umapOptions,
    @required this.description,
  });

  final String? name;
  final UmapOptions? umapOptions;
  final String? description;

  factory Properties.fromJson(Map<String, dynamic> json) => Properties(
        name: json["name"],
        umapOptions: json["_umap_options"] == null
            ? null
            : UmapOptions.fromJson(json["_umap_options"]),
        description: json["description"] == null ? null : json["description"],
      );
}

class UmapOptions {
  UmapOptions({
    @required this.popupShape,
    @required this.showLabel,
  });

  final String? popupShape;
  final dynamic showLabel;

  factory UmapOptions.fromJson(Map<String, dynamic> json) => UmapOptions(
        popupShape: json["popupShape"],
        showLabel: json["showLabel"],
      );

  Map<String, dynamic> toJson() => {
        "popupShape": popupShape,
        "showLabel": showLabel,
      };
}
