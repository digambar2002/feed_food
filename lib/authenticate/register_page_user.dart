// Author: Digambar Chaudhari

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:feed_food/models/register_model.dart';
import 'package:feed_food/utils/routes.dart';
import 'package:feed_food/widgets/btn.dart';

import 'package:feed_food/widgets/text_fields.dart';
import 'package:flutter/material.dart';

class RegisterUser extends StatefulWidget {
  const RegisterUser({super.key});

  @override
  State<RegisterUser> createState() => _RegisterUserState();
}

class _RegisterUserState extends State<RegisterUser> {
  final _username = TextEditingController();

  final _email = TextEditingController();

  final _phone_no = TextEditingController();

  final _password = TextEditingController();

  final _RegisterFormKey = GlobalKey<FormState>();

  var username_error;
  var email_error;
  var phone_error;

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
              "assets/images/new.png",
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
                  signup(context);
                }),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple[300],
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

      var usernameCheck =
          await RegisterUserModel().usernameValidation(_username.text);

      // checking email is in database or not
      var emailCheck = await RegisterUserModel().emailValidation(_email.text);
      // cheking phone no in database or not
      var phoneCheck =
          await RegisterUserModel().phoneValidation(_phone_no.text);
      // ignore: use_build_context_synchronously
      Navigator.of(context).pop();
      if (usernameCheck != true) {
        username_error = usernameCheck;
        setState(() {});
      } else {
        if (emailCheck != true) {
          email_error = emailCheck;
          setState(() {});
        } else {
          email_error = null;
          setState(() {});
        }
        if (phoneCheck != true) {
          phone_error = phoneCheck;
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
          // ignore: use_build_context_synchronously
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
          // ignore: use_build_context_synchronously
          Navigator.of(context).pop();
          return false;
        }
      }
    }
    return false;
  }
}
