// Author: Digambar Chaudhari
// Author: Bhavesh Patil
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BuildPassword extends StatefulWidget {
  final TextEditingController controller_name;

  const BuildPassword({super.key, required this.controller_name});

  @override
  State<BuildPassword> createState() => _BuildPasswordState();
}

class _BuildPasswordState extends State<BuildPassword> {
  bool _isVisible = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 5,
        ),
        Stack(
          children: [
            Container(
              alignment: Alignment.centerLeft,
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
            TextFormField(
              controller: widget.controller_name,
              keyboardType: TextInputType.visiblePassword,
              style: TextStyle(color: Colors.black),
              obscureText: !_isVisible,
              enableSuggestions: false,
              autocorrect: false,
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 18),
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Icon(
                    Icons.lock_outline,
                    color: Colors.black54,
                  ),
                ),
                suffixIcon: Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: IconButton(
                    iconSize: 22,
                    onPressed: () {
                      setState(() {
                        _isVisible = !_isVisible;
                      });
                    },
                    icon: _isVisible
                        ? Icon(
                            Icons.visibility_outlined,
                            color: Colors.black,
                          )
                        : Icon(
                            Icons.visibility_off_outlined,
                            color: Colors.grey,
                          ),
                  ),
                ),
                hintText: 'password',
                hintStyle: TextStyle(color: Colors.black54),
                errorStyle: TextStyle(
                  height: 2,
                ),
              ),
              validator: (value) {
                /*

                      r'^
                        (?=.*[A-Z])       // should contain at least one upper case
                        (?=.*[a-z])       // should contain at least one lower case
                        (?=.*?[0-9])      // should contain at least one digit
                        (?=.*?[!@#\$&*~]) // should contain at least one Special character
                        .{8,}             // Must be at least 8 characters in length  
                      $


                */

                final bool passValid = RegExp(
                        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
                    .hasMatch(widget.controller_name.text);

                if (value!.isEmpty) {
                  return "password not empty";
                } else if (value.length < 8) {
                  return "enter minimum 8 charaters";
                } else if (!passValid) {
                  return "password should contains one upper case, lower case, digit and \n symbol";
                }
                return null;
              },
            ),
          ],
        ),
      ],
    );
  }
}

