import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pickup_pc/src/model/apps.dart';

import '../../../utils/shared_pref.dart';

class OrdersCreatePageController {
  BuildContext context;
  Function refresh;

  Apps app;

  SharedPref _sharedPref = new SharedPref();

  List<Apps> selectedApps = [];
  double total = 0;

  Future init(BuildContext context, Function refresh) async {
    this.context = context;
    this.refresh = refresh;

    selectedApps = Apps.fromJsonList(await _sharedPref.read('order')).toList;

    refresh();
  }



  void getTotal() {
    total = 0;
    selectedApps.forEach((product) {
      total = 0;
    });
    refresh();
  }

  void addItem(Apps app) {
    int index = selectedApps.indexWhere((p) => p.id == app.id);
    _sharedPref.save('order', selectedApps);
  }



  void deleteItem(Apps app) {
    selectedApps.removeWhere((p) => p.id == app.id);
    _sharedPref.save('order', selectedApps);
    getTotal();
  }

void goToChatPage() {
    Navigator.pushNamed(context, 'pages');
  }


  
}
