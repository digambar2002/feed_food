// Author: Digambar Chaudhari

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:feed_food/widgets/text_fields.dart';
import 'package:flutter/material.dart';

import '../models/register_model.dart';
import '../utils/routes.dart';

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

  List<GlobalKey<FormState>> ngo_form_key = [
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>()
  ];
  // final ngo_form_key = GlobalKey<FormState>(); // key assign to form

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

  // NGO Error

  var NGO_id_error = null;
  var ngo_email_error = null;
  var ngo_phone_error = null;
  var ngo_username_error = null;

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
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: const BackButton(color: Colors.black),
          title: Text(
            "Register NGO",
            style: TextStyle(
              color: Colors.blueGrey[900],
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          backgroundColor: const Color(0xfafafa),
          elevation: 0,
        ),
        body: Theme(
            data: ThemeData(
              colorScheme: Theme.of(context).colorScheme.copyWith(
                    primary: Colors.deepPurple[400],
                  ),
            ),
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
                              style: OutlinedButton.styleFrom(
                                side: const BorderSide(
                                  color: Colors.deepPurple,
                                ),
                              ),
                              child: const Text('Back'),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: (_active_state <= 1)
                                ? TextButton(
                                    onPressed: details.onStepContinue,
                                    style: TextButton.styleFrom(
                                      foregroundColor: Colors.white,
                                      backgroundColor: Colors.deepPurple[400],
                                    ),
                                    child: const Text('Next'),
                                  )
                                : TextButton(
                                    onPressed: ((() async {
                                      await finish(context);
                                    })),
                                    style: TextButton.styleFrom(
                                      foregroundColor: Colors.white,
                                      backgroundColor: Colors.deepPurple[400],
                                    ),
                                    child: const Text('Finish'),
                                  ),
                          ),
                        ],
                      );
                    },
                    steps: stepsList(),
                    currentStep: _active_state,
                    onStepContinue: () async {
                      final isLastStep =
                          _active_state == stepsList().length - 1;

                      ngo_form_key[_active_state].currentState?.validate();

                      bool isDetailsValid = await isDetailComplete();

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
              ],
            )),
      ),
    );
  }

  // this method checks the values are valid or not
  Future<bool> isDetailComplete() async {
    if (_active_state == 0) {
      if (_NGO_name.text.isEmpty || _NGO_id.text.isEmpty) {
        return false;
      } else {
        showDialog(
            context: context,
            barrierDismissible: false,
            builder: ((context) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }));
        var id_check = await RegisterUserModel().ngoIdValidation(_NGO_id.text);
        Navigator.of(context).pop();
        if (id_check != true) {
          NGO_id_error = id_check;
          setState(() {});
          return false;
        }
        NGO_id_error = null;
        setState(() {});
        return true;
      }
    } else if (_active_state == 1) {
      if (_NGO_email.text.isEmpty ||
          _NGO_phone_no.text.isEmpty ||
          _NGO_phone_no.text.length != 10 ||
          _NGO_address.text.isEmpty ||
          _NGO_pincode.text.length != 6) {
        return false;
      } else {
        showDialog(
            context: context,
            barrierDismissible: false,
            builder: ((context) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }));
        var email_check =
            await RegisterUserModel().emailValidation(_NGO_email.text);
        var phone_check =
            await RegisterUserModel().phoneValidation(_NGO_phone_no.text);

        Navigator.of(context).pop();

        if (email_check != true) {
          ngo_email_error = email_check;
          setState(() {});
          return false;
        }
        if (phone_check != true) {
          ngo_phone_error = phone_check;
          setState(() {});
          return false;
        }
        ngo_email_error = null;
        ngo_phone_error = null;
        setState(() {});

        return true;
      }
    } else if (_active_state == 2) {
      return true;
    }

    return false;
  }

  // Finish method

  Future finish(BuildContext context) async {
    if (ngo_form_key[0].currentState!.validate() &&
        ngo_form_key[1].currentState!.validate() &&
        ngo_form_key[2].currentState!.validate()) {
      if (_NGO_username.text.isEmpty || _NGO_password.text.isEmpty) {
        print(_NGO_username.text);
        print(_NGO_password.text);
        return false;
      } else {
        var username_check =
            await RegisterUserModel().usernameValidation(_NGO_username.text);

        if (username_check != true) {
          ngo_username_error = username_check;
          setState(() {});
          return false;
        }
        ngo_username_error = null;
        // print(NGO_type);
        setState(() {});

        showDialog(
            context: context,
            barrierDismissible: false,
            builder: ((context) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }));

        var ngo_data_inserted = await RegisterUserModel().InsertNgoData(
            _NGO_name.text,
            _NGO_id.text,
            NGO_type.toString(),
            _NGO_email.text,
            _NGO_phone_no.text,
            _NGO_pincode.text,
            _NGO_address.text,
            _NGO_username.text,
            _NGO_password.text);

        if (ngo_data_inserted == true) {
          // ignore: use_build_context_synchronously
          Navigator.of(context).pop();
          AwesomeDialog(
            context: context,
            dismissOnTouchOutside: false,
            dialogType: DialogType.success,
            animType: AnimType.scale,
            title: 'Account Created Successfully',
            desc: 'Please Check Your Email To activate account',
            btnOkOnPress: () {
              Navigator.pushNamed(context, FeedFoodRoutes().loginRoute);
            },
          ).show();

          return true;
        } else {
          Navigator.of(context).pop();
          return false;
        }
      }
    }
  }

