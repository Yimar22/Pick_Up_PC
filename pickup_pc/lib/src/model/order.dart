import 'dart:convert';

import 'package:pickup_pc/src/model/apps.dart';
import 'package:pickup_pc/src/model/user.dart';


Order orderFromJson(String str) => Order.fromJson(json.decode(str));

String orderToJson(Order data) => json.encode(data.toJson());

class Order {

  String id;
  String idStudent;
  String idMonitor;
  String status;
  List<Apps> apps = [];
  List<Order> toList = [];
  User student;
  User monitor;

  Order({
    this.id,
    this.idStudent,
    this.idMonitor,
    this.status,
    this.apps,
    this.student,
    this.monitor,
  });

  factory Order.fromJson(Map<String, dynamic> json) => Order(
    id: json["id"] is int ? json["id"].toString() : json['id'],
    idStudent: json["id_Student"],
    idMonitor: json["id_Monitor"],
    status: json["status"],
   
    apps: json["apps"] != null ? List<Apps>.from(json["apps"].map((model) => model is Apps ? model : Apps.fromJson(model))) ?? [] : [],
    student: json['student'] is String ? userFromJson(json['student']) : json['student'] is User ? json['student'] : User.fromJson(json['student'] ?? {}),
    monitor: json['monitor'] is String ? userFromJson(json['monitor']) : json['monitor'] is User ? json['monitor'] : User.fromJson(json['monitor'] ?? {}),
  );

  Order.fromJsonList(List<dynamic> jsonList) {
    if (jsonList == null) return;
    jsonList.forEach((item) {
      Order order = Order.fromJson(item);
      toList.add(order);
    });
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "id_client": idStudent,
    "id_delivery": idMonitor,
    "status": status,
    "apps": apps,
    "student": student,
    "monitor": monitor,
  };
}
