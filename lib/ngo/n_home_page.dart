import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/routes.dart';

class NHomePage extends StatelessWidget {
  const NHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        children: [
          Text("Ngo Home Page"),
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
