import 'package:feed_food/widgets/cards.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:flutter_inner_drawer/inner_drawer.dart';
import '../../utils/strings.dart';

class nHomePage extends StatelessWidget {
  const nHomePage({Key? key});

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
      ),
      body: Stack(
        children: <Widget>[
          Container(
            height: 280,
            width: 600,
            decoration:
                BoxDecoration(color: Color.fromARGB(255, 164, 116, 247)),
          ),
          SafeArea(
              child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 5,
                ),
                Text(
                  "Welcome",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: 2,
                ),
                Text(
                  "NGO Name",
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Request Status",
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
                Expanded(
                  child: GridView.count(
                    crossAxisCount: 3,
                    childAspectRatio: .99,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15,
                    children: <Widget>[
                      ReqCards(
                        title1: "10",
                        title2: "Total",
                      ),
                      ReqCards(
                        title1: "6",
                        title2: "Pendding",
                      ),
                      ReqCards(title1: "4", title2: "Accepted"),
                    ],
                  ),
                ),
                Text(
                  "New Request",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                Text(
                  "New Request",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                Container(
                  height: 90,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(13),
                  ),
                  child: Row(
                    children: <Widget>[
                      Image(
                        image: AssetImage("assets/images/nHome1.png"),
                        fit: BoxFit.fill,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Muttor Paneer",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12),
                            ),
                            Text(
                              "5 KG",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w300),
                            ),
                            Text(
                              "Posted by Dream Resort",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 8,
                                  fontWeight: FontWeight.w300),
                            ),
                            Text(
                              "Location : Ramanand Nagar, Jalgaon",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 8,
                                  fontWeight: FontWeight.w300),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )),
        ],
      ),
    );
  }
}

class ReqCards extends StatelessWidget {
  final String title1;
  final String title2;

  const ReqCards({
    Key? key,
    required this.title1,
    required this.title2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: <Widget>[
          Spacer(),
          Text(
            title1,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 30,
            ),
          ),
          Spacer(),
          Text(
            title2,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
