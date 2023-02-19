import 'package:flutter/material.dart';


class nProfilePage extends StatelessWidget {
  const nProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){}, icon: const Icon(Icons.line_axis_rounded)),
        title:Text("Profile", style:Theme.of(context).textTheme.headlineMedium),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.line_axis_rounded))
        ],
      ),
      body: SingleChildScrollView(
        child: Container(),
      ),
    );
  }
}
