import 'package:flutter/material.dart';
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
          icon: Icon(Icons.person_2_outlined),
          title: Text("Profile"),
          selectedColor: Colors.teal,
        ),
      ],
    ),

          body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),

            // Text for topleft corner
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                alignment: Alignment.topLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Welcome",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 28,
                      ),
                    ),
                    Text(
                      "NGO Name",
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),

            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/nhome.png"),
                    fit: BoxFit.cover),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 200, horizontal: 20),
                child: Column(
                  children: [
                    SizedBox(
                      height: 60,
                      width: 360,
                ),
                ],
                ),
                ),
                ),
                ],
    ),
    ),
    )
    );
  }
}
