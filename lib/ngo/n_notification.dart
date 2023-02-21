import 'package:flutter/material.dart';


class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
          child: Scaffold(
            appBar: AppBar(
              title: Text("Notification"),
              backgroundColor: Color.fromARGB(255, 143, 95, 226),
            ),
        
      ),
    );
  }
}
