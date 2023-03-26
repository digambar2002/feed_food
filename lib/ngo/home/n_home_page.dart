import 'dart:convert';

import 'package:feed_food/ngo/models/n_home_model.dart';
import 'package:feed_food/utils/globals.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import '../../utils/strings.dart';
import '../../widgets/cards.dart';

class NHomePage extends StatefulWidget {
  const NHomePage({super.key});

  @override
  State<NHomePage> createState() => _NHomePageState();
}

class _NHomePageState extends State<NHomePage> {
  String? newStat = "";
  String? pendingStat = "";
  String? completedStat = "";
  bool foodlist = true;
  bool foodData = false;
  @override
  void initState() {
    // TODO: implement initState
    getFoodRequest();
    super.initState();
  }

  getFoodRequest() async {
    // URL for the news API endpoint
    var url = FeedFoodStrings.ngo_food_request_url;
    var url2 = FeedFoodStrings.ngo_stat_url;

    try {
      var response =
          await http.post(Uri.parse(url2), body: {"getStat": UserAccountNo});

      if (response.statusCode == 200) {
        // Decode the JSON data from the response
        var data = jsonDecode(response.body);
        // Return the list of articles from the API
        newStat = data['new'].toString();
        pendingStat = data['pending'].toString();
        completedStat = data['completed'].toString();
      } else {
        // If the response was not successful, throw an error
      }
    } catch (e) {}

    try {
      // Make a GET request to the API endpoint
      var response = await http.post(Uri.parse(url));

      if (response.statusCode == 200) {
        // Decode the JSON data from the response
        var data = jsonDecode(response.body);
        // Return the list of articles from the API
        var productsData = data['request'];

        if (productsData == false) {
          setState(() {
            foodlist = false;
          });
        } else {
          setState(() {
            foodData = true;
          });
          NgoFoodRequest.requestList = List.from(productsData)
              .map<NgoFoodRequestModel>(
                  (item) => NgoFoodRequestModel.fromMap(item))
              .toList();
        }
      } else {
        // If the response was not successful, throw an error
      }
      setState(() {});
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.deepPurple[500],
        statusBarBrightness: Brightness.light));
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[500],
        title: Text(
          FeedFoodStrings.BrandName,
          style: GoogleFonts.dancingScript(
              fontWeight: FontWeight.w900, fontSize: 28, color: Colors.white),
        ),
        automaticallyImplyLeading: false,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 250,
              width: 800,
              decoration: const BoxDecoration(color: Colors.deepPurple),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(
                      height: 5,
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "Request Status",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          decoration: TextDecoration.underline),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ReqCards(title1: newStat!, title2: "New"),
                        ReqCards(title1: pendingStat!, title2: "Pendding"),
                        ReqCards(title1: completedStat!, title2: "Completed"),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(13),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "New Request",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    foodlist == true && foodData == false
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : foodlist == false
                            ? const SizedBox(
                                height: 300,
                                child: Center(
                                  child: Text("No food donated"),
                                ),
                              )
                            : ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: NgoFoodRequest.requestList.length,
                                itemBuilder: ((context, index) {
                                  return NRequestCards(
                                      foodRequest:
                                          NgoFoodRequest.requestList[index]);
                                }),
                              ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
