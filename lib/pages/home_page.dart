// Author: Digambar Chaudhari

import 'package:feed_food/authenticate/login_page.dart';
import 'package:feed_food/authenticate/register_page.dart';
import 'package:feed_food/utils/routes.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home Page")),
    );
  }
}