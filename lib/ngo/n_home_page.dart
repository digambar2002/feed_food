import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:flutter_inner_drawer/inner_drawer.dart';

import '../../utils/strings.dart';

class nHomePage extends StatelessWidget {
  const nHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          FeedFoodStrings.BrandName,
          style: GoogleFonts.dancingScript(
              fontWeight: FontWeight.w900, fontSize: 26),
        ),
        automaticallyImplyLeading: false,
        elevation: 0,
      ),
      body: Stack(
        children: <Widget>[
              Container(
                 height: 300,
                 width: 600,
                decoration: BoxDecoration(color: Color.fromARGB(255, 164, 116, 247)),
              ),
              
              Column(
                children:<Widget> [
                   Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              alignment: Alignment.topLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Welcome",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    "NGO Name",
                    style: TextStyle(color: Colors.white,
                     fontSize: 18),
                  ),
                ], 
              ),
            ),
          ),
          Expanded(child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: GridView.count(
              crossAxisCount: 3,
              childAspectRatio: 0.85,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            children:<Widget> [
              ReqStatusCard(),
              ReqStatusCard(),
              ReqStatusCard(),
            ],
            ),
          ),
          ),
         ],
        )
       ],
     ),
    );
  }
}

class ReqStatusCard extends StatelessWidget {
  const ReqStatusCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(color: Colors.white,
      borderRadius: BorderRadius.circular(13),
      ),
      child: Column(
        children: <Widget>[
          Spacer(),
          Text(
            "Food Request",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black,
             fontSize: 10, 
             fontWeight: FontWeight.bold),

          )
        ],
      ),
    );
  }
}
