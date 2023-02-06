import 'package:feed_food/ngo/profile/components/body.dart';
import 'package:flutter/material.dart';
import 'components/body.dart';


class ProfileScreen extends StatelessWidget {
  static String routeName = '/profile';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
      body: Body(),
    );
  }
}