class FoodTextField {
  //  Email Text Field
  Widget buildEmail(var controller_name, var error_text) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 5,
        ),
        Stack(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(10),
                  // ignore: prefer_const_literals_to_create_immutables
                  boxShadow: [
                    const BoxShadow(
                      color: Colors.white,
                      blurRadius: 0,
                      offset: Offset(0, 2),
                    )
                  ]),
              height: 60,
            ),
            TextFormField(
              controller: controller_name,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              keyboardType: TextInputType.emailAddress,
              style: const TextStyle(color: Colors.black),
              decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(top: 18),
                  prefixIcon: Padding(
                    padding: EdgeInsets.only(top: 16),
                    child: Icon(
                      Icons.email_outlined,
                      color: Colors.black54,
                    ),
                  ),
                  hintText: 'Email',
                  errorText: error_text,
                  hintStyle: TextStyle(color: Colors.black54),
                  errorStyle: TextStyle(
                    height: 2,
                  )),
              validator: (value) {
                final bool emailValid = RegExp(
                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                    .hasMatch(controller_name.text);

                if (value!.isEmpty) {
                  return "email not empty";
                } else if (!emailValid) {
                  return "invalid email enter";
                }

                return null;
              },
            ),
          ],
        ),
      ],
    );
  }

  Widget buildEmailNoIcon(
      var controller_name, var label, var hint_text, var email_error) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 5,
        ),
        Text(
          label,
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        Stack(
          children: [
            Container(
              alignment: Alignment.centerLeft,
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
            TextFormField(
              controller: controller_name,
              keyboardType: TextInputType.text,
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  hintText: hint_text,
                  hintStyle: TextStyle(color: Colors.black54),
                  errorText: email_error,
                  errorStyle: TextStyle(
                    height: 2,
                  )),
              validator: (value) {
                final bool emailValid = RegExp(
                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                    .hasMatch(controller_name.text);

                if (value!.isEmpty) {
                  return "email not empty";
                } else if (!emailValid) {
                  return "invalid email enter";
                }

                return null;
              },
            ),
          ],
        ),
      ],
    );
  }

  // Password Text Field
  Widget buildPassword(controller_name) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 5,
        ),
        Stack(
          children: [
            Container(
              alignment: Alignment.centerLeft,
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
            TextFormField(
              controller: controller_name,
              keyboardType: TextInputType.visiblePassword,
              style: TextStyle(color: Colors.black),
              obscureText: true,
              enableSuggestions: false,
              autocorrect: false,
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 18),
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Icon(
                    Icons.lock_outline,
                    color: Colors.black54,
                  ),
                ),
                hintText: 'password',
                hintStyle: TextStyle(color: Colors.black54),
                errorStyle: TextStyle(
                  height: 2,
                ),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return "password not empty";
                } else if (value.length < 6) {
                  return "enter minimum 5 charaters";
                }
                return null;
              },
            ),
          ],
        ),
      ],
    );
  }

  Widget buildLablePassword(
      var label, var hint_text, var error_flag, var controller_name) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 5,
        ),
        Text(
          label,
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        Stack(
          children: [
            Container(
              alignment: Alignment.centerLeft,
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
            TextFormField(
              keyboardType: TextInputType.visiblePassword,
              controller: controller_name,
              style: TextStyle(color: Colors.black),
              obscureText: true,
              enableSuggestions: false,
              autocorrect: false,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  hintText: hint_text,
                  hintStyle: TextStyle(color: Colors.black54),
                  errorStyle: TextStyle(
                    height: 2,
                  )),
              validator: (value) {
                if (value!.isEmpty) {
                  return error_flag;
                } else if (value.length < 6) {
                  return "password cannot be less than 6";
                }
                return null;
              },
            ),
          ],
        ),
      ],
    );
  }

  //  Username Filed
  Widget buildTextUsername(var controller_name, var text_error, var hint_text) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 5,
        ),
        Stack(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(10),
                  // ignore: prefer_const_literals_to_create_immutables
                  boxShadow: [
                    const BoxShadow(
                      color: Colors.white,
                      blurRadius: 0,
                      offset: Offset(0, 2),
                    )
                  ]),
              height: 60,
            ),
            TextFormField(
              controller: controller_name,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              keyboardType: TextInputType.emailAddress,
              style: const TextStyle(color: Colors.black),
              decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(top: 18),
                  prefixIcon: Padding(
                    padding: EdgeInsets.only(top: 16),
                    child: Icon(
                      Icons.person_outline_outlined,
                      color: Colors.black54,
                    ),
                  ),
                  hintText: hint_text,
                  errorText: text_error,
                  hintStyle: TextStyle(color: Colors.black54),
                  errorStyle: TextStyle(
                    height: 2,
                  )),
              validator: (value) {
                final bool usernameValid = RegExp(r"^[a-zA-Z0-9_]{5,15}$")
                    .hasMatch(controller_name.text);
                if (value!.isEmpty) {
                  return "username cannot empty";
                } else if (!usernameValid) {
                  return "username must be 5 character long";
                }
                return null;
              },
            ),
          ],
        ),
      ],
    );
  }

  Widget buildText(var hint_text, controller_name) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 5,
        ),
        Stack(
          children: [
            Container(
              alignment: Alignment.centerLeft,
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
            TextFormField(
              controller: controller_name,
              keyboardType: TextInputType.text,
              style: TextStyle(color: Colors.black),
              autocorrect: false,
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 18),
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Icon(
                    Icons.person_outline_rounded,
                    color: Colors.black54,
                  ),
                ),
                hintText: hint_text,
                hintStyle: TextStyle(color: Colors.black54),
                errorStyle: TextStyle(
                  height: 2,
                ),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return "username cannot empty";
                }
                return null;
              },
            ),
          ],
        ),
      ],
    );
  }

// Simple Lable Text Filed
  Widget buildTextLabel(var label, var hint_text, var error_flag,
      var controller_name, var error_text) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 5,
        ),
        Text(
          label,
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        Stack(
          children: [
            Container(
              alignment: Alignment.centerLeft,
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
            TextFormField(
              controller: controller_name,
              keyboardType: TextInputType.text,
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  hintText: hint_text,
                  errorText: error_text,
                  hintStyle: TextStyle(color: Colors.black54),
                  errorStyle: TextStyle(
                    height: 2,
                  )),
              validator: (value) {
                if (value!.isEmpty) {
                  return error_flag;
                }
                return null;
              },
            ),
          ],
        ),
      ],
    );
  }

