import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:flutter_inner_drawer/inner_drawer.dart';

class VHomePage extends StatefulWidget {
  const VHomePage({super.key});

  @override
  State<VHomePage> createState() => _VHomePageState();
}

class _VHomePageState extends State<VHomePage> {
  var _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Material(
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
          icon: Icon(Icons.notifications_outlined),
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
    )));
  }
}
