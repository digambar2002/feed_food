//Author : Prachi Nathjogi
//Date : 19-01-23

import 'package:flutter/material.dart';

class Walkthrough extends StatelessWidget {
  const Walkthrough({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: [
          Container(
            color: Colors.blue,
          ),
          Container(
            color: Colors.amberAccent,
          ),
          Container(
            color: Colors.brown,
          ),
        ],
      ),
    );
  }
}
