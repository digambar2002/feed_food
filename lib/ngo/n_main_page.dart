import 'package:feed_food/ngo/profile/body.dart';
import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import 'n_home_page.dart';

class NMain extends StatefulWidget {
  const NMain({super.key});

  @override
  State<NMain> createState() => _NMainState();
}

class _NMainState extends State<NMain> {
  var _currentIndex = 0;
  List pages = [
    nHomePage(),
    Text("notification"),
    Text("post"),
    Text("history"),
    Text("profile"),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: pages[_currentIndex],
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
          child: Card(
            child: SalomonBottomBar(
                onTap: ((index) {
                  setState(() {});
                  _currentIndex = index;
                }),
                currentIndex: _currentIndex,
                items: [
                  /// Home
                  SalomonBottomBarItem(
                    icon: Icon(Icons.home_outlined),
                    title: Text("Home"),
                    selectedColor: Colors.purple,
                  ),

                  /// Search
                  SalomonBottomBarItem(
                    icon: Icon(Icons.notifications),
                    title: Text("notifications"),
                    selectedColor: Colors.pink,
                  ),

                  /// Likes
                  SalomonBottomBarItem(
                    icon: Icon(Icons.add_box_outlined, size: 30),
                    title: Text("Post"),
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
                ]),
          ),
        ),
      ),
    );
    ;
  }
}
