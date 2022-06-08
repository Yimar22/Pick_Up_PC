import 'package:flutter/material.dart';
import 'package:pickup_pc/src/pages/chat/chat_page.dart';
import 'package:pickup_pc/src/pages/login/login_page.dart';
import 'package:pickup_pc/src/help/help_page.dart';
import 'package:pickup_pc/src/pages/students/orders/orders_create_page.dart';
import 'package:pickup_pc/src/pages/students/apps/apps_page.dart';
import 'package:pickup_pc/src/utils/my_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pick Up PC',
      debugShowCheckedModeBanner: false,
      initialRoute: 'login',
      routes: {
        'login': (BuildContext context) => LoginPage(),
        'help': (BuildContext context) => HelpPage(),
        'students/apps': (BuildContext context) => AppsPage(),
        'students/orders': (BuildContext context) => OrdersCreatePage(),
        'pages': (BuildContext context) => ChatPage(),
      },
      theme: ThemeData(
          primaryColor: MyColors.primaryColor,
          appBarTheme: AppBarTheme(elevation: 0)),
    );
  }
}
