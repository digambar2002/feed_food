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
  final _NGO_pincode = TextEditingController();
  final _NGO_username = TextEditingController();
  final _NGO_password = TextEditingController();
  final _NGO_confirm_password = TextEditingController();

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
        backgroundColor: Color(0xfafafa),
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
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: (_active_state <= 1)
                                ? TextButton(
                                    onPressed: details.onStepContinue,
                                    child: const Text('Next'),
                                    style: TextButton.styleFrom(
                                      primary: Colors.white,
                                      backgroundColor: Colors.deepPurple[400],
                                    ),
                                  )
                                : TextButton(
                                    onPressed: (() => finish(context)),
                                    child: const Text('Finish'),
                                    style: TextButton.styleFrom(
                                      primary: Colors.white,
                                      backgroundColor: Colors.deepPurple[400],
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

  // this method checks the values are valid or not
  bool isDetailComplete() {
    if (_active_state == 0) {
      if (_NGO_name.text.isEmpty || _NGO_id.text.isEmpty) {
        return false;
      } else {
        return true;
      }
    } else if (_active_state == 1) {
      if (_NGO_email.text.isEmpty ||
          _NGO_phone_no.text.isEmpty ||
          _NGO_phone_no.text.length != 10 ||
          _NGO_address.text.isEmpty ||
          _NGO_pincode.text.length != 6) {
        print("i run");
        return false;
      } else {
        return true;
      }
    } else if (_active_state == 2) {
      return true;
    }

    return false;
  }

  // Finish method

  finish(BuildContext context) {
    ngo_form_key.currentState?.validate();
    print("hello");
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
              FoodTextField().buildTextLabel("NGO Name", "enter ngo name",
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

        // Contact Details Step
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
              FoodTextField().buildPhoneLabel("Phone No", "enter phone number",
                  "invalid phone number", _NGO_phone_no),
              SizedBox(
                height: 20,
              ),
              FoodTextField().buildPincode("Pincode", "enter your area pincode",
                  "invalid pincode", _NGO_pincode),
              SizedBox(
                height: 20,
              ),
              FoodTextField().buildTextArea("Address", "enter your address",
                  "address cannot empty", _NGO_address),
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
          content: Column(children: [
            FoodTextField().buildTextLabel("Username", "enter username",
                "invalid username", _NGO_username),
            SizedBox(
              height: 20,
            ),
            FoodTextField().buildLablePassword("Password", "enter password",
                "invalid password", _NGO_password),
            SizedBox(
              height: 20,
            )
          ]),
        ),
      ];

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        value: item,
        child: Text(item),
      );
}
