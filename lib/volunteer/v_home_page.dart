import 'package:feed_food/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class VHomePage extends StatelessWidget {
  const VHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        children: [
          Text("Home Page Volunteer"),
          SizedBox(
            height: 50,
            width: 360,
            child: ElevatedButton(
              onPressed: (() async {
                await logout(context);
              }),
              child: Text(
                "Logout",
                style: TextStyle(fontSize: 24),
              ),
              style: ElevatedButton.styleFrom(
                  primary: Colors.deepPurple[400],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  )),
            ),
          ),
        ],
      )),
    );
  }

  Future logout(BuildContext context) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();

    sharedPreferences.remove("accountNo");
    sharedPreferences.remove("type");
    Navigator.pushNamed(context, FeedFoodRoutes().loginRoute);
  }
}
