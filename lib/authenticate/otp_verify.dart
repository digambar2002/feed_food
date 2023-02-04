import 'dart:math';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:feed_food/authenticate/forgot_password.dart';
import 'package:feed_food/utils/routes.dart';
import 'package:feed_food/widgets/btn.dart';
import 'package:feed_food/widgets/text_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/forgot_pass_model.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({super.key});

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  final _OtpKey = GlobalKey<FormState>();

  var _pin1 = TextEditingController();
  var _pin2 = TextEditingController();
  var _pin3 = TextEditingController();
  var _pin4 = TextEditingController();

  var _otp_error = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _OtpKey,
          child: Column(children: [
            SizedBox(
              height: 5,
            ),
            Image.asset(
              "assets/images/OTP.png",
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              // forgotpasswordUYR (2:682)

              child: Text(
                'Verification',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 5,
                horizontal: 25,
              ),
              child: Text(
                "Please provide us OTP sent on your Email",
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      FoodTextField().buildOtp(context, _pin1),
                      FoodTextField().buildOtp(context, _pin2),
                      FoodTextField().buildOtp(context, _pin3),
                      FoodTextField().buildOtp(context, _pin4),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    child: Text(
                      _otp_error,
                      style: TextStyle(color: Colors.red, fontSize: 12),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                      child: Row(
                    children: [
                      TweenAnimationBuilder(
                          tween: Tween(begin: 30.0, end: 0),
                          duration: Duration(seconds: 30),
                          builder: ((context, value, child) => Row(
                                children: [
                                  Btn().buildResendBtn(
                                      onClick: () async => value.toInt() == 0
                                          ? await sendOtp()
                                          : null),
                                  Text(
                                    "00:${value.toInt()}",
                                    style: TextStyle(color: Colors.purple[400]),
                                  ),
                                ],
                              )))
                    ],
                  )),
                ],
              ),
            ),
            SizedBox(height: 25),
            SizedBox(
              height: 60,
              width: 360,
              child: ElevatedButton(
                onPressed: ((() async {
                  await validate();
                })),
                child: Text(
                  "Verify",
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
    ));
  }

  Future validate() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var otp = sharedPreferences.getString("forgotPassOtp");
    var email = sharedPreferences.getString("forgotEmail");
    var enterOtp = _pin1.text + _pin2.text + _pin3.text + _pin4.text;

    if (enterOtp.isNotEmpty) {
      _otp_error = "";
      setState(() {});

      if (enterOtp == otp) {
        sharedPreferences.remove("forgotPassOtp");
        Navigator.pushNamed(context, FeedFoodRoutes().SetPass);
        return true;
      } else {
        _otp_error = "invalid otp entered";
        setState(() {});
        return false;
      }
    } else {
      _otp_error = "otp cannot be empty";
      setState(() {});
      return false;
    }
  }

  Future sendOtp() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    // generating otp
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: ((context) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }));
    var otp = Random().nextInt(9000) + 1000;
    var email = sharedPreferences.getString("forgotEmail");
    var emailResponse =
        await ForgotPasswordModel().sendMail(email, otp.toString());

    if (emailResponse == true) {
      print(emailResponse);
      // storing otp in shared preferences
      final SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      sharedPreferences.setString("forgotPassOtp", otp.toString());
      Navigator.of(context).pop();
      setState(() {});
    } else {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.error,
        animType: AnimType.scale,
        title: 'Error !',
        desc: "please check internet connection or try after some time",
        btnOkOnPress: (() => null),
      ).show();
      setState(() {});
    }

    return true;
  }
}
