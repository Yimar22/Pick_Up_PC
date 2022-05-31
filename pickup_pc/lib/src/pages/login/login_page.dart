import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:lottie/lottie.dart';
import 'package:pickup_pc/src/pages/login/login_controller.dart';
import 'package:pickup_pc/src/utils/my_colors.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginController _con = new LoginController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _con.init(context);
    //  SchedulerBinding.instance?.addPersistentFrameCallback((timeStamp) {

    //  });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Pick Up PC'),
        ),
        body: Container(
            width: double.infinity,
            child: Column(
              children: [
                // _imageBanner(),
                _animation(),
                _textFieldUser(),
                _textFieldPass(),
                _buttonLogin(),
                _textNeedHelp(),
              ],
            )));
  }

  Widget _buttonLogin() {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 50, vertical: 50),
      child: ElevatedButton(
        onPressed: _con.login,
        child: Text('Iniciar Sesion'),
        style: ElevatedButton.styleFrom(
            primary: MyColors.primaryColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            padding: EdgeInsets.symmetric(vertical: 20)),
      ),
    );
  }

  Widget _imageBanner() {
    return Container(
      margin: EdgeInsets.only(
          top: 100, bottom: MediaQuery.of(context).size.height * 0.01),
      child: Image.asset(
        '/assets/img/pickup.png',
        width: 250,
        height: 250,
      ),
    );
  }

  Widget _textFieldPass() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 40, vertical: 5),
      decoration: BoxDecoration(
          color: MyColors.primaryOpacityColor,
          borderRadius: BorderRadius.circular(30)),
      child: TextField(
        controller: _con.passController,
        obscureText: true,
        decoration: InputDecoration(
            hintText: 'Contraseña',
            border: InputBorder.none,
            contentPadding: EdgeInsets.all(15),
            hintStyle: TextStyle(color: MyColors.primaryColorDark),
            prefixIcon: Icon(
              Icons.mail,
              color: MyColors.primaryColor,
            )),
      ),
    );
  }

  Widget _textFieldUser() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 40, vertical: 5),
      decoration: BoxDecoration(
          color: MyColors.primaryOpacityColor,
          borderRadius: BorderRadius.circular(30)),
      child: TextField(
        controller: _con.userController,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
            hintText: 'Usuario',
            border: InputBorder.none,
            contentPadding: EdgeInsets.all(15),
            hintStyle: TextStyle(color: MyColors.primaryColorDark),
            prefixIcon: Icon(
              Icons.mail,
              color: MyColors.primaryColor,
            )),
      ),
    );
  }

  Widget _animation() {
    return Container(
      margin: EdgeInsets.only(
          top: 100, bottom: MediaQuery.of(context).size.height * 0.01),
      child: Lottie.asset('assets/json/laptop.json',
          width: 300, height: 250, fit: BoxFit.fill),
    );
  }

  Widget _textNeedHelp() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: _con.goToHelpPage,
          child: Text(
            'Necesitas ayuda?',
            style: TextStyle(color: MyColors.primaryColor),
          ),
        ),
        SizedBox(width: 10),
      ],
    );
  }
}
