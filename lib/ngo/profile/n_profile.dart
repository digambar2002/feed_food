import 'dart:convert';

import 'package:feed_food/utils/routes.dart';
import 'package:feed_food/widgets/sheet.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../utils/globals.dart';
import '../../utils/strings.dart';
import '../../widgets/dialogue_box.dart';
import 'n_profile.dart';

class NProfile extends StatefulWidget {
  @override
  State<NProfile> createState() => _NProfileState();
}

class _NProfileState extends State<NProfile> {
  String? name;

  String? email;

  String? address;

  String? phoneNo;

  bool data = false;

  @override
  void initState() {
    // TODO: implement initState

    userProfile();

    super.initState();
  }

  Future userProfile() async {
    String uri = FeedFoodStrings.ngo_profile_url;

    try {
      http.Response res =
          await http.post(Uri.parse(uri), body: {'accountNo': UserAccountNo});

      var response = jsonDecode(res.body);
      setState(() {
        if (response['ngoName'] != null) {
          name = response['ngoName'];
        }

        if (response['ngoAddress'] == null) {
          address = null;
        } else {
          address = response['ngoAddress'] + " " + response['ngoPincode'];
        }

        email = response['ngoEmail'] ?? '';
        phoneNo = response['ngoType'] ?? '';

        data = true;
      });

      print(response['fname']);
    } catch (e) {
      // print(e);
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: Container(
          alignment: Alignment.centerLeft,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Profile",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
      ),
      body: data == false
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 150,
                      width: 115,
                      child: SizedBox(
                        height: 115,
                        width: 115,
                        child: CircleAvatar(
                          backgroundImage:
                              AssetImage("assets/images/ngo_profile.png"),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: Column(
                        children: [
                          Text(name ?? ""),
                          const SizedBox(
                            height: 30,
                          ),
                          const Divider(),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Column(
                                children: [
                                  ListTile(
                                    leading: Text(
                                      "NGO Name: ",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    trailing: Text(name ?? ""),
                                  ),
                                  ListTile(
                                    leading: Text(
                                      "Email: ",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    trailing: Text(email ?? ""),
                                  ),
                                  ListTile(
                                    leading: Text(
                                      "Phone No: ",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    trailing: Text(email ?? ""),
                                  ),
                                  ListTile(
                                    leading: Text(
                                      "Address: ",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    trailing: Text(address ?? ""),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  TextButton(
                                      onPressed: (() {
                                        showDialog(
                                            context: context,
                                            builder: ((context) => MyDialogue()
                                                .logotDialogue(context)));
                                      }),
                                      child: Text(
                                        "Logout",
                                        style: TextStyle(
                                            fontSize: 18, color: Colors.red),
                                      ))
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
