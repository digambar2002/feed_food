import 'package:feed_food/utils/globals.dart';
import 'package:feed_food/widgets/cards.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/strings.dart';

class VHomePage extends StatelessWidget {
  const VHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          FeedFoodStrings.BrandName,
          style: GoogleFonts.dancingScript(
              fontWeight: FontWeight.w900,
              fontSize: 28,
              color: Colors.deepPurple[500]),
        ),

        // to remove arrow
        automaticallyImplyLeading: false,
        elevation: 0,
        actions: [
          Row(
            children: [
              IconButton(
                onPressed: (() {
                  print("hello");
                }),
                icon: Icon(Icons.notifications_outlined),
              ),
              IconButton(
                onPressed: (() {
                  print(isTypeSet);
                }),
                icon: Icon(Icons.volunteer_activism_outlined),
              ),
            ],
          )
        ],
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: VHomeCard()),
        ],
      )),
    );
  }
}
