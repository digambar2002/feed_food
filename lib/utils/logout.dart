import 'package:feed_food/utils/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'globals.dart';

class LogOut {
  Future logOut(BuildContext context) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();

    sharedPreferences.remove("accountNo");
    sharedPreferences.remove("type");
    sharedPreferences.remove("username");
    UserType = null;
    UserAccountNo = null;
    UserUsername = null;
    Navigator.pushReplacementNamed(context, FeedFoodRoutes().loginRoute);
  }
}
