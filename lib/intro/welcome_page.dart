//Author : Prachi Nathjogi

import 'package:feed_food/utils/routes.dart';
import 'package:feed_food/widgets/sheet.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),

            // Text for topleft corner
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                alignment: Alignment.topLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Welcome",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 26,
                      ),
                    ),
                    Text(
                      "Start your helping journey",
                      style: TextStyle(color: Colors.black, fontSize: 14),
                    ),
                  ],
                ),
              ),
            ),

            // Code for background images
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/welcm1.png"),
                    fit: BoxFit.contain),
              ),
              height: 350,
              child: Padding(
                padding: const EdgeInsets.all(200.0),
                child: Column(children: []),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/welcm2.png"),
                    fit: BoxFit.cover),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 150, horizontal: 50),
                child: Column(
                  children: [
                    SizedBox(
                      height: 60,
                      width: 300,
                      child: ElevatedButton(
                        onPressed: (() => Navigator.pushNamed(
                            context, FeedFoodRoutes().loginRoute)),
                        child: Text(
                          "Sign In",
                          style: TextStyle(fontSize: 24),
                        ),
                        style: ElevatedButton.styleFrom(
                            primary: Colors.deepPurple[900],
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            )),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 60,
                      width: 300,
                      child: ElevatedButton(
                        onPressed: (() => showModalBottomSheet(
                            context: context,
                            builder: ((context) =>
                                FeedFoodSheet().buildSheet(context)),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(20))))),
                        child: Text(
                          "Sign Up",
                          style: TextStyle(fontSize: 24, color: Colors.black),
                        ),
                        style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            )),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}










