//Author : Prachi Nathjogi
//Author : Digambar Chaudhari
//Date : 19-01-23

// ignore_for_file: unused_import

import 'package:feed_food/intro/welcome_page.dart';
import 'package:feed_food/utils/routes.dart';
import 'package:feed_food/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Walkthrough extends StatefulWidget {
  const Walkthrough({super.key});

  @override
  State<Walkthrough> createState() => _WalkthroughState();
}

class _WalkthroughState extends State<Walkthrough> {
// controller to keep track of which page we're on
  final PageController _controller = PageController();

// keep track of if we are on the last page or not
  bool onLastPage = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: SizedBox(
            height: 760,
            child: Stack(
              children: [
                PageView(
                  controller: _controller,
                  onPageChanged: (index) {
                    setState(
                      () {
                        onLastPage = (index == 2);
                      },
                    );
                  },
                  children: [
                    // container are the walkthrough pages.
                    Container(
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/images/walk1.png"),
                            fit: BoxFit.fill),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          children: const [
                            SizedBox(
                              height: 550,
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                FeedFoodStrings.Whead1,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            Text(
                              FeedFoodStrings.subtittle1,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14),
                            )
                          ],
                        ),
                      ),
                    ),

                    Container(
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/images/walk2.png"),
                            fit: BoxFit.fill),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          children: const [
                            SizedBox(
                              height: 550,
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                FeedFoodStrings.Whead2,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            Text(
                              FeedFoodStrings.subtittle2,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14),
                            )
                          ],
                        ),
                      ),
                    ),

                    Container(
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/images/walk3.png"),
                            fit: BoxFit.fill),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          children: const [
                            SizedBox(
                              height: 550,
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                FeedFoodStrings.Whead3,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            Text(
                              FeedFoodStrings.subtittle3,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

                //dot indicators
                Container(
                  alignment: const Alignment(0, 0.95),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //skip
                      GestureDetector(
                          onTap: () {
                            _controller.previousPage(
                                duration: const Duration(microseconds: 500),
                                curve: Curves.easeIn);
                          },
                          child: const Padding(
                            padding: EdgeInsets.all(25.0),
                            child: Text("Previous",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 14)),
                          )),

                      // dot indicator
                      SmoothPageIndicator(
                        controller: _controller,
                        count: 3,
                        axisDirection: Axis.horizontal,
                        effect: const SlideEffect(
                            radius: 9.0,
                            dotWidth: 8.0,
                            dotHeight: 8.0,
                            activeDotColor: Colors.white),
                      ),

                      //net or done
                      onLastPage
                          ? GestureDetector(
                              onTap: () async {
                                final SharedPreferences sharedPreferences =
                                    await SharedPreferences.getInstance();

                                sharedPreferences.setString(
                                    "walkthrough", 'true');
                                // ignore: use_build_context_synchronously
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return const WelcomePage();
                                    },
                                  ),
                                );
                              },
                              child: const Padding(
                                padding: EdgeInsets.all(25.0),
                                child: Text("Done",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 14)),
                              ))
                          : GestureDetector(
                              onTap: () {
                                _controller.nextPage(
                                    duration: const Duration(microseconds: 500),
                                    curve: Curves.easeIn);
                              },
                              child: const Padding(
                                padding: EdgeInsets.all(25.0),
                                child: Text("Next",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 14)),
                              )),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
