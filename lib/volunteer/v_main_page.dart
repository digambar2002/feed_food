import 'package:feed_food/utils/strings.dart';
import 'package:feed_food/volunteer/donate/v_donate_page.dart';
import 'package:feed_food/volunteer/history/v_history_page.dart';
import 'package:feed_food/volunteer/home/v_home_page.dart';
import 'package:feed_food/volunteer/profile/v_profile_page.dart';
import 'package:feed_food/widgets/btn.dart';
import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:google_fonts/google_fonts.dart';

class VMainPage extends StatefulWidget {
  const VMainPage({super.key});

  @override
  State<VMainPage> createState() => _VHomePageState();
}

class _VHomePageState extends State<VMainPage> {
  var _currentIndex = 0;
  List pages = [
    VHomePage(),
    VDonatePage(),
    VHistory(),
    VProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: pages[_currentIndex],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
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
    );
  }
}
