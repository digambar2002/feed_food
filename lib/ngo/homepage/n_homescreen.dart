import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:flutter_inner_drawer/inner_drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
              Container(
                 height: 350,
                 width: 600,
                decoration: BoxDecoration(color: Color.fromARGB(255, 163, 119, 239)),
              ),
              
              Column(
                children:<Widget> [
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      alignment: Alignment.center,
                       height: 52,
                       width: 52,
                       decoration: BoxDecoration(
                       color: Colors.black,
                       shape: BoxShape.circle
                       ),
                      //  write here picture icon image path
                    ),
                  ),
                   Padding(
            padding: const EdgeInsets.all(4.0),
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
                    style: TextStyle(color: Colors.white,
                     fontSize: 24),
                  ),
                ], 
              ),
            ),
          ),
          Expanded(child: GridView.count(
            crossAxisCount: 3,
            childAspectRatio: 1.5,
          children:<Widget> [
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              ),
            ),
          ],
          ),
          ),
         ],
        )
       ],
     ),
    );
  }
}
