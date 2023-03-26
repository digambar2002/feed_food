import 'dart:convert';

import 'package:feed_food/volunteer/profile/model.dart';
import 'package:flutter/material.dart';

import '../../utils/globals.dart';
import '../../utils/strings.dart';
import 'package:http/http.dart' as http;

class VEditProfile extends StatefulWidget {
  const VEditProfile({super.key});

  @override
  _VEditProfileState createState() => _VEditProfileState();
}

class _VEditProfileState extends State<VEditProfile> {
  final _formKey = GlobalKey<FormState>();

  final _c_firstName = TextEditingController();
  final _c_lastName = TextEditingController();
  final _c_address = TextEditingController();
  final _c_zipCode = TextEditingController();

  bool data = false;

  @override
  void initState() {
    // TODO: implement initState

    userProfile();
    super.initState();
  }

  Future userProfile() async {
    String uri = FeedFoodStrings.volunteer_profile_url;
    try {
      http.Response res =
          await http.post(Uri.parse(uri), body: {'accountNo': UserAccountNo});

      var response = jsonDecode(res.body);
      setState(() {
        if (response['fname'] != null) {
          _c_firstName.text = response['fname'];
        }

        if (response['lname'] != null) {
          _c_lastName.text = response['lname'];
        }

        if (response['address'] != null) {
          _c_address.text = response['address'];
        }

        if (response['pincode'] != null) {
          _c_zipCode.text = response['pincode'];
        }

        data = true;
      });
    } catch (e) {
      // print(e);
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        title: const Text('Edit Profile'),
      ),
      body: data == false
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        controller: _c_firstName,
                        decoration:
                            const InputDecoration(labelText: 'First Name'),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your first name';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        controller: _c_lastName,
                        decoration:
                            const InputDecoration(labelText: 'Last Name'),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your last name';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        controller: _c_address,
                        decoration: const InputDecoration(labelText: 'Address'),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your address';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        controller: _c_zipCode,
                        keyboardType: TextInputType.number,
                        decoration:
                            const InputDecoration(labelText: 'Zip Code'),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your zip code';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),
                      Center(
                          child: SizedBox(
                        height: 50,
                        width: 360,
                        child: ElevatedButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              // Form is valid, do something
                              showDialog(
                                  context: context,
                                  barrierDismissible: false,
                                  builder: ((context) {
                                    return const Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  }));
                              dynamic flag = await ProfileModel()
                                  .userProfileUpdate(
                                      _c_firstName.text,
                                      _c_lastName.text,
                                      _c_address.text,
                                      _c_zipCode.text);

                              if (flag == true) {
                                Navigator.of(context).pop();
                                Navigator.of(context).pop();
                              } else {
                                Navigator.of(context).pop();
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(const SnackBar(
                                  content: Text("Something went wrong"),
                                ));
                              }
                            }
                          },
                          child: const Text('Submit'),
                        ),
                      )),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
