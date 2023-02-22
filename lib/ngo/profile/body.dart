import 'package:feed_food/ngo/profile/profile_pic.dart';
import 'package:feed_food/ngo/profile/profilemenu.dart';
import 'package:feed_food/utils/routes.dart';
import 'package:feed_food/widgets/sheet.dart';
import 'package:flutter/material.dart';
import 'body.dart';


class nBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
                title: Container(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Profile",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
                ),

    body:Padding(
      padding: const EdgeInsets.fromLTRB(120, 10, 10, 120),
      child: Column(
        children: [
            ProfilePic(),
            Padding(
                  padding:
                      const EdgeInsets.all(0.0),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 30,
                        width: 150,
                        child: ElevatedButton(
                          onPressed: (() => Navigator.pushNamed(
                              context, FeedFoodRoutes().loginRoute)),
                          child: Text(
                            "Edit Profile",
                            style: TextStyle(fontSize: 12),
                          ),
                          style: ElevatedButton.styleFrom(
                              primary: Colors.deepPurple[900],
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              )),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
            
        ]),
        ),
        );
  }
}









