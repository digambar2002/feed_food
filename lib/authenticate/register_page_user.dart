// Author: Digambar Chaudhari

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:feed_food/models/register_model.dart';
import 'package:feed_food/utils/routes.dart';
import 'package:feed_food/widgets/btn.dart';

import 'package:feed_food/widgets/text_fields.dart';
import 'package:flutter/material.dart';

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

  var username_error = null;
  var email_error = null;
  var phone_error = null;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(children: [
            const SizedBox(
              height: 2,
            ),
            Image.asset(
              "assets/images/new.jpg",
              height: 250,
            ),
            const SizedBox(
              height: 2,
            ),
            Text(
              "Create Account",
              style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w800,
                  color: Colors.deepPurple[400]),
            ),
            const SizedBox(
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
                    FoodTextField().buildTextUsername(
                        _username, username_error, "username"),
                    const SizedBox(
                      height: 10,
                    ),
                    FoodTextField().buildEmail(_email, email_error),
                    const SizedBox(
                      height: 10,
                    ),
                    FoodTextField().buildPhone(_phone_no, phone_error),
                    const SizedBox(
                      height: 10,
                    ),
                    BuildPassword(controller_name: _password)
                  ],
                ),
              ),
            ),
            const SizedBox(height: 35),
            SizedBox(
              height: 60,
              width: 320,
              child: ElevatedButton(
                onPressed: (() async {
                  dynamic flag = await signup(context);
                }),
                style: ElevatedButton.styleFrom(
                  primary: Colors.deepPurple[300],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  "Sign Up",
                  style: TextStyle(fontSize: 24),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Btn().buildLoginBtn(
                onClick: () =>
                    Navigator.pushNamed(context, FeedFoodRoutes().loginRoute))
          ]),
        ),
      ),
    );
  }

  Future<bool> signup(BuildContext context) async {
    if (_RegisterFormKey.currentState!.validate()) {
      // Check username already in database

      showDialog(
          context: context,
          barrierDismissible: false,
          builder: ((context) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }));

      var username_check =
          await RegisterUserModel().usernameValidation(_username.text);

      // checking email is in database or not
      var email_check = await RegisterUserModel().emailValidation(_email.text);
      // cheking phone no in database or not
      var phone_check =
          await RegisterUserModel().phoneValidation(_phone_no.text);
      Navigator.of(context).pop();
      if (username_check != true) {
        username_error = username_check;
        setState(() {});
      } else {
        if (email_check != true) {
          email_error = email_check;
          setState(() {});
        } else {
          email_error = null;
          setState(() {});
        }
        if (phone_check != true) {
          phone_error = phone_check;
          setState(() {});
        } else {
          phone_error = null;
          setState(() {});
        }
        username_error = null;
        setState(() {});

        // inserting record in the database

        showDialog(
            context: context,
            barrierDismissible: false,
            builder: ((context) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }));

        dynamic flag = await RegisterUserModel().InsertVolunteerData(
            _username.text, _email.text, _phone_no.text, _password.text);
        if (flag == true) {
          Navigator.of(context).pop();
          AwesomeDialog(
            context: context,
            dialogType: DialogType.success,
            animType: AnimType.scale,
            title: 'Account Created Successfully',
            desc: 'Please Check Your Email To activate account',
            btnOkOnPress: () {
              Navigator.pushReplacementNamed(
                  context, FeedFoodRoutes().loginRoute);
            },
          ).show();
          return true;
        } else {
          Navigator.of(context).pop();
          return false;
        }
      }
    }
    return false;
  }
}
