import 'package:feed_food/ngo/complete/n_complete.dart';
import 'package:feed_food/ngo/pending/n_pending.dart';
import 'package:feed_food/ngo/profile/n_profile.dart';
import 'package:feed_food/ngo/profile/n_edit_profile.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'home/n_home_page.dart';

class NMain extends StatefulWidget {
  const NMain({super.key});

  @override
  State<NMain> createState() => _NMainState();
}

class _NMainState extends State<NMain> {
  var _currentIndex = 0;
  List pages = [
    NHomePage(),
    nPendingRequest(),
    NComplete(),
    NProfile(),
  ];

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.white,
    ));
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
                    icon: Icon(Icons.history_outlined),
                    title: Text("Pending"),
                    selectedColor: Colors.pink,
                  ),

                  /// Search
                  SalomonBottomBarItem(
                    icon: Icon(Icons.done_all_outlined),
                    title: Text("Completed"),
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
  }
}
