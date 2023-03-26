// ignore_for_file: public_member_api_docs, sort_constructors_first
// Author: Digambar Chaudhari
// Author: Renuka Nathjogi
// Author: Bhavesh Patil

import 'dart:async';

import 'package:feed_food/utils/globals.dart';
import 'package:feed_food/volunteer/history/v_history_page.dart';
import 'package:feed_food/volunteer/profile/v_edit_profile.dart';
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
// ignore: unused_import
import 'package:feed_food/ngo/home/n_home_page.dart';
import 'package:feed_food/ngo/n_main_page.dart';
import 'package:feed_food/utils/routes.dart';
import 'package:feed_food/volunteer/v_main_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Color.fromARGB(255, 250, 250, 250),
      statusBarIconBrightness: Brightness.dark));

  var reponse = await getValidationData();

  setType() {
    if (reponse[0] == "volunteer") {
      return FeedFoodRoutes().vMainRoute;
    } else if (reponse[0] == "ngo") {
      return FeedFoodRoutes().nMainRoute;
    } else if (reponse[1] == null) {
      return FeedFoodRoutes().Walkthrough;
    }
    return FeedFoodRoutes().welcomeRoute;
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
  var obtainAccountNo = sharedPreferences.getString("accountNo");
  var obtainUsername = sharedPreferences.getString("username");
  var walkthrough = sharedPreferences.getString("walkthrough");

  UserType = obtainType;
  UserAccountNo = obtainAccountNo;
  UserUsername = obtainUsername;

  return [obtainType, walkthrough];
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
        appBarTheme: const AppBarTheme(
          color: Color.fromARGB(255, 250, 250, 250),
          foregroundColor: Colors.black,
        ),
        primarySwatch: Colors.deepPurple,
        fontFamily: GoogleFonts.poppins().fontFamily,
      ),
      initialRoute: initialRoute,
      routes: {
        FeedFoodRoutes().splashRoute: (context) => const SplashScreen(),
        FeedFoodRoutes().welcomeRoute: (context) => const WelcomePage(),
        FeedFoodRoutes().loginRoute: (context) => const LoginPage(),
        FeedFoodRoutes().registerRoute: (context) => const RegisterPage(),
        FeedFoodRoutes().registerNgo: (context) => const RegisterNgo(),
        FeedFoodRoutes().registerUser: (context) => const RegisterUser(),
        FeedFoodRoutes().ForgotPassword: (context) => const ForgotPassword(),
        FeedFoodRoutes().OtpPage: (context) => const OtpPage(),
        FeedFoodRoutes().Walkthrough: (context) => const Walkthrough(),
        FeedFoodRoutes().SetPass: (context) => const SetPass(),
        FeedFoodRoutes().nMainRoute: (context) => const NMain(),
        FeedFoodRoutes().vMainRoute: (context) => const VMainPage(),
        FeedFoodRoutes().nMainRoute: (context) => const NMain(),
        FeedFoodRoutes().vHistory: (context) => const VHistory(),
        FeedFoodRoutes().vEditProfile: (context) => VEditProfile(),
      },
    );
  }
}

// http://10.0.2.2/feedfood/authentication/login.php