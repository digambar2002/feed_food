// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

Widget buildEmail() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      // Text(
      //   'Email',
      //   style: TextStyle(
      //     color: Colors.black87,
      //     fontWeight: FontWeight.bold,
      //   ),
      // ),
      SizedBox(
        height: 10,
      ),
      Container(
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
            color: Colors.black12,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.white,
                blurRadius: 0,
                offset: Offset(0, 2),
              )
            ]),
        height: 60,
        child: TextField(
          keyboardType: TextInputType.emailAddress,
          style: TextStyle(color: Colors.black),
          decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14),
              prefixIcon: Icon(
                Icons.email_outlined,
                color: Colors.black54,
              ),
              hintText: 'Email',
              hintStyle: TextStyle(color: Colors.black54)),
        ),
      )
    ],
  );
}

Widget buildPassword() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(
        height: 10,
      ),
      Container(
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
            color: Colors.black12,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.white,
                blurRadius: 0,
                offset: Offset(0, 2),
              )
            ]),
        height: 60,
        child: TextField(
          keyboardType: TextInputType.visiblePassword,
          style: TextStyle(color: Colors.black),
          obscureText: true,
          enableSuggestions: false,
          autocorrect: false,
          decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14),
              prefixIcon: Icon(
                Icons.lock_outline,
                color: Colors.black54,
              ),
              hintText: 'password',
              hintStyle: TextStyle(color: Colors.black54)),
        ),
      )
    ],
  );
}

Widget buildForgotBtn() {
  return Container(
    alignment: Alignment.centerRight,
    child: TextButton(
      onPressed: (() => print("forgot password")),
      child: Text(
        "forgot password ?",
        style: TextStyle(
          color: Colors.black54,
        ),
      ),
    ),
  );
}

Widget buildRegisterBtn() {
  return Container(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don’t have an account?",
          style: TextStyle(color: Colors.black54),
        ),
        TextButton(
          onPressed: (() => print("register button")),
          child: Text(
            "register here",
            style: TextStyle(
              color: Colors.black54,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ],
    ),
  );
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
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
                    buildEmail(),
                    SizedBox(
                      height: 20,
                    ),
                    buildPassword(),
                    SizedBox(
                      height: 10,
                    ),
                    buildForgotBtn(),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 60,
                      width: 360,
                      child: ElevatedButton(
                        onPressed: (() => print("login clicked")),
                        child: Text(
                          "Login",
                          style: TextStyle(fontSize: 24),
                        ),
                        style: ElevatedButton.styleFrom(
                            primary: Colors.deepPurple[300],
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            )),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    buildRegisterBtn(),
                  ],
                ),
              )
            ],
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
