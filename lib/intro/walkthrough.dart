//Author : Prachi Nathjogi
//Author : Digambar Chaudhari
//Date : 19-01-23

import 'package:feed_food/utils/routes.dart';
import 'package:feed_food/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Walkthrough extends StatefulWidget {
  const Walkthrough({super.key});

  @override
  State<Walkthrough> createState() => _WalkthroughState();
}

class _WalkthroughState extends State<Walkthrough> {
  @override
  Widget build(BuildContext context) {
    PageController _controller = PageController();
    return Scaffold(
      body: Stack(children: [
        PageView(
          controller: _controller,
          children: [
            // container are the walkthrough pages.

            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/walk1.png"),
                    fit: BoxFit.fill),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 650,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        FeedFoodStrings.Whead1,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                    ),
                    Text(
                      FeedFoodStrings.subtittle1,
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    )
                  ],
                ),
              ),
            ),

            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/walk2.png"),
                    fit: BoxFit.fill),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 650,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        FeedFoodStrings.Whead2,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                    ),
                    Text(
                      FeedFoodStrings.subtittle2,
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    )
                  ],
                ),
              ),
            ),

            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/walk3.png"),
                    fit: BoxFit.fill),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 650,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        FeedFoodStrings.Whead3,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                    ),
                    Text(
                      FeedFoodStrings.subtittle3,
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
        Container(
            alignment: Alignment(0, 0.95),
            child: SmoothPageIndicator(controller: _controller, count: 3)),
      ]),
    );
  }
}
