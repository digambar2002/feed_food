import 'package:feed_food/utils/globals.dart';
import 'package:feed_food/widgets/cards.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_browser/flutter_web_browser.dart';
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
                icon: const Icon(Icons.notifications_outlined),
              ),
              IconButton(
                onPressed: (() {
                  print(isTypeSet);
                }),
                icon: const Icon(Icons.volunteer_activism_outlined),
              ),
            ],
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            const Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                child: VHomeCard()),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Donate",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.blueGrey[900]),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TileCrad(
                  title_text: "Food",
                  image_url: "assets/images/v_home_icon_1.png",
                  openUrl: FeedFoodStrings.ngo_url1,
                ),
                TileCrad(
                  title_text: "Education",
                  image_url: "assets/images/v_home_icon_2.png",
                  openUrl: FeedFoodStrings.ngo_url2,
                ),
                TileCrad(
                  title_text: "Water",
                  image_url: "assets/images/v_home_icon_3.png",
                  openUrl: FeedFoodStrings.ngo_url3,
                ),
                TileCrad(
                  title_text: "Clothes",
                  image_url: "assets/images/v_home_icon_4.png",
                  openUrl: FeedFoodStrings.ngo_url4,
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Lates Update",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.blueGrey[900]),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: NewsCards(),
            ),
          ],
        ),
      ),
    );
  }
}
