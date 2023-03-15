import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'body.dart';





class ProfilePic extends StatelessWidget {
  const ProfilePic({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:  const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: SizedBox(
            height: 150,
            width: 115,
            child: 
                SizedBox(
                  height: 115,
                  width: 115,
                  child: CircleAvatar(
                    backgroundImage: AssetImage("assets/images/Profile Pic.png"),
                    ),
                    
                  ),
                ),
        ),
      ],
  
    );
  }
}










   