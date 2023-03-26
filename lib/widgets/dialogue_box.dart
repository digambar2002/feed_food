import 'package:feed_food/utils/logout.dart';
import 'package:flutter/material.dart';

class MyDialogue {
  // set up the AlertDialog
  logotDialogue(context) {
    return AlertDialog(
      title: const Text("Logout !"),
      content: const Text("Would you like to logout ?"),
      actions: [
        TextButton(
          child: const Text("Cancel"),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        TextButton(
            child: const Text(
              'Logout',
              style: TextStyle(color: Colors.red),
            ),
            onPressed: () {
              LogOut().logOut(context);
              Navigator.pop(context);
            }),
      ],
    );
  }
}
