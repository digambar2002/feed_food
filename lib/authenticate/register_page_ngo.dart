// Author: Digambar Chaudhari

import 'package:feed_food/widgets/text_fields.dart';
import 'package:flutter/material.dart';

class RegisterNgo extends StatefulWidget {
  const RegisterNgo({super.key});

  @override
  State<RegisterNgo> createState() => _RegisterNgoState();
}

class _RegisterNgoState extends State<RegisterNgo> {
  int _active_state = 0;
  final items = ['items1', 'items2', 'items3', 'items4', 'items5'];

  String? value;
  // Containet Inside Steps
  List<Step> stepsList() => [
        Step(
          state: _active_state <= 0 ? StepState.editing : StepState.complete,
          isActive: _active_state >= 0,
          title: const Text("Details"),
          content: Column(
            children: [
              FoodTextField().buildText(
                  "NGO name", "enter ngo name", "ngo name cannot empty"),
              SizedBox(
                height: 10,
              ),
              FoodTextField().buildText(
                  "NGO unique ID", "enter ngo id", "ngo id cannot empty"),
              SizedBox(
                height: 10,
              ),
              DropdownButton<String>(
                value: value,
                isExpanded: true,
                items: items.map(buildMenuItem).toList(),
                onChanged: ((value) => setState(() => this.value = value)),
              ),
            ],
          ),
        ),
        Step(
          state: _active_state <= 1 ? StepState.editing : StepState.complete,
          isActive: _active_state >= 1,
          title: const Text("Contact"),
          content: const Center(
            child: Text("contact"),
          ),
        ),
        Step(
          state: _active_state <= 2 ? StepState.editing : StepState.complete,
          isActive: _active_state >= 2,
          title: const Text("Account"),
          content: const Center(
            child: Text("Username"),
          ),
        ),
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Colors.black),
        title: Text(
          "Register NGO",
          style: TextStyle(
            color: Colors.blueGrey[900],
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Theme(
        data: ThemeData(
          colorScheme: Theme.of(context).colorScheme.copyWith(
                primary: Colors.deepPurple[400],
              ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Stepper(
            elevation: 0,
            type: StepperType.horizontal,
            controlsBuilder: (BuildContext context, ControlsDetails details) {
              return Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    OutlinedButton(
                      onPressed: details.onStepCancel,
                      child: const Text('Back'),
                      style: OutlinedButton.styleFrom(
                          side: BorderSide(
                        color: Colors.deepPurple,
                      )),
                    ),
                    TextButton(
                      onPressed: details.onStepContinue,
                      child: const Text('Next'),
                      style: TextButton.styleFrom(
                        primary: Colors.white,
                        backgroundColor: Colors.deepPurple[400],
                      ),
                    ),
                  ],
                ),
              );
            },
            steps: stepsList(),
            currentStep: _active_state,
            onStepContinue: () {
              if (_active_state < (stepsList().length - 1)) {
                _active_state += 1;
              }
              setState(() {});
            },
            onStepCancel: () {
              if (_active_state == 0) {
                return;
              }
              _active_state -= 1;
              setState(() {});
            },
          ),
        ),
      ),
    );
  }

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        value: item,
        child: Text(item),
      );
}
