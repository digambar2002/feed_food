import 'package:feed_food/utils/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LogOut {
  Future logOut(BuildContext context) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();

    sharedPreferences.remove("accountNo");
    sharedPreferences.remove("type");
    Navigator.pushNamed(context, FeedFoodRoutes().loginRoute);
  }
}
