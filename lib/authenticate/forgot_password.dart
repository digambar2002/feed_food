//author : Bhavesh Patil
//date 17/01/2023

import 'dart:math';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:feed_food/models/forgot_pass_model.dart';
import 'package:feed_food/utils/routes.dart';
import 'package:feed_food/widgets/btn.dart';
import 'package:feed_food/widgets/text_fields.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ForgotPassword extends StatefulWidget {
  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  // Conroller
  var _email = TextEditingController();
  var _mail_error = null;

  final _ForgotFormKey = GlobalKey<FormState>();

  Future authenticate(BuildContext context) async {
    if (_ForgotFormKey.currentState!.validate()) {
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: ((context) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }));
      var response = await ForgotPasswordModel().emailValidation(_email.text);

      if (response == true) {
        _mail_error = null;
        setState(() {});

        // generating otp
        var otp = Random().nextInt(9000) + 1000;

        var emailResponse =
            await ForgotPasswordModel().sendMail(_email.text, otp.toString());

        if (emailResponse == true) {
          print(emailResponse);
          // storing otp in shared preferences
          final SharedPreferences sharedPreferences =
              await SharedPreferences.getInstance();
          sharedPreferences.setString("forgotPassOtp", otp.toString());
          sharedPreferences.setString("forgotEmail", _email.text);
          Navigator.of(context).pop();
          Navigator.pushNamed(context, FeedFoodRoutes().OtpPage);
        } else {
          AwesomeDialog(
            context: context,
            dialogType: DialogType.error,
            animType: AnimType.scale,
            title: 'Error !',
            desc: "please check internet connection or try after some time",
            btnOkOnPress: (() => null),
          ).show();
        }

        return true;
      }
      Navigator.of(context).pop();
      _mail_error = "email not found !";
      setState(() {});
      return false;
    } else {
      print(_ForgotFormKey.currentState?.validate());
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: _ForgotFormKey,
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
                  child: FoodTextField().buildEmail(_email, _mail_error),
                ),
                SizedBox(height: 25),
                SizedBox(
                  height: 50,
                  width: 320,
                  child: ElevatedButton(
                    onPressed: ((() async {
                      await authenticate(context);
                    })),
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
        ),
      ),
    );
  }
}
