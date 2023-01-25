//author : Bhavesh Patil
//date 17/01/2023

import 'package:feed_food/utils/routes.dart';
import 'package:feed_food/widgets/btn.dart';
import 'package:feed_food/widgets/text_fields.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatelessWidget {
  // Conroller
  var _email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            SizedBox(
              height: 10,
            ),
            Image.asset(
              "assets/images/forgot_pass.png",
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              alignment: Alignment.center,
              // forgotpasswordUYR (2:682)

              child: Text(
                'Forgot Password?',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 20,
                horizontal: 15,
              ),
              child: Text(
                "Don’t worry ! It happens. Please enter the Email id we will send the OTP on this Email.",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Colors.black54,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),
              child: FoodTextField().buildEmail(_email),
            ),
            SizedBox(height: 25),
            SizedBox(
              height: 50,
              width: 320,
              child: ElevatedButton(
                onPressed: (() =>
                    Navigator.pushNamed(context, FeedFoodRoutes().OtpPage)),
                child: Text(
                  "Continue",
                  style: TextStyle(fontSize: 24),
                ),
                style: ElevatedButton.styleFrom(
                    primary: Colors.deepPurple[300],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
