import 'package:flutter/material.dart';
import 'package:pickup_pc/src/model/response_api.dart';
import 'package:pickup_pc/src/model/user.dart';
import 'package:pickup_pc/src/provider/user_provider.dart';
import 'package:pickup_pc/src/utils/my_snackbar.dart';
import 'package:pickup_pc/src/utils/shared_pref.dart';

class LoginController {
  BuildContext context;
  TextEditingController userController = new TextEditingController();
  TextEditingController passController = new TextEditingController();

  UsersProvider usersProvider = new UsersProvider();
  SharedPref _sharedPref = new SharedPref();

  Future init(BuildContext context) async {
    this.context = context;
    await usersProvider.init(context);

    User user = User.fromJson(await _sharedPref.read('user') ?? {});

    print('Usuario: ${user.toJson()}');

    /* if (user?.sessionToken != null) {
      Navigator.pushNamedAndRemoveUntil(
          context, "students/apps", (route) => false);
    }*/
  }

  void goToHelpPage() {
    Navigator.pushNamed(context, 'help');
  }

  void goToAppsPage() {
    Navigator.pushNamed(context, 'students/apps');
  }

  void login() async {
    String user_id = userController.text.trim();
    // print(user_id);
    String pass = passController.text.trim();
    // print(pass);
    ResponseApi responseApi = await usersProvider.login(user_id, pass);

    print('Respuesta object: ${responseApi}');
    print('Respuesta: ${responseApi.toJson()}');

    if (responseApi.success) {
      User user = User.fromJson(responseApi.data);
      _sharedPref.save('user', user.toJson());

      Navigator.pushNamedAndRemoveUntil(
          context, "students/apps", (route) => false);

      print('USUARIO LOGEADO: ${user.toJson()}');
    } else {
      MySnackbar.show(context, responseApi.message);
    }
  }
}
