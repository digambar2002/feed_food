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
                  print("hello");
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
            child: Container(
              height: 200,
              width: 400,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 155, 110, 246),
                    Color.fromARGB(255, 116, 182, 247)
                  ],
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                ),
              ),
              child: Row(
                children: [
                  Column(
                    children: [
                      Text("i am unstopable ....."),
                      TextButton(
                          onPressed: (() => print("hello world")),
                          child: Text("Donate"))
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }
}