// Stepper List
  List<Step> stepsList() => [
        Step(
          state: _active_state <= 0 ? StepState.editing : StepState.complete,
          isActive: _active_state >= 0,
          title: const Text("Details"),
          content: Form(
            key: ngo_form_key[0],
            child: Column(
              children: [
                // NGO Name Text Field
                FoodTextField().buildTextLabel("NGO Name", "enter ngo name",
                    "ngo name cannot empty", _NGO_name, null),
                const SizedBox(
                  height: 30,
                ),

                // NGO ID text filed
                FoodTextField().buildTextLabel(
                    "Unique ID",
                    "enter your ngo unique id",
                    "ngo id cannot empty",
                    _NGO_id,
                    NGO_id_error),
                const SizedBox(
                  height: 30,
                ),

                // NGO Drop down menue
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
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
                              boxShadow: const [
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
                              hint: const Text("select your NGO type"),
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
                const SizedBox(height: 50),
              ],
            ),
          ),
        ),

        // Contact Details Step
        Step(
          state: _active_state <= 1 ? StepState.editing : StepState.complete,
          isActive: _active_state >= 1,
          title: const Text("Contact"),
          content: Form(
            key: ngo_form_key[1],
            child: Column(
              children: [
                FoodTextField().buildEmailNoIcon(
                    _NGO_email, "Email", "enter your email", ngo_email_error),
                const SizedBox(
                  height: 20,
                ),
                FoodTextField().buildPhoneLabel(
                    "Phone No",
                    "enter phone number",
                    "invalid phone number",
                    _NGO_phone_no,
                    ngo_phone_error),
                const SizedBox(
                  height: 20,
                ),
                FoodTextField().buildPincode("Pincode",
                    "enter your area pincode", "invalid pincode", _NGO_pincode),
                const SizedBox(
                  height: 20,
                ),
                FoodTextField().buildTextArea("Address", "enter your address",
                    "address cannot empty", _NGO_address),
                const SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
        ),
        Step(
          state: _active_state <= 2 ? StepState.editing : StepState.complete,
          isActive: _active_state >= 2,
          title: const Text("Account"),
          content: Form(
            key: ngo_form_key[2],
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text("Username"),
              FoodTextField().buildTextUsername(
                  _NGO_username, ngo_username_error, 'enter username'),
              const SizedBox(
                height: 20,
              ),
              const Text("Password"),
              BuildPassword(controller_name: _NGO_password),
              const SizedBox(
                height: 20,
              )
            ]),
          ),
        ),
      ];

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        value: item,
        child: Text(item),
      );
}
