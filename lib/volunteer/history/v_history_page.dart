import 'dart:convert';
import 'dart:core';

import 'package:feed_food/models/food_post_model.dart';
import 'package:feed_food/utils/globals.dart';
import 'package:feed_food/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class VHistory extends StatefulWidget {
  const VHistory({super.key});

  @override
  State<VHistory> createState() => _VHistoryState();
}

class _VHistoryState extends State<VHistory> {
  List<String> randomImages = [
    "assets/images/nHome1.png",
    "assets/images/nHome2.png",
    "assets/images/nHome3.png",
    "assets/images/nHome4.jpg",
    "assets/images/nHome5.jpg",
    "assets/images/nHome6.jpg",
    "assets/images/nHome7.jpg",
    "assets/images/nHome8.jpg",
    "assets/images/nHome9.jpg",
    "assets/images/nHome10.jpg",
  ];
  String? imagePath;

  @override
  void initState() {
    // TODO: implement initState
    getHistory();
    super.initState();
  }

  getHistory() async {
    // URL for the news API endpoint
    var url = FeedFoodStrings.volunteer_history_url;
    try {
      // Make a GET request to the API endpoint
      var response = await http.post(Uri.parse(url), body: {
        'accountNo': UserAccountNo,
      });
      if (response.statusCode == 200) {
        // Decode the JSON data from the response
        var data = jsonDecode(response.body);
        // Return the list of articles from the API
        var foodHistory = data['request'];

        FoodPostHistoryList.postHistory = List.from(foodHistory)
            .map<FoodPostHistoryModel>(
                (item) => FoodPostHistoryModel.fromMap(item))
            .toList();
      } else {
        // If the response was not successful, throw an error
      }
      setState(() {});
    } catch (e) {}
  }

  String getImage() {
    randomImages.shuffle();
    return imagePath = randomImages[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "History",
            style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18,
                color: Colors.black87),
          ),
          elevation: 1,
          // automaticallyImplyLeading: false,
        ),
        body: Container(
          child: (FoodPostHistoryList.postHistory.isNotEmpty)
              ? ListView.builder(
                  itemCount: FoodPostHistoryList.postHistory.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) => Container(
                    width: MediaQuery.of(context).size.width,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Card(
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Container(
                                      width: 90,
                                      height: 90,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(getImage()),
                                          fit: BoxFit.cover,
                                        ),
                                      )),
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                SizedBox(
                                  width: 150,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        FoodPostHistoryList.postHistory[index]
                                                    .FoodDetails.length >
                                                26
                                            ? '${FoodPostHistoryList.postHistory[index].FoodDetails.substring(0, 20)}...'
                                            : FoodPostHistoryList
                                                .postHistory[index].FoodDetails,
                                        style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.deepPurple),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        FoodPostHistoryList.postHistory[index]
                                                    .Address.length >
                                                25
                                            ? '${FoodPostHistoryList.postHistory[index].Address.substring(0, 25)}...'
                                            : FoodPostHistoryList
                                                .postHistory[index].Address,
                                        style: const TextStyle(
                                            color: Colors.black, fontSize: 12),
                                      ),
                                      Text(
                                          FoodPostHistoryList
                                              .postHistory[index].CurrentTime
                                              .replaceAll(" ", "\n"),
                                          style: const TextStyle(
                                              color: Colors.black54,
                                              fontSize: 10)),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              FoodPostHistoryList.postHistory[index].Status,
                              style: TextStyle(
                                  color: FoodPostHistoryList
                                              .postHistory[index].Status ==
                                          "completed"
                                      ? Colors.green
                                      : FoodPostHistoryList
                                                  .postHistory[index].Status ==
                                              "new"
                                          ? Colors.deepPurple
                                          : Colors.orange,
                                  fontSize: 10),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              : const Center(
                  child: CircularProgressIndicator(),
                ),
        ));
  }
}
