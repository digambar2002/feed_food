import 'package:feed_food/ngo/complete/n_complete.dart';
import 'package:feed_food/ngo/pending/n_pending.dart';
import 'package:feed_food/ngo/profile/n_profile.dart';

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
    const NHomePage(),
    const nPendingRequest(),
    const NComplete(),
    const NProfile(),
  ];

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
    ));
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
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
                  icon: const Icon(Icons.home_outlined),
                  title: const Text("Home"),
                  selectedColor: Colors.purple,
                ),

                /// Search
                SalomonBottomBarItem(
                  icon: const Icon(Icons.history_outlined),
                  title: const Text("Pending"),
                  selectedColor: Colors.orange,
                ),

                /// Search
                SalomonBottomBarItem(
                  icon: const Icon(Icons.done_all_outlined),
                  title: const Text("Completed"),
                  selectedColor: Colors.teal,
                ),

                /// Profile
                SalomonBottomBarItem(
                  icon: const Icon(Icons.person_outline),
                  title: const Text("Profile"),
                  selectedColor: Colors.pink,
                ),
              ]),
        ),
      ),
    );
  }
}
