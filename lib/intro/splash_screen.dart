import 'dart:async';

import 'package:feed_food/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

var accountNo;
var accountType;

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState

    getValidationData().whenComplete((() async {
      Timer(const Duration(seconds: 1), (() {
        // if account no from shared preferances are null then it shows login page else volunteer or ngo home page
        if (accountNo == null) {
          Navigator.of(context)
              .pushReplacementNamed(FeedFoodRoutes().loginRoute);
        } else if (accountNo != null && accountType == 'volunteer') {
          Navigator.of(context)
              .pushReplacementNamed(FeedFoodRoutes().vMainRoute);
        } else {
          Navigator.pushNamed(context, FeedFoodRoutes().nMainRoute);
        }
      }));
    }));

    super.initState();
  }

  // Grabing shared data in varibales
  Future getValidationData() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();

    var obtainAccount = sharedPreferences.getString("accountNo");
    var obtainType = sharedPreferences.getString("type");

    setState(() {
      accountNo = obtainAccount;
      accountType = obtainType;
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
