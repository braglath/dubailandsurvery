// To parse this JSON data, do
//
//     final totalPropertyCountModel = totalPropertyCountModelFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

TotalPropertyCountModel totalPropertyCountModelFromMap(String str) =>
    TotalPropertyCountModel.fromMap(json.decode(str));

String totalPropertyCountModelToMap(TotalPropertyCountModel data) =>
    json.encode(data.toMap());

class TotalPropertyCountModel {
  TotalPropertyCountModel({
    required this.totalCount,
    required this.landCount,
    required this.buildingCount,
    required this.unitCount,
    required this.villaCount,
  });

  final int totalCount;
  final int landCount;
  final int buildingCount;
  final int unitCount;
  final int villaCount;

  factory TotalPropertyCountModel.fromMap(Map<String, dynamic> json) =>
      TotalPropertyCountModel(
        totalCount: json["total_count"] ?? 0,
        landCount: json["land_count"] ?? 0,
        buildingCount: json["building_count"] ?? 0,
        unitCount: json["unit_count"] ?? 0,
        villaCount: json["villa_count"] ?? 0,
      );

  Map<String, dynamic> toMap() => {
        "total_count": totalCount,
        "land_count": landCount,
        "building_count": buildingCount,
        "unit_count": unitCount,
        "villa_count": villaCount,
      };
}
