// Author: Digambar Chaudhari

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:feed_food/models/login_model.dart';
import 'package:feed_food/utils/routes.dart';
import 'package:feed_food/widgets/btn.dart';
import 'package:feed_food/widgets/sheet.dart';
import 'package:feed_food/widgets/text_fields.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/globals.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // controller for login filed

  var _username = TextEditingController();
  var _password = TextEditingController();

  final _loginFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Form(
              key: _loginFormKey,
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Image.asset(
                    "assets/images/login.png",
                    height: 300,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Login to account",
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w800,
                        color: Colors.deepPurple[400]),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25, vertical: 10),
                    child: Column(
                      children: [
                        FoodTextField()
                            .buildText("username or email", _username),
                        const SizedBox(
                          height: 20,
                        ),
                        BuildPassword(controller_name: _password),
                        const SizedBox(
                          height: 10,
                        ),
                        Btn().buildForgotBtn(
                            // Function as paramenter
                            onClick: () => Navigator.pushNamed(
                                context, FeedFoodRoutes().ForgotPassword)),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          height: 50,
                          width: 360,
                          child: ElevatedButton(
                            onPressed: (() async {
                              await authenticate(context);
                            }),
                            // ignore: sort_child_properties_last
                            child: const Text(
                              "Login",
                              style: TextStyle(fontSize: 24),
                            ),
                            style: ElevatedButton.styleFrom(
                                primary: Colors.deepPurple[400],
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                )),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Btn().buildRegisterbtBtn(
                          onClick: () => showModalBottomSheet(
                              context: context,
                              builder: ((context) =>
                                  FeedFoodSheet().buildSheet(context)),
                              shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(20)))),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )),
      ),
    );
  }

  // login authenticate method
  Future authenticate(BuildContext context) async {
    // checking form is correct
    if (_loginFormKey.currentState!.validate()) {
      // sending data to login model and collecting response

      showDialog(
          context: context,
          barrierDismissible: false,
          builder: ((context) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }));

      dynamic response =
          await LoginModel().LoginUser(_username.text, _password.text);

      // check user type
      if (response['success'] == true && response['type'] == 'volunteer') {
        final SharedPreferences sharedPreferences =
            await SharedPreferences.getInstance();
        // print(response['username']);
        sharedPreferences.setString("accountNo", response['accountNo']);
        sharedPreferences.setString("type", response['type']);
        sharedPreferences.setString("username", response['username']);

        // Setting Globals
        UserUsername = response['username'];
        UserAccountNo = response['accountNo'];
        UserType = response['type'];

        Navigator.of(context).pop();
        Navigator.pushNamedAndRemoveUntil(
            context, FeedFoodRoutes().vMainRoute, (r) => false);
      } else if (response['success'] == true && response['type'] == 'ngo') {
        final SharedPreferences sharedPreferences =
            await SharedPreferences.getInstance();

        sharedPreferences.setString("accountNo", response['accountNo']);
        sharedPreferences.setString("type", response['type']);
        sharedPreferences.setString("username", response['username']);
        Navigator.of(context).pop();
        Navigator.pushNamedAndRemoveUntil(
            context, FeedFoodRoutes().nMainRoute, (r) => false);
      } else {
        Navigator.of(context).pop();
        AwesomeDialog(
          context: context,
          dialogType: DialogType.error,
          animType: AnimType.scale,
          title: 'Error !',
          desc: response['success'].toString(),
          btnOkOnPress: (() => null),
        ).show();
      }
    } else {
      print(_loginFormKey.currentState?.validate());
    }
  }
}
