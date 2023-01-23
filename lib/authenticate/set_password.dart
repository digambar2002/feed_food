import 'dart:ui';

import 'package:flutter/material.dart';

class SetPass extends StatefulWidget {
  const SetPass({super.key});

  @override
  State<SetPass> createState() => _SetPassState();
}

class _SetPassState extends State<SetPass> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Create Your Account",
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
