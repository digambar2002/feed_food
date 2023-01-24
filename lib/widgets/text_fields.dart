// Author: Digambar Chaudhari
// Author: Bhavesh Patil
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FoodTextField {
  //  Email Text Field
  Widget buildEmail(var controller_name) {
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
              keyboardType: TextInputType.emailAddress,
              style: const TextStyle(color: Colors.black),
              decoration: const InputDecoration(
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

  Widget buildEmailNoIcon(var controller_name, var label, var hint_text) {
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

// Text fields

  //  Email Text Field
  Widget buildTextUsername(var controller_name) {
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
              keyboardType: TextInputType.emailAddress,
              style: const TextStyle(color: Colors.black),
              decoration: const InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(top: 18),
                  prefixIcon: Padding(
                    padding: EdgeInsets.only(top: 16),
                    child: Icon(
                      Icons.person_outline_outlined,
                      color: Colors.black54,
                    ),
                  ),
                  hintText: 'username',
                  hintStyle: TextStyle(color: Colors.black54),
                  errorStyle: TextStyle(
                    height: 2,
                  )),
              validator: (value) {
                final bool usernameValid = RegExp(r"^[a-zA-Z0-9_]{3,15}$")
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

  Widget buildTextLabel(
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
              keyboardType: TextInputType.text,
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
              height: 100,
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

  // Number field Widget
  Widget buildNumber(
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

  Widget buildPhoneLabel(
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

  Widget buildPhone(var controller_name) {
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
              style: const TextStyle(color: Colors.black),
              decoration: const InputDecoration(
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
  Widget buildOtp(BuildContext context) {
    return Form(
        child: Row(
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
        SizedBox(
          height: 68,
          width: 64,
          child: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey, width: 2)),
            child: TextFormField(
              onChanged: (value) {
                if (value.length == 1) {
                  FocusScope.of(context).nextFocus();
                }
              },
              onSaved: (pin2) {},
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
        SizedBox(
          height: 68,
          width: 64,
          child: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey, width: 2)),
            child: TextFormField(
              onChanged: (value) {
                if (value.length == 1) {
                  FocusScope.of(context).nextFocus();
                }
              },
              onSaved: (pin3) {},
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
        SizedBox(
          height: 68,
          width: 64,
          child: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey, width: 2)),
            child: TextFormField(
              onChanged: (value) {
                if (value.length == 1) {
                  FocusScope.of(context).nextFocus();
                }
              },
              onSaved: (pin4) {},
              decoration: const InputDecoration(hintText: "0"),
              style: Theme.of(context).textTheme.headline6,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              inputFormatters: [
                LengthLimitingTextInputFormatter(1),
              ],
            ),
          ),
        )
      ],
    ));
  }
}
