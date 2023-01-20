// Author: Digambar Chaudhari

import 'package:feed_food/utils/routes.dart';
import 'package:feed_food/widgets/btn.dart';
import 'package:feed_food/widgets/sheet.dart';
import 'package:feed_food/widgets/text_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _loginFormKey = GlobalKey<FormState>();

  authenticate(BuildContext context) {
    if (_loginFormKey.currentState!.validate()) {
      Navigator.pushNamed(context, FeedFoodRoutes().homeRoute);
    } else {
      print(_loginFormKey.currentState?.validate());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Form(
            key: _loginFormKey,
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Image.asset(
                  "assets/images/login.png",
                  height: 300,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Login to account",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                  child: Column(
                    children: [
                      FoodTextField().buildEmail(),
                      SizedBox(
                        height: 20,
                      ),
                      FoodTextField().buildPassword(),
                      SizedBox(
                        height: 10,
                      ),
                      Btn().buildForgotBtn(
                          // Function as paramenter
                          onClick: () => Navigator.pushNamed(
                              context, FeedFoodRoutes().ForgotPassword)),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 60,
                        width: 360,
                        child: ElevatedButton(
                          onPressed: (() => authenticate(context)),
                          child: Text(
                            "Login",
                            style: TextStyle(fontSize: 24),
                          ),
                          style: ElevatedButton.styleFrom(
                              primary: Colors.deepPurple[400],
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              )),
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Btn().buildRegisterbtBtn(
                        onClick: () => showModalBottomSheet(
                            context: context,
                            builder: ((context) =>
                                FeedFoodSheet().buildSheet()),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(20)))),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    super.initState();
  }
}
