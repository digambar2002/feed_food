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
                  boxShadow: const [
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
              style: const TextStyle(color: Colors.black),
              obscureText: !_isVisible,
              enableSuggestions: false,
              autocorrect: false,
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: const EdgeInsets.only(top: 18),
                prefixIcon: const Padding(
                  padding: EdgeInsets.only(top: 8),
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
                        ? const Icon(
                            Icons.visibility_outlined,
                            color: Colors.black,
                          )
                        : const Icon(
                            Icons.visibility_off_outlined,
                            color: Colors.grey,
                          ),
                  ),
                ),
                hintText: 'password',
                hintStyle: const TextStyle(color: Colors.black54),
                errorStyle: const TextStyle(
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
  Widget buildEmail(var controllerName, var errorText) {
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
              controller: controllerName,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              keyboardType: TextInputType.emailAddress,
              style: const TextStyle(color: Colors.black),
              decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.only(top: 18),
                  prefixIcon: const Padding(
                    padding: EdgeInsets.only(top: 16),
                    child: Icon(
                      Icons.email_outlined,
                      color: Colors.black54,
                    ),
                  ),
                  hintText: 'Email',
                  errorText: errorText,
                  hintStyle: const TextStyle(color: Colors.black54),
                  errorStyle: const TextStyle(
                    height: 2,
                  )),
              validator: (value) {
                final bool emailValid = RegExp(
                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                    .hasMatch(controllerName.text);

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
      var controllerName, var label, var hintText, var emailError) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 5,
        ),
        Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
        Stack(
          children: [
            Container(
              alignment: Alignment.centerLeft,
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
            TextFormField(
              controller: controllerName,
              keyboardType: TextInputType.text,
              style: const TextStyle(color: Colors.black),
              decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  hintText: hintText,
                  hintStyle: const TextStyle(color: Colors.black54),
                  errorText: emailError,
                  errorStyle: const TextStyle(
                    height: 2,
                  )),
              validator: (value) {
                final bool emailValid = RegExp(
                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                    .hasMatch(controllerName.text);

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
  Widget buildPassword(controllerName) {
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
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.white,
                      blurRadius: 0,
                      offset: Offset(0, 2),
                    )
                  ]),
              height: 60,
            ),
            TextFormField(
              controller: controllerName,
              keyboardType: TextInputType.visiblePassword,
              style: const TextStyle(color: Colors.black),
              obscureText: true,
              enableSuggestions: false,
              autocorrect: false,
              decoration: const InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 18),
                prefixIcon: Padding(
                  padding: EdgeInsets.only(top: 16),
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
      var label, var hintText, var errorFlag, var controllerName) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 5,
        ),
        Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
        Stack(
          children: [
            Container(
              alignment: Alignment.centerLeft,
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
            TextFormField(
              keyboardType: TextInputType.visiblePassword,
              controller: controllerName,
              style: const TextStyle(color: Colors.black),
              obscureText: true,
              enableSuggestions: false,
              autocorrect: false,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  hintText: hintText,
                  hintStyle: const TextStyle(color: Colors.black54),
                  errorStyle: const TextStyle(
                    height: 2,
                  )),
              validator: (value) {
                if (value!.isEmpty) {
                  return errorFlag;
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
  Widget buildTextUsername(var controllerName, var textError, var hintText) {
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
              controller: controllerName,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              keyboardType: TextInputType.emailAddress,
              style: const TextStyle(color: Colors.black),
              decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.only(top: 18),
                  prefixIcon: const Padding(
                    padding: EdgeInsets.only(top: 16),
                    child: Icon(
                      Icons.person_outline_outlined,
                      color: Colors.black54,
                    ),
                  ),
                  hintText: hintText,
                  errorText: textError,
                  hintStyle: const TextStyle(color: Colors.black54),
                  errorStyle: const TextStyle(
                    height: 2,
                  )),
              validator: (value) {
                final bool usernameValid = RegExp(r"^[a-zA-Z0-9_]{5,15}$")
                    .hasMatch(controllerName.text);
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

  Widget buildText(var hintText, controllerName) {
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
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.white,
                      blurRadius: 0,
                      offset: Offset(0, 2),
                    )
                  ]),
              height: 60,
            ),
            TextFormField(
              controller: controllerName,
              keyboardType: TextInputType.text,
              style: const TextStyle(color: Colors.black),
              autocorrect: false,
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: const EdgeInsets.only(top: 18),
                prefixIcon: const Padding(
                  padding: EdgeInsets.only(top: 16),
                  child: Icon(
                    Icons.person_outline_rounded,
                    color: Colors.black54,
                  ),
                ),
                hintText: hintText,
                hintStyle: const TextStyle(color: Colors.black54),
                errorStyle: const TextStyle(
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
  Widget buildTextLabel(var label, var hintText, var errorFlag,
      var controllerName, var errorText) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 5,
        ),
        Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
        Stack(
          children: [
            Container(
              alignment: Alignment.centerLeft,
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
            TextFormField(
              controller: controllerName,
              keyboardType: TextInputType.text,
              style: const TextStyle(color: Colors.black),
              decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  hintText: hintText,
                  errorText: errorText,
                  hintStyle: const TextStyle(color: Colors.black54),
                  errorStyle: const TextStyle(
                    height: 2,
                  )),
              validator: (value) {
                if (value!.isEmpty) {
                  return errorFlag;
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
      var label, var hintText, var errorFlag, var controllerName) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 5,
        ),
        Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
        Stack(
          children: [
            Container(
              alignment: Alignment.centerLeft,
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
              height: 125,
            ),
            TextFormField(
              controller: controllerName,
              maxLines: 4,
              keyboardType: TextInputType.multiline,
              style: const TextStyle(color: Colors.black),
              decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  hintText: hintText,
                  hintStyle: const TextStyle(color: Colors.black54),
                  errorStyle: const TextStyle(
                    height: 2,
                  )),
              validator: (value) {
                if (value!.isEmpty) {
                  return errorFlag;
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
  Widget buildNumber(var label, var hintText, var errorFlag, var controllerName,
      var errorText) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 5,
        ),
        Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
        Stack(
          children: [
            Container(
              alignment: Alignment.centerLeft,
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
            TextFormField(
              controller: controllerName,
              keyboardType: TextInputType.number,
              style: const TextStyle(color: Colors.black),
              decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  hintText: hintText,
                  errorText: errorText,
                  hintStyle: const TextStyle(color: Colors.black54),
                  errorStyle: const TextStyle(
                    height: 2,
                  )),
              validator: (value) {
                if (value!.isEmpty) {
                  return errorFlag;
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

  Widget buildPhoneLabel(var label, var hintText, var errorFlag,
      var controllerName, var errorText) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 5,
        ),
        Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
        Stack(
          children: [
            Container(
              alignment: Alignment.centerLeft,
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
            TextFormField(
              controller: controllerName,
              keyboardType: TextInputType.number,
              style: const TextStyle(color: Colors.black),
              decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  hintText: hintText,
                  errorText: errorText,
                  hintStyle: const TextStyle(color: Colors.black54),
                  errorStyle: const TextStyle(
                    height: 2,
                  )),
              validator: (value) {
                if (value!.isEmpty) {
                  return "phone number can not empty";
                } else if (value.length != 10) {
                  return errorFlag;
                }
                return null;
              },
            ),
          ],
        ),
      ],
    );
  }

  Widget buildPhone(var controllerName, textError) {
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
              controller: controllerName,
              keyboardType: TextInputType.phone,
              style: const TextStyle(color: Colors.black),
              decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.only(top: 18),
                  prefixIcon: const Padding(
                    padding: EdgeInsets.only(top: 16),
                    child: Icon(
                      Icons.phone_outlined,
                      color: Colors.black54,
                    ),
                  ),
                  hintText: 'phone number',
                  errorText: textError,
                  hintStyle: const TextStyle(color: Colors.black54),
                  errorStyle: const TextStyle(
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
      var label, var hintText, var errorFlag, var controllerName) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 5,
        ),
        Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
        Stack(
          children: [
            Container(
              alignment: Alignment.centerLeft,
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
            TextFormField(
              controller: controllerName,
              keyboardType: TextInputType.number,
              style: const TextStyle(color: Colors.black),
              decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  hintText: hintText,
                  hintStyle: const TextStyle(color: Colors.black54),
                  errorStyle: const TextStyle(
                    height: 2,
                  )),
              validator: (value) {
                if (value!.isEmpty) {
                  return errorFlag;
                } else if (value.length != 6) {
                  return "enter valid zip code";
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
  Widget buildOtp(BuildContext context, var controllerName) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          height: 68,
          width: 64,
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey, width: 2)),
            child: TextFormField(
              controller: controllerName,
              onChanged: (value) {
                if (value.length == 1) {
                  FocusScope.of(context).nextFocus();
                }
              },
              onSaved: (pin1) {},
              decoration: const InputDecoration(hintText: "0"),
              style: Theme.of(context).textTheme.titleLarge,
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

  Widget PostTextArea(var hintText, var errorFlag, var controllerName) {
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
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.white,
                      blurRadius: 0,
                      offset: Offset(0, 2),
                    )
                  ]),
              height: 120,
            ),
            TextFormField(
              controller: controllerName,
              maxLines: 4,
              keyboardType: TextInputType.multiline,
              style: const TextStyle(color: Colors.black),
              decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  hintText: hintText,
                  hintStyle: const TextStyle(color: Colors.black54),
                  errorStyle: const TextStyle(
                    height: 2,
                  )),
              validator: (value) {
                if (value!.isEmpty) {
                  return errorFlag;
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
                      const Icon(Icons.alarm_outlined),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        time,
                        style: const TextStyle(color: Colors.black54),
                      ),
                    ],
                  ),
                  TextButton(
                      onPressed: (() => showTimePicker(
                          context: context, initialTime: TimeOfDay.now())),
                      child: const Text("select")),
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}
