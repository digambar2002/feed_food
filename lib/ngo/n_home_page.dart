import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/routes.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class NHomePage extends StatefulWidget {
  const NHomePage({super.key});

  @override
  State<NHomePage> createState() => _NHomePageState();
}

class _NHomePageState extends State<NHomePage> {
  var _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: SalomonBottomBar(
          currentIndex: _currentIndex,
          onTap: (i) => setState(() => _currentIndex = i),
          items: [
            /// Home
            SalomonBottomBarItem(
              icon: Icon(Icons.home_outlined),
              title: Text("Home"),
              selectedColor: Colors.purple,
            ),

            SalomonBottomBarItem(
              icon: Icon(Icons.notification_add_outlined),
              title: Text("Notification"),
              selectedColor: Colors.orange,
            ),

            /// Likes
            SalomonBottomBarItem(
              icon: Icon(Icons.add_box_outlined, size: 30),
              title: Text("Add Request"),
              selectedColor: Colors.red,
            ),

            /// Search
            SalomonBottomBarItem(
              icon: Icon(Icons.history),
              title: Text("history"),
              selectedColor: Colors.orange,
            ),

            /// Profile
            SalomonBottomBarItem(
              icon: Icon(Icons.person_outline),
              title: Text("Profile"),
              selectedColor: Colors.teal,
            ),
          ],
        ),
        // Text for topleft corner
        body: SingleChildScrollView(
          child: Container(
            height: 300,
            width: 600,
            decoration:
                BoxDecoration(color: Color.fromARGB(255, 163, 119, 239)),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                alignment: Alignment.topLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Welcome",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      "NGO Name",
                      style: TextStyle(color: Colors.white, fontSize: 24),
                    ),
                    Text(
                      "Login to account",
                      style: TextStyle(fontSize: 24, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
