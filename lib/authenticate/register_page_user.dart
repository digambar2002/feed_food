// Author: Digambar Chaudhari

import 'dart:convert';
import 'package:feed_food/utils/routes.dart';
import 'package:feed_food/widgets/btn.dart';
import 'package:feed_food/widgets/text_fields.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RegisterUser extends StatefulWidget {
  RegisterUser({super.key});

  @override
  State<RegisterUser> createState() => _RegisterUserState();
}

class _RegisterUserState extends State<RegisterUser> {
  var _username = TextEditingController();

  var _email = TextEditingController();

  var _phone_no = TextEditingController();

  var _password = TextEditingController();

  final _RegisterFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(children: [
          SizedBox(
            height: 2,
          ),
          Image.asset(
            "assets/images/register.png",
            height: 250,
          ),
          SizedBox(
            height: 2,
          ),
          Text(
            "Create Account",
            style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w800,
                color: Colors.deepPurple[400]),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
            child: Form(
              key: _RegisterFormKey,
              child: Column(
                children: [
                  FoodTextField().buildTextUsername(_username),
                  SizedBox(
                    height: 10,
                  ),
                  FoodTextField().buildEmail(_email),
                  SizedBox(
                    height: 10,
                  ),
                  FoodTextField().buildPhone(_phone_no),
                  SizedBox(
                    height: 10,
                  ),
                  FoodTextField().buildPassword(_password),
                ],
              ),
            ),
          ),
          SizedBox(height: 35),
          SizedBox(
            height: 60,
            width: 360,
            child: ElevatedButton(
              onPressed: (() => signup(context)),
              child: Text(
                "Sign Up",
                style: TextStyle(fontSize: 24),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.deepPurple[300],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Btn().buildLoginBtn(
              onClick: () =>
                  Navigator.pushNamed(context, FeedFoodRoutes().loginRoute))
        ]),
      ),
    );
  }

  Future<void> signup(BuildContext context) async {
    if (_RegisterFormKey.currentState!.validate()) {
      // String uri =
      //     "https://skyibnk.000webhostapp.com/feedfood/authentication/register.php";
      String uri = "http://10.0.2.2/feedfood/authentication/register.php";

      // print(_username.text);
      // print(_email.text);
      // print(_password.text);
      // print(_phone_no.text);

      try {
        http.Response res = await http.post(Uri.parse(uri), body: {
          'username': _username.text,
          'email': _email.text,
          'phone': _phone_no.text,
          'password': _password.text
        });

        var response = jsonDecode(res.body);
        if (res.body.isNotEmpty) {
          response = json.decode(res.body);
        }
        if (response['success'] == true) {
          print("record added");
        } else {
          print("wrong something");
        }
      } catch (e) {
        print(e);
      }

      // Navigator.pushNamed(context, FeedFoodRoutes().loginRoute);
    }
  }
}
