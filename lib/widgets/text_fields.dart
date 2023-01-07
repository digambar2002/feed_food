import 'package:flutter/material.dart';

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
}
