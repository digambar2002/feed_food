import 'package:feed_food/widgets/btn.dart';
import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

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
            body: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                  child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Hello \n Madhura"),
                      CircleAvatar(
                        backgroundImage: NetworkImage(
                            'https://www.pngkey.com/png/detail/115-1150232_brigitte-circle-avatar-avatar-circle.png'),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Card(
                    child: Container(
                      height: 50,
                      width: 200,
                      child: Text("hello world"),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Btn().buildCardButton(
                          'https://img.icons8.com/fluency/48/cute-pumpkin.png',
                          'https://img.icons8.com/fluency/48/cute-pumpkin.png',
                          'Food'),
                      SizedBox(
                        width: 10,
                      ),
                      Btn().buildCardButton(
                          'https://img.icons8.com/fluency/48/cute-pumpkin.png',
                          'https://img.icons8.com/fluency/48/cute-pumpkin.png',
                          'Food'),
                    ],
                  )
                ],
              )),
            ),
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
                    selectedColor: Colors.yellow,
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
                ])));
  }
}
