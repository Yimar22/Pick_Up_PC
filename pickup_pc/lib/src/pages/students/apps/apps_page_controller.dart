import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pickup_pc/src/model/apps.dart';
import 'package:pickup_pc/src/model/category.dart';
import 'package:pickup_pc/src/utils/shared_pref.dart';

import '../../../model/user.dart';
import '../../../provider/categories_provider.dart';
import '../../../provider/apps_provider.dart';

class AppsPageController {
  BuildContext context;
  User user;
  Function refresh;
  SharedPref _sharedPref = new SharedPref();
  GlobalKey<ScaffoldState> key = new GlobalKey<ScaffoldState>();
  CategoriesProvider _categoriesProvider = new CategoriesProvider();
  AppsProvider _appsProvider = new AppsProvider();
  List<Category> categories = [];
  String appName = '';

  Future init(BuildContext context, Function refresh) async {
    this.context = context;
    this.refresh = refresh;
    user = User.fromJson(await _sharedPref.read('user'));
    _categoriesProvider.init(context, user);
    _appsProvider.init(context, user);
    getCategories();
    refresh();
  }

  Future<List<Apps>> getApps(String idCategory, String appsName) async {
    if (appsName.isEmpty) {
      return await _appsProvider.getByCategory(idCategory);
    } else {
      return null;
      /*await _appsProvider.getByCategoryAndProductName(
          idCategory, appsName);*/
    }
  }

  void logout() {
    _sharedPref.logout(context, user.user_id);
    //Navigator.pushNamedAndRemoveUntil(context, 'login', (route) => false);
    //Navigator.pop(context);
  }

  void goToOrders() {
    Navigator.pushNamed(context, 'orders');
  }

  void openDrawer() {
    key.currentState.openDrawer();
  }

  void getCategories() async {
    categories = await _categoriesProvider.getAll();
    refresh();
  }
}
