import 'package:feed_food/widgets/btn.dart';
import 'package:feed_food/widgets/text_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OtpPage extends StatelessWidget {
  const OtpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(children: [
        SizedBox(
          height: 5,
        ),
        Image.asset(
          "assets/images/OTP.png",
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          // forgotpasswordUYR (2:682)
          margin: EdgeInsets.fromLTRB(0, 0, 230, 14),
          constraints: BoxConstraints(
            maxWidth: 150,
          ),
          child: Text(
            'Verification',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 5,
            horizontal: 25,
          ),
          child: Text(
            "Please provide us OTP sent on your Email",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
              color: Colors.black54,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          child: FoodTextField().buildEmail(),
        ),
        Btn().buildResendBtn(onClick: () => print("Resend Code")),
        SizedBox(height: 25),
        SizedBox(
          height: 60,
          width: 360,
          child: ElevatedButton(
            onPressed: (() => print("OTP")),
            child: Text(
              "Verify",
              style: TextStyle(fontSize: 24),
            ),
            style: ElevatedButton.styleFrom(
                primary: Colors.deepPurple[300],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                )),
          ),
        ),
      ]),
    ));
  }
}
