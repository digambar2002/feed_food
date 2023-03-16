import 'package:feed_food/ngo/profile/profile_pic.dart';
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

    body:SingleChildScrollView(
      child:
        Container(
          padding: const EdgeInsets.all(8.0),
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
                                  context, FeedFoodRoutes().nEditProfile)),
                              child: Text(
                                "Edit Profile",
                                style: TextStyle(fontSize: 12),
                              ),
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.deepPurple,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  ),
                            ),
                          ),
                          const SizedBox(height: 30,),
                          const Divider(),
                          const SizedBox(height: 10,),
                          Container(
                            child: Padding(
                  padding:
                      const EdgeInsets.all(4.0),
                  child: Column(
                    children: [
                   SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 60,
                        width: 350,
                        child: ElevatedButton.icon(
                          onPressed: () {},
                          icon: Icon(Icons.settings, size: 24.0,),
                          label: Text(
                            "Setting",
                            style: TextStyle(fontSize: 24),
                          ),
                          style: ElevatedButton.styleFrom(
                              primary: Colors.deepPurple,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(13),
                              )),
                        ),
                      ),
                     SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 50,
                        width: 350,
                        child: ElevatedButton.icon(
                          onPressed: () {},
                          icon: Icon(Icons.settings, size: 24.0,),
                          label: Text(
                            "Setting",
                            style: TextStyle(fontSize: 24),
                          ),
                          style: ElevatedButton.styleFrom(
                              primary: Colors.deepPurple,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(13),
                              )),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 50,
                        width: 350,
                        child: ElevatedButton.icon(
                          onPressed: () {},
                          icon: Icon(Icons.settings, size: 24.0,),
                          label: Text(
                            "Setting",
                            style: TextStyle(fontSize: 24),
                          ),
                          style: ElevatedButton.styleFrom(
                              primary: Colors.deepPurple,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(13),
                              )),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 50,
                        width: 350,
                        child: ElevatedButton.icon(
                          onPressed: () {},
                          icon: Icon(Icons.settings, size: 24.0,),
                          label: Text(
                            "Setting",
                            style: TextStyle(fontSize: 24),
                          ),
                          style: ElevatedButton.styleFrom(
                              primary: Colors.deepPurple,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(13),
                              )),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 50,
                        width: 350,
                        child: ElevatedButton.icon(
                          onPressed: () {},
                          icon: Icon(Icons.settings, size: 24.0,),
                          label: Text(
                            "Setting",
                            style: TextStyle(fontSize: 24),
                          ),
                          style: ElevatedButton.styleFrom(
                              primary: Colors.deepPurple,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(13),
                              )),
                        ),
                      ),
                      
                    ],
                  ),
                ),
                          )
                        ],
                      ),
                ),
            ],
        
          ),
        ),
      ),
    );
  }
}




















