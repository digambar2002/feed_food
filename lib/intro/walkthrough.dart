//Author : Prachi Nathjogi
//Date : 19-01-23

import 'package:flutter/material.dart';

class Walkthrough extends StatelessWidget {
  const Walkthrough({super.key});

  @override
  Widget build(BuildContext context) {
    PageController _controller = PageController();
    return Scaffold(
      body: PageView(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/walk1.png"),
                  fit: BoxFit.fill),
            ),
            child: Column(),
          ),
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/walk2.png"),
                  fit: BoxFit.fill),
            ),
            child: Column(),
          ),
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/walk3.png"),
                  fit: BoxFit.fill),
            ),
            child: Column(),
          ),
        ],
      ),
    );
  }
}
