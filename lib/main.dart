// Author: Digambar Chaudhari
// Author: Renuka Nathjogi
// Author: Bhavesh Patil

import 'package:feed_food/authenticate/otp_verify.dart';
import 'package:feed_food/authenticate/forgot_password.dart';
import 'package:feed_food/authenticate/set_password.dart';
import 'package:feed_food/authenticate/register_page_user.dart';
import 'package:feed_food/intro/splash_screen.dart';
import 'package:feed_food/intro/walkthrough.dart';
import 'package:feed_food/intro/welcome_page.dart';
import 'package:feed_food/ngo/n_home_page.dart';
import 'package:feed_food/ngo/n_main_page.dart';
import 'package:feed_food/ngo/n_notification.dart';
import 'package:feed_food/ngo/profile/body.dart';
import 'package:feed_food/authenticate/login_page.dart';
import 'package:feed_food/authenticate/register_page.dart';
import 'package:feed_food/authenticate/register_page_ngo.dart';
<<<<<<< HEAD
import 'package:feed_food/ngo/profile/n_edit_profile.dart';
import 'package:feed_food/ngo/profile/profilemenu.dart';
=======
import 'package:feed_food/utils/globals.dart';
>>>>>>> 24f14f1210cfd17944226c8df73c94db8e32d552
import 'package:feed_food/utils/routes.dart';
import 'package:feed_food/utils/strings.dart';
import 'package:feed_food/volunteer/home/v_home_page.dart';
import 'package:feed_food/volunteer/v_main_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart';

<<<<<<< HEAD

=======
import 'models/news_model.dart';
>>>>>>> 24f14f1210cfd17944226c8df73c94db8e32d552

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
<<<<<<< HEAD
      initialRoute: FeedFoodRoutes().nHomePage,
      
=======
      initialRoute: FeedFoodRoutes().splashRoute,
>>>>>>> 24f14f1210cfd17944226c8df73c94db8e32d552
      routes: {
        "/": ((context) {
          print(isTypeSet);
          if (isTypeSet == true) {
            if (UserType == "volunteer") {
              return VMainPage();
            } else {
              return NHomePage();
            }
          }
          return LoginPage();
        }),
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
<<<<<<< HEAD
        FeedFoodRoutes().vDonateRoute: (context) => VDonate(),
        FeedFoodRoutes().nMainRoute: (context) =>NMain(),
        FeedFoodRoutes().nNotification: (context) =>NotificationPage(),
        FeedFoodRoutes().nEditProfile: (context) =>nEditProfile(),
        FeedFoodRoutes().nBody: (context) => nBody(),
        


=======
>>>>>>> 24f14f1210cfd17944226c8df73c94db8e32d552
      },
    );
  }
}



// http://10.0.2.2/feedfood/authentication/login.php