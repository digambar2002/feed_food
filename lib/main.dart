// ignore_for_file: public_member_api_docs, sort_constructors_first
// Author: Digambar Chaudhari
// Author: Renuka Nathjogi
// Author: Bhavesh Patil

import 'dart:async';

import 'package:feed_food/volunteer/donate/get_location.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:feed_food/authenticate/forgot_password.dart';
import 'package:feed_food/authenticate/login_page.dart';
import 'package:feed_food/authenticate/otp_verify.dart';
import 'package:feed_food/authenticate/register_page.dart';
import 'package:feed_food/authenticate/register_page_ngo.dart';
import 'package:feed_food/authenticate/register_page_user.dart';
import 'package:feed_food/authenticate/set_password.dart';
import 'package:feed_food/intro/splash_screen.dart';
import 'package:feed_food/intro/walkthrough.dart';
import 'package:feed_food/intro/welcome_page.dart';
import 'package:feed_food/ngo/n_home_page.dart';
import 'package:feed_food/ngo/n_main_page.dart';
import 'package:feed_food/utils/routes.dart';
import 'package:feed_food/volunteer/v_main_page.dart';

var accountNo = null;
var accountType = null;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Color.fromARGB(255, 250, 250, 250),
      statusBarIconBrightness: Brightness.dark));

  var getType = await getValidationData();

  setType() {
    if (getType == "volunteer") {
      return FeedFoodRoutes().vMainRoute;
    } else if (getType == "ngo") {
      return FeedFoodRoutes().nMainRoute;
    }
    return FeedFoodRoutes().loginRoute;
  }

  runApp(MyApp(
    initialRoute: setType(),
  ));
}

// Grabing shared data in varibales
Future<dynamic> getValidationData() async {
  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();

  var obtainType = sharedPreferences.getString("type");

  print(obtainType);

  accountType = obtainType;
  return accountType;
}

class MyApp extends StatelessWidget {
  final String initialRoute;

  const MyApp({
    Key? key,
    required this.initialRoute,
  }) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: Color.fromARGB(255, 250, 250, 250),
          foregroundColor: Colors.black,
        ),
        primarySwatch: Colors.deepPurple,
        fontFamily: GoogleFonts.poppins().fontFamily,
      ),
      initialRoute: "/",
      routes: {
        "/": ((context) => GetLocatin()),
        FeedFoodRoutes().splashRoute: (context) => SplashScreen(),
        FeedFoodRoutes().welcomeRoute: (context) => WelcomePage(),
        FeedFoodRoutes().loginRoute: (context) => LoginPage(),
        FeedFoodRoutes().registerRoute: (context) => RegisterPage(),
        FeedFoodRoutes().registerNgo: (context) => RegisterNgo(),
        FeedFoodRoutes().registerUser: (context) => RegisterUser(),
        FeedFoodRoutes().ForgotPassword: (context) => ForgotPassword(),
        FeedFoodRoutes().OtpPage: (context) => OtpPage(),
        FeedFoodRoutes().Walkthrough: (context) => Walkthrough(),
        FeedFoodRoutes().SetPass: (context) => SetPass(),
        FeedFoodRoutes().nHomePage: (context) => nHomePage(),
        FeedFoodRoutes().vMainRoute: (context) => VMainPage(),
        FeedFoodRoutes().nMainRoute: (context) => NMain(),
      },
    );
  }
}

// http://10.0.2.2/feedfood/authentication/login.php