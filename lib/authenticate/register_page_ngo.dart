// Author: Digambar Chaudhari

import 'package:feed_food/widgets/text_fields.dart';
import 'package:flutter/material.dart';

class RegisterNgo extends StatefulWidget {
  const RegisterNgo({super.key});

  @override
  State<RegisterNgo> createState() => _RegisterNgoState();
}

class _RegisterNgoState extends State<RegisterNgo> {
  _RegisterNgoState() {
    NGO_type = Ngo_items[0];
  }

  int _active_state = 0; // to store the active state of stepper
  bool is_completed = false; // to check all field is completed

  final ngo_form_key = GlobalKey<FormState>(); // key assign to form

  // dropdown value
  String? NGO_type;

  // NGO Details
  final _NGO_name = TextEditingController();
  final _NGO_id = TextEditingController();
  final _NGO_email = TextEditingController();
  final _NGO_phone_no = TextEditingController();
  final _NGO_address = TextEditingController();

  // drop down items
  final Ngo_items = [
    'Private Sector Companies',
    'Registered Societies (Non-Govt)',
    'Trust (Non-Govt)',
    'Other Registered Entities (Non-Govt)',
    'Academic Institutions (Private)',
    'Academic Institutions (Govt)'
  ];

  // List Of steps
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
          child: Form(
            key: ngo_form_key,
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Stepper(
                    elevation: 0,
                    type: StepperType.horizontal,
                    controlsBuilder:
                        (BuildContext context, ControlsDetails details) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: TextButton(
                              onPressed: details.onStepContinue,
                              child: const Text('Next'),
                              style: TextButton.styleFrom(
                                primary: Colors.white,
                                backgroundColor: Colors.deepPurple[400],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: OutlinedButton(
                              onPressed: details.onStepCancel,
                              child: const Text('Back'),
                              style: OutlinedButton.styleFrom(
                                side: BorderSide(
                                  color: Colors.deepPurple,
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                    steps: stepsList(),
                    currentStep: _active_state,
                    onStepContinue: () {
                      final isLastStep =
                          _active_state == stepsList().length - 1;

                      ngo_form_key.currentState?.validate();

                      bool isDetailsValid = isDetailComplete();

                      if (isDetailsValid) {
                        if (isLastStep) {
                          setState(() {
                            is_completed = true;
                          });
                        } else {
                          if (_active_state < (stepsList().length - 1)) {
                            _active_state += 1;
                          }
                          setState(() {});
                        }
                      } else {}
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
                // Align(
                //   alignment: Alignment.bottomCenter,
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       Expanded(
                //         child: TextButton(
                //           onPressed: () => print("hello"),
                //           child: const Text('Next'),
                //           style: TextButton.styleFrom(
                //             primary: Colors.white,
                //             backgroundColor: Colors.deepPurple[400],
                //           ),
                //         ),
                //       ),
                //       Expanded(
                //         child: OutlinedButton(
                //           onPressed: (() => print("hello")),
                //           child: const Text('Back'),
                //           style: OutlinedButton.styleFrom(
                //             side: BorderSide(
                //               color: Colors.deepPurple,
                //             ),
                //           ),
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
              ],
            ),
          )),
    );
  }

  bool isDetailComplete() {
    if (_active_state == 0) {
      if (_NGO_name.text.isEmpty || _NGO_id.text.isEmpty) {
        return false;
      } else {
        return true;
      }
    } else if (_active_state == 1) {
      if (_NGO_email.text.isEmpty || _NGO_phone_no.text.isEmpty) {
        return false;
      } else {
        return true;
      }
    }

    return false;
  }

// Stepper List
  List<Step> stepsList() => [
        Step(
          state: _active_state <= 0 ? StepState.editing : StepState.complete,
          isActive: _active_state >= 0,
          title: const Text("Details"),
          content: Column(
            children: [
              // NGO Name Text Field
              FoodTextField().buildText("NGO Name", "enter ngo name",
                  "ngo name cannot empty", _NGO_name),
              const SizedBox(
                height: 30,
              ),

              // NGO ID text filed
              FoodTextField().buildNumber("Unique ID",
                  "enter your ngo unique id", "ngo id cannot empty", _NGO_id),
              const SizedBox(
                height: 30,
              ),

              // NGO Drop down menue
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Select NGO Type",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.black12,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.white,
                                blurRadius: 0,
                                offset: Offset(0, 2),
                              )
                            ]),
                        height: 60,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 20),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: NGO_type,
                            isExpanded: true,
                            hint: Text("select your NGO type"),
                            items: Ngo_items.map(buildMenuItem).toList(),
                            onChanged: ((value) {
                              setState(() {
                                NGO_type = value as String;
                              });
                            }),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 50),
            ],
          ),
        ),
        Step(
          state: _active_state <= 1 ? StepState.editing : StepState.complete,
          isActive: _active_state >= 1,
          title: const Text("Contact"),
          content: Column(
            children: [
              FoodTextField()
                  .buildEmailNoIcon(_NGO_email, "Email", "enter your email"),
              SizedBox(
                height: 20,
              ),
              FoodTextField().buildNumber("Phone No", "enter phone number",
                  "invalid phone number", _NGO_phone_no),
              SizedBox(
                height: 40,
              ),
            ],
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

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        value: item,
        child: Text(item),
      );
}
