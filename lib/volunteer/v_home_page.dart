import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/strings.dart';

class VHomePage extends StatelessWidget {
  const VHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          FeedFoodStrings.BrandName,
          style: GoogleFonts.dancingScript(
              fontWeight: FontWeight.w900, fontSize: 26),
        ),
        automaticallyImplyLeading: false,
        elevation: 0,
      ),
      body: Text("Home"),
    );
  }
}