// Text Area for address
  Widget buildTextArea(
      var label, var hint_text, var error_flag, var controller_name) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 5,
        ),
        Text(
          label,
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        Stack(
          children: [
            Container(
              alignment: Alignment.centerLeft,
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
              height: 125,
            ),
            TextFormField(
              controller: controller_name,
              maxLines: 4,
              keyboardType: TextInputType.multiline,
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  hintText: hint_text,
                  hintStyle: TextStyle(color: Colors.black54),
                  errorStyle: TextStyle(
                    height: 2,
                  )),
              validator: (value) {
                if (value!.isEmpty) {
                  return error_flag;
                }
                return null;
              },
            ),
          ],
        ),
      ],
    );
  }

  // Simple Number field Widget
  Widget buildNumber(var label, var hint_text, var error_flag,
      var controller_name, var error_text) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 5,
        ),
        Text(
          label,
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        Stack(
          children: [
            Container(
              alignment: Alignment.centerLeft,
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
            TextFormField(
              controller: controller_name,
              keyboardType: TextInputType.number,
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  hintText: hint_text,
                  errorText: error_text,
                  hintStyle: TextStyle(color: Colors.black54),
                  errorStyle: TextStyle(
                    height: 2,
                  )),
              validator: (value) {
                if (value!.isEmpty) {
                  return error_flag;
                }
                return null;
              },
            ),
          ],
        ),
      ],
    );
  }

  // Phone Number Filed

  Widget buildPhoneLabel(var label, var hint_text, var error_flag,
      var controller_name, var error_text) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 5,
        ),
        Text(
          label,
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        Stack(
          children: [
            Container(
              alignment: Alignment.centerLeft,
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
            TextFormField(
              controller: controller_name,
              keyboardType: TextInputType.number,
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  hintText: hint_text,
                  errorText: error_text,
                  hintStyle: TextStyle(color: Colors.black54),
                  errorStyle: TextStyle(
                    height: 2,
                  )),
              validator: (value) {
                if (value!.isEmpty) {
                  return "phone number can not empty";
                } else if (value.length != 10) {
                  return error_flag;
                }
                return null;
              },
            ),
          ],
        ),
      ],
    );
  }

  Widget buildPhone(var controller_name, text_error) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 5,
        ),
        Stack(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(10),
                  // ignore: prefer_const_literals_to_create_immutables
                  boxShadow: [
                    const BoxShadow(
                      color: Colors.white,
                      blurRadius: 0,
                      offset: Offset(0, 2),
                    )
                  ]),
              height: 60,
            ),
            TextFormField(
              controller: controller_name,
              keyboardType: TextInputType.phone,
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(top: 18),
                  prefixIcon: Padding(
                    padding: EdgeInsets.only(top: 16),
                    child: Icon(
                      Icons.phone_outlined,
                      color: Colors.black54,
                    ),
                  ),
                  hintText: 'phone number',
                  errorText: text_error,
                  hintStyle: TextStyle(color: Colors.black54),
                  errorStyle: TextStyle(
                    height: 2,
                  )),
              validator: (value) {
                if (value!.isEmpty) {
                  return "phone number can not empty";
                } else if (value.length != 10) {
                  return "invalid phone number";
                }
                return null;
              },
            ),
          ],
        ),
      ],
    );
  }

// Pincode filed
  Widget buildPincode(
      var label, var hint_text, var error_flag, var controller_name) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 5,
        ),
        Text(
          label,
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        Stack(
          children: [
            Container(
              alignment: Alignment.centerLeft,
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
            TextFormField(
              controller: controller_name,
              keyboardType: TextInputType.number,
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  hintText: hint_text,
                  hintStyle: TextStyle(color: Colors.black54),
                  errorStyle: TextStyle(
                    height: 2,
                  )),
              validator: (value) {
                if (value!.isEmpty) {
                  return "phone number can not empty";
                } else if (value.length != 6) {
                  return error_flag;
                }
                return null;
              },
            ),
          ],
        ),
      ],
    );
  }

//otp box widget
  Widget buildOtp(BuildContext context, var controller_name) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          height: 68,
          width: 64,
          child: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey, width: 2)),
            child: TextFormField(
              controller: controller_name,
              onChanged: (value) {
                if (value.length == 1) {
                  FocusScope.of(context).nextFocus();
                }
              },
              onSaved: (pin1) {},
              decoration: const InputDecoration(hintText: "0"),
              style: Theme.of(context).textTheme.headline6,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              inputFormatters: [
                LengthLimitingTextInputFormatter(1),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget PostTextArea(var hint_text, var error_flag, var controller_name) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 5,
        ),
        Stack(
          children: [
            Container(
              alignment: Alignment.centerLeft,
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
              height: 200,
            ),
            TextFormField(
              controller: controller_name,
              maxLines: 8,
              keyboardType: TextInputType.multiline,
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  hintText: hint_text,
                  hintStyle: TextStyle(color: Colors.black54),
                  errorStyle: TextStyle(
                    height: 2,
                  )),
              validator: (value) {
                if (value!.isEmpty) {
                  return error_flag;
                }
                return null;
              },
            ),
          ],
        ),
      ],
    );
  }

  Widget buildTimeFiled(BuildContext context, String time) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 5,
        ),
        Stack(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                color: Colors.black12,
                borderRadius: BorderRadius.circular(10),
                // ignore: prefer_const_literals_to_create_immutables
                boxShadow: [
                  const BoxShadow(
                    color: Colors.white,
                    blurRadius: 0,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              height: 60,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Icons.alarm_outlined),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        time ?? "select cooking time",
                        style: TextStyle(color: Colors.black54),
                      ),
                    ],
                  ),
                  TextButton(
                      onPressed: (() => showTimePicker(
                          context: context, initialTime: TimeOfDay.now())),
                      child: Text("select")),
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}
