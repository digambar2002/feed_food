// Author: Digambar Chaudhari

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:feed_food/models/login_model.dart';
import 'package:feed_food/utils/routes.dart';
import 'package:feed_food/widgets/btn.dart';
import 'package:feed_food/widgets/sheet.dart';
import 'package:feed_food/widgets/text_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                      color: Colors.deepPurple[400]),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                  child: Column(
                    children: [
                      FoodTextField().buildText("username or email", _username),
                      SizedBox(
                        height: 20,
                      ),
                      BuildPassword(controller_name: _password),
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
                        height: 50,
                        width: 360,
                        child: ElevatedButton(
                          onPressed: (() async {
                            await authenticate(context);
                          }),
                          child: Text(
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
                      SizedBox(
                        height: 40,
                      ),
                      Btn().buildRegisterbtBtn(
                        onClick: () => showModalBottomSheet(
                            context: context,
                            builder: ((context) =>
                                FeedFoodSheet().buildSheet(context)),
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

  // login authenticate method
  Future authenticate(BuildContext context) async {
    // checking form is correct
    if (_loginFormKey.currentState!.validate()) {
      // sending data to login model and collecting response
      dynamic reponse =
          await LoginModel().LoginUser(_username.text, _password.text);

      print(reponse['type']);
      // check user type
      if (reponse['success'] == true && reponse['type'] == 'volunteer') {
        final SharedPreferences sharedPreferences =
            await SharedPreferences.getInstance();

        sharedPreferences.setString("accountNo", reponse['accountNo']);
        sharedPreferences.setString("type", reponse['type']);

        Navigator.pushNamed(context, FeedFoodRoutes().vHomeRoute);
      } else if (reponse['success'] == true && reponse['type'] == 'ngo') {
        final SharedPreferences sharedPreferences =
            await SharedPreferences.getInstance();

        sharedPreferences.setString("accountNo", reponse['accountNo']);
        sharedPreferences.setString("type", reponse['type']);

        Navigator.pushNamed(context, FeedFoodRoutes().nHomeRoute);
      } else {
        AwesomeDialog(
          context: context,
          dialogType: DialogType.error,
          animType: AnimType.scale,
          title: 'Error !',
          desc: reponse['success'].toString(),
          btnOkOnPress: (() => null),
        ).show();
      }
    } else {
      print(_loginFormKey.currentState?.validate());
    }
  }
}
