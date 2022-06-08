import 'package:flutter/material.dart';

import '../../utils/shared_pref.dart';

class ChatPageController{ 
  BuildContext context;
  //User user;
 // Apps app;
  Function refresh;
  SharedPref _sharedPref = new SharedPref();


   Future init(BuildContext context, Function refresh) async {
    this.context = context;
    this.refresh = refresh;
    //this.app = app;
   }
   


}
