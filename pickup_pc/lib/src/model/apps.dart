import 'dart:convert';
import 'package:flutter/material.dart';

Apps productFromJson(String str) => Apps.fromJson(json.decode(str));

String productToJson(Apps data) => json.encode(data.toJson());

class Apps {
  String id;
  String name;
  String description;
  String image1;
  int idCategory;

  List<Apps> toList = [];

  Apps({
    this.id,
    this.name,
    this.description,
    this.image1,
    this.idCategory,
  });

  factory Apps.fromJson(Map<String, dynamic> json) => Apps(
        id: json["id"] is int ? json["id"].toString() : json['id'],
        name: json["name"],
        description: json["description"],
        idCategory: json["id_category"] is String
            ? int.parse(json["id_category"])
            : json["id_category"],
        image1: json["image1"],
      );

  Apps.fromJsonList(List<dynamic> jsonList) {
    if (jsonList == null) return;
    jsonList.forEach((item) {
      Apps app = Apps.fromJson(item);
      toList.add(app);
    });
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "image1": image1,
        "id_category": idCategory,
      };

  static bool isInteger(num value) =>
      value is int || value == value.roundToDouble();
}
