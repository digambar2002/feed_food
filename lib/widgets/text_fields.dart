// Author: Digambar Chaudhari

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FoodTextField {
  //  Email Text Field
  Widget buildEmail() {
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
              keyboardType: TextInputType.emailAddress,
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(top: 18),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.only(top: 16),
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
                if (value!.isEmpty) {
                  return "email not empty";
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
  Widget buildPassword() {
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

// Text fields

  Widget buildText(var label, var hint_text, var error_flag) {
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
