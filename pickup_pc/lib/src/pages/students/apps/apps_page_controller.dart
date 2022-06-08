import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pickup_pc/src/model/apps.dart';
import 'package:pickup_pc/src/model/category.dart';
import 'package:pickup_pc/src/utils/shared_pref.dart';

import '../../../model/user.dart';
import '../../../provider/categories_provider.dart';
import '../../../provider/apps_provider.dart';

class AppsPageController {
  BuildContext context;
  User user;
  Apps app;
  Function refresh;
  SharedPref _sharedPref = new SharedPref();
  GlobalKey<ScaffoldState> key = new GlobalKey<ScaffoldState>();
  CategoriesProvider _categoriesProvider = new CategoriesProvider();
  AppsProvider _appsProvider = new AppsProvider();
  String appName = '';
  int counter = 1;
  List<Category> categories = [];
  List<Apps> selectedApps = [];
  

  Future init(BuildContext context, Function refresh) async {
    this.context = context;
    this.refresh = refresh;
    this.app = app;
    
    user = User.fromJson(await _sharedPref.read('user'));
    _categoriesProvider.init(context, user);
    _appsProvider.init(context, user);
    getCategories();

    selectedApps = Apps.fromJsonList(await _sharedPref.read('order')).toList;

    selectedApps.forEach((p) {
      print('Aplicacion seleccionada: ${p.toJson()}');
    });

  
    refresh();
  }

  Future<List<Apps>> getApps(String idCategory, String appsName) async {
     return await _appsProvider.getByCategory(idCategory);
 /*   if (appsName.isEmpty) {
     
    } else {
      return await _appsProvider.getByCategoryAndAppsName(
          idCategory, appsName);
    }*/
  }

  void getCategories() async {
    categories = await _categoriesProvider.getAll();
    refresh();
  }

  void logout() {
    _sharedPref.logout(context, user.user_id);
    //Navigator.pushNamedAndRemoveUntil(context, 'login', (route) => false);
    //Navigator.pop(context);
  }

void addToBag(app) {
    int index = selectedApps.indexWhere((p) => p.id == app.id);

      selectedApps.add(app);

    _sharedPref.save('order', selectedApps);
    Fluttertoast.showToast(msg: 'Producto agregado');
  }
  void goToOrders() {
    Navigator.pushNamed(context, 'students/orders');
  }

  void openDrawer() {
    key.currentState.openDrawer();
  }

  
}
