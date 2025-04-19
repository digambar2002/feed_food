// ignore_for_file: public_member_api_docs, sort_constructors_first
//Author : Prachi Nathjogi
//Author : Digambar Chaudhari

import 'dart:convert';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:feed_food/utils/globals.dart';
import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:maps_launcher/maps_launcher.dart';

import '../../utils/routes.dart';
import '../../utils/strings.dart';

class NPendingDetail extends StatefulWidget {
  String senderId;
  String foodId;
  String imgUrl;

  NPendingDetail({
    Key? key,
    required this.senderId,
    required this.foodId,
    required this.imgUrl,
  }) : super(key: key);

  @override
  State<NPendingDetail> createState() => _NPendingDetailState();
}

class _NPendingDetailState extends State<NPendingDetail> {
  String? title;
  String? name;
  String? fname;
  String? accountNo;
  String? cookingTime;
  String? quantity;
  String? address;
  String? phone;
  String? zip;
  String? lat;
  String? long;
  String? mobileNo;

  String status = "0";

  @override
  void initState() {
    // TODO: implement initState
    getFood();
    super.initState();
  }

  // get food details

  Future getFood() async {
    String uri = FeedFoodStrings.ngo_food_details_url;

    try {
      http.Response res = await http.post(Uri.parse(uri), body: {
        'AccountNo': widget.senderId,
        'id': widget.foodId,
      });

      var response = jsonDecode(res.body);

      if (response['success'] == false) {
        // no data in database error 1
        status = "1";
      } else if (response != null) {
        setState(() {
          title = response['FoodDetails'];
          fname = response['fname'];
          name = "${response['fname']} ${response['lname']}";
          cookingTime = response['CookingTime'];
          quantity = response['FoodQuantity'];
          accountNo = response['SenderAccountNo'];
          address = "${response['Address']} , ${response['ZipCode']}";
          lat = response['latitude'];
          long = response['longitude'];
          mobileNo = response['phone'];

          // data in database
          status = "2";
        });
      }
    } catch (e) {
      print(e);

      Navigator.pop(context);
      return false;
    }
  }

  // Accept Food Request
  Future updateFoodStatus() async {
    String uri = FeedFoodStrings.ngo_update_complete_food_url;

    try {
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: ((context) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }));

      http.Response res = await http.post(Uri.parse(uri), body: {
        'completeFoodRequest': UserAccountNo,
        'id': widget.foodId,
      });

      var response = jsonDecode(res.body);

      if (response['success'] == true) {
        Navigator.of(context).pop();
        AwesomeDialog(
          context: context,
          dialogType: DialogType.success,
          animType: AnimType.scale,
          title: 'Food Request Completed',
          desc: 'Thanks for collecting food',
          btnOkOnPress: () {
            Navigator.pushReplacementNamed(
                context, FeedFoodRoutes().nMainRoute);
          },
        ).show();
      } else {}
    } catch (e) {
      print(e);

      Navigator.pop(context);
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.white, statusBarBrightness: Brightness.light));
    return status == "0"
        ? const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          )
        : Scaffold(
            appBar: AppBar(
              elevation: 1,
              title: Container(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Food Detail",
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
            body: Stack(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Image.asset(widget.imgUrl, fit: BoxFit.fill),
                ),
                scroll(),
              ],
            ),
            bottomNavigationBar: SizedBox(
              height: 60,
              width: 300,
              child: ElevatedButton(
                onPressed: () {
                  updateFoodStatus();
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green[800],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0),
                    )),
                child: const Text(
                  "Completed",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          );
  }

  scroll() {
    return DraggableScrollableSheet(
        initialChildSize: 0.6,
        maxChildSize: 1.0,
        minChildSize: 0.6,
        builder: (context, ScrollController) {
          return Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            clipBehavior: Clip.hardEdge,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            ),
            child: SingleChildScrollView(
              controller: ScrollController,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 5,
                          width: 35,
                          color: Colors.black12,
                        ),
                      ],
                    ),
                  ),
                  Text(
                    title ?? "null",
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      // For NGO Profile
                      const CircleAvatar(
                        radius: 25,
                        backgroundImage:
                            AssetImage("assets/images/Profile Pic.png"),
                      ),
                      const SizedBox(
                        width: 10,
                      ),

                      fname == null
                          ? Text(
                              accountNo ?? "",
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          : Text(
                              name ?? "",
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    child: Divider(
                      height: 8,
                    ),
                  ),
                  const Text(
                    "Cooking Time",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Text(
                    cookingTime ?? "",
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Quantity",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Text(
                    "For $quantity People",
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    child: Divider(
                      height: 8,
                    ),
                  ),
                  const Text(
                    "Address",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    address ?? "",
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    'Mobile No: $mobileNo',
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    child: Divider(
                      height: 6,
                    ),
                  ),
                  lat == null || lat == "null"
                      ? const SizedBox(
                          height: 10,
                        )
                      : TextButton(
                          onPressed: (() {
                            MapsLauncher.launchCoordinates(
                                double.parse(lat!), double.parse(long!));
                          }),
                          child: const Text("open location in map"),
                        ),
                ],
              ),
            ),
          );
        });
  }
}
