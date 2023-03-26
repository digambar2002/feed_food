//Author : Prachi Nathjogi

import 'package:feed_food/utils/routes.dart';
import 'package:feed_food/widgets/sheet.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),

              // Text for topleft corner
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  alignment: Alignment.topLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
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
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/welcm1.png"),
                      fit: BoxFit.contain),
                ),
                height: 350,
                child: Padding(
                  padding: const EdgeInsets.all(200.0),
                  child: Column(children: const []),
                ),
              ),
              Container(
                decoration: const BoxDecoration(
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
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.deepPurple[900],
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              )),
                          child: const Text(
                            "Sign In",
                            style: TextStyle(fontSize: 24),
                          ),
                        ),
                      ),
                      const SizedBox(
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
                              shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(20))))),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              )),
                          child: const Text(
                            "Sign Up",
                            style: TextStyle(fontSize: 24, color: Colors.black),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
