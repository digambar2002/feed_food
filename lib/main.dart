// Author: Digambar Chaudhari
// Author: Prachi Nathjogi
// Author: Bhavesh Patil

import 'package:feed_food/authenticate/otp_verify.dart';
import 'package:feed_food/authenticate/forgot_password.dart';
import 'package:feed_food/authenticate/set_password.dart';
import 'package:feed_food/authenticate/register_page_user.dart';
import 'package:feed_food/intro/splash_screen.dart';
import 'package:feed_food/intro/walkthrough.dart';
import 'package:feed_food/intro/welcome_page.dart';
import 'package:feed_food/ngo/n_home_page.dart';
import 'package:feed_food/pages/home_page.dart';
import 'package:feed_food/authenticate/login_page.dart';
import 'package:feed_food/authenticate/register_page.dart';
import 'package:feed_food/authenticate/register_page_ngo.dart';
import 'package:feed_food/utils/routes.dart';
import 'package:feed_food/volunteer/v_home_page.dart';
import 'package:feed_food/volunteer/v_main_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Color.fromARGB(255, 250, 250, 250),
      statusBarIconBrightness: Brightness.dark));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
      initialRoute: FeedFoodRoutes().registerUser,
      routes: {
        "/": (context) => LoginPage(),
        FeedFoodRoutes().splashRoute: (context) => SplashScreen(),
        FeedFoodRoutes().welcomeRoute: (context) => WelcomePage(),
        FeedFoodRoutes().homeRoute: (context) => HomePage(),
        FeedFoodRoutes().loginRoute: (context) => LoginPage(),
        FeedFoodRoutes().registerRoute: (context) => RegisterPage(),
        FeedFoodRoutes().registerNgo: (context) => RegisterNgo(),
        FeedFoodRoutes().registerUser: (context) => RegisterUser(),
        FeedFoodRoutes().ForgotPassword: (context) => ForgotPassword(),
        FeedFoodRoutes().OtpPage: (context) => OtpPage(),
        FeedFoodRoutes().Walkthrough: (context) => Walkthrough(),
        FeedFoodRoutes().SetPass: (context) => SetPass(),
        FeedFoodRoutes().nHomeRoute: (context) => NHomePage(),
        FeedFoodRoutes().vMainRoute: (context) => VMainPage(),
      },
    );
  }
}



// http://10.0.2.2/feedfood/authentication/login.php