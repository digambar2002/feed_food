import 'dart:convert';

import 'package:feed_food/utils/globals.dart';
import 'package:feed_food/utils/logout.dart';
import 'package:feed_food/utils/routes.dart';
import 'package:feed_food/volunteer/profile/v_edit_profile.dart';
import 'package:feed_food/volunteer/profile/model.dart';
import 'package:feed_food/widgets/dialogue_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../utils/strings.dart';
import '../../widgets/cards.dart';
import 'package:http/http.dart' as http;

import '../../widgets/sheet.dart';

class VProfilePage extends StatefulWidget {
  const VProfilePage({super.key});

  @override
  State<VProfilePage> createState() => _VProfilePageState();
}

class _VProfilePageState extends State<VProfilePage> {
  String? name;
  String? email;
  String? address;
  String? phoneNo;

  String? donation = '';
  String? completed;
  String? pending;

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
          name = response['fname'] + " " + response['lname'];
        }

        if (response['address'] == null) {
          address = null;
        } else {
          address = response['address'] + " " + response['pincode'];
        }

        email = response['email'] ?? '';
        phoneNo = response['phone'] ?? '';
      });

      print(response['fname']);
    } catch (e) {
      // print(e);
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light),
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(255, 155, 110, 246),
                      Color.fromARGB(255, 116, 182, 247)
                    ],
                  ),
                ),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 25,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'My Profile',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w600),
                          ),
                          IconButton(
                              onPressed: (() {
                                showDialog(
                                    context: context,
                                    builder: ((context) =>
                                        MyDialogue().logotDialogue(context)));
                              }),
                              icon: const Icon(
                                Icons.logout_outlined,
                                color: Colors.white,
                              ))
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Column(children: [
                      Stack(
                        children: [
                          Positioned(
                            top: 200,
                            child: Container(
                              decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 255, 255, 255),
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20)),
                              ),
                              height: 600,
                              width: 400,
                            ),
                          ),
                          Stack(
                            alignment: Alignment.topCenter,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 50,
                                  left: 10,
                                  right: 10,
                                  bottom: 30,
                                ),
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15)),
                                  elevation: 5,
                                  child: Center(
                                      child: Column(
                                    children: [
                                      const SizedBox(
                                        height: 90,
                                      ),
                                      Text(
                                        name ?? UserUsername,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 18),
                                      ),
                                      Text(
                                        UserType,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w600,
                                            color: Colors.grey),
                                      ),
                                      const SizedBox(
                                        height: 30,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [],
                                        ),
                                      )
                                    ],
                                  )),
                                ),
                              ),
                              Stack(children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(80.0),
                                  child: const FadeInImage(
                                    placeholder:
                                        AssetImage('assets/images/avtar.png'),
                                    image: NetworkImage(
                                        'https://volunteercentrewi.org/wp-content/uploads/2021/07/avatar-1577909_640.png'),
                                    height: 120,
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(75, 75, 0, 0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.deepPurple,
                                      borderRadius: BorderRadius.circular(40),
                                    ),
                                    child: IconButton(
                                      color: Colors.white,
                                      icon: const Icon(Icons.edit),
                                      onPressed: () {
                                        Navigator.pushNamed(context,
                                                FeedFoodRoutes().vEditProfile)
                                            .then((_) {
                                          setState(() {
                                            // Call setState to refresh the page.
                                            userProfile();
                                          });
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              ]),
                            ],
                          ),
                        ],
                      ),
                    ]),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Card(
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      child: SizedBox(
                        width: 600,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: RichText(
                                text: const TextSpan(children: [
                                  WidgetSpan(
                                    child: Icon(
                                      Icons.location_on_outlined,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  TextSpan(
                                    text: " Address",
                                    style: TextStyle(
                                        color: Colors.black54, fontSize: 16),
                                  ),
                                ]),
                              ),
                            ),
                            address != null
                                ? Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 20, horizontal: 40),
                                    child: Text(
                                      '${address}',
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  )
                                : Center(
                                    child: Column(
                                      children: [
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        OutlinedButton.icon(
                                          onPressed: () {
                                            Navigator.pushNamed(
                                                    context,
                                                    FeedFoodRoutes()
                                                        .vEditProfile)
                                                .then((_) {
                                              setState(() {
                                                // Call setState to refresh the page.
                                                userProfile();
                                              });
                                            });
                                          },
                                          icon: const Icon(
                                            Icons.edit,
                                            size: 24.0,
                                          ),
                                          label: const Text('add address'),
                                        ),
                                        const SizedBox(
                                          height: 30,
                                        ),
                                      ],
                                    ),
                                  ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    infoCard(
                        ' Mobile', "+91-${phoneNo}", Icons.smartphone_outlined),
                    const SizedBox(
                      height: 20,
                    ),
                    infoCard(' Email', "${email}", Icons.email_outlined),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget infoCard(String keyName, String valueName, IconData iconName) {
    return Card(
      elevation: 20,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: SizedBox(
        width: 600,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: RichText(
                text: TextSpan(children: [
                  WidgetSpan(
                    child: Icon(
                      iconName,
                      color: Colors.grey,
                    ),
                  ),
                  TextSpan(
                    text: keyName,
                    style: const TextStyle(color: Colors.black54, fontSize: 14),
                  ),
                ]),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
              child: RichText(
                text: TextSpan(children: [
                  TextSpan(
                    text: valueName,
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  ),
                ]),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }

  Widget buildStat(String numberText, String titleText) {
    return Container(
      child: Column(
        children: [
          Text(numberText,
              style: const TextStyle(
                  color: Colors.black87,
                  fontSize: 20,
                  fontWeight: FontWeight.w600)),
          Text(titleText,
              style: const TextStyle(
                  color: Colors.black54,
                  fontSize: 14,
                  fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}
