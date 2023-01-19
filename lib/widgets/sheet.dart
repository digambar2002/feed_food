// Author: Digambar Chaudhari
// Date: 18-01-2023

import 'package:flutter/material.dart';

class FeedFoodSheet {
  Widget buildSheet() => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      CircleAvatar(
                        radius: 70,
                        child: Image.asset("assets/images/ngo.png"),
                      ),
                      Text("NGO")
                    ],
                  ),
                  Container(
                    height: 100,
                    child: const VerticalDivider(
                      color: Colors.black54,
                      thickness: 1,
                      width: 20,
                    ),
                  ),
                  Column(
                    children: [
                      CircleAvatar(
                        radius: 70,
                        child: Image.asset("assets/images/ngo.png"),
                      ),
                      Text("Volenteer")
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      );
}
