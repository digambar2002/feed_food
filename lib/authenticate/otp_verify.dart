import 'dart:math';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:feed_food/utils/routes.dart';
import 'package:feed_food/widgets/btn.dart';
import 'package:feed_food/widgets/text_fields.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/forgot_pass_model.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({super.key});

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  final _OtpKey = GlobalKey<FormState>();

  final _pin1 = TextEditingController();
  final _pin2 = TextEditingController();
  final _pin3 = TextEditingController();
  final _pin4 = TextEditingController();

  var _otp_error = "";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _OtpKey,
            child: Column(children: [
              const SizedBox(
                height: 5,
              ),
              Image.asset(
                "assets/images/OTP.png",
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Verification',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(
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
                        style: const TextStyle(color: Colors.red, fontSize: 12),
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
                    Row(
                      children: [
                        TweenAnimationBuilder(
                            tween: Tween(begin: 30.0, end: 0),
                            duration: const Duration(seconds: 30),
                            builder: ((context, value, child) => Row(
                                  children: [
                                    Btn().buildResendBtn(
                                        onClick: () async => value.toInt() == 0
                                            ? await sendOtp()
                                            : null),
                                    Text(
                                      "00:${value.toInt()}",
                                      style:
                                          TextStyle(color: Colors.purple[400]),
                                    ),
                                  ],
                                )))
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 25),
              SizedBox(
                height: 60,
                width: 360,
                child: ElevatedButton(
                  onPressed: ((() async {
                    await validate();
                  })),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple[300],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      )),
                  child: const Text(
                    "Verify",
                    style: TextStyle(fontSize: 24),
                  ),
                ),
              ),
            ]),
          ),
        ),
      )),
    );
  }

  Future validate() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var otp = sharedPreferences.getString("forgotPassOtp");
    var enterOtp = _pin1.text + _pin2.text + _pin3.text + _pin4.text;

    if (enterOtp.isNotEmpty) {
      _otp_error = "";
      setState(() {});

      if (enterOtp == otp) {
        sharedPreferences.remove("forgotPassOtp");
        // ignore: use_build_context_synchronously
        Navigator.pushReplacementNamed(context, FeedFoodRoutes().SetPass);
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
          return const Center(
            child: CircularProgressIndicator(),
          );
        }));
    var otp = Random().nextInt(9000) + 1000;
    var email = sharedPreferences.getString("forgotEmail");
    var emailResponse =
        await ForgotPasswordModel().sendMail(email, otp.toString());

    if (emailResponse == true) {
      // storing otp in shared preferences
      final SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      sharedPreferences.setString("forgotPassOtp", otp.toString());
      // ignore: use_build_context_synchronously
      Navigator.of(context).pop();
      setState(() {});
    } else {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.error,
        animType: AnimType.scale,
        title: 'Error !',
        desc: "please check internet connection or try after some time",
        // ignore: avoid_returning_null_for_void
        btnOkOnPress: (() => null),
      ).show();
      setState(() {});
    }

    return true;
  }
}
