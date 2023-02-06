import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 115,
          width: 115,
          child: Stack(
            fit: StackFit.expand,
            children: [
              CircleAvatar(
              ),

              Positioned(
                child: SizedBox(
                  height: 46,
                  width: 46,
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
