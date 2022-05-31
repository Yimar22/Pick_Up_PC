import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pickup_pc/src/model/apps.dart';

class OrdersCreatePageController {
  BuildContext context;
  Function refresh;

  List<Apps> selectedApps = [];

  Future init(BuildContext context) {
    this.context = context;
    this.refresh = refresh;
    refresh();
  }
}
