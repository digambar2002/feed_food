import 'dart:convert';
import 'dart:core';
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
      var response = await await http.post(Uri.parse(url), body: {
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
        print("not connectd");
      }
      setState(() {});
    } catch (e) {}
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
          child: (FoodPostHistoryList.postHistory != null &&
                  FoodPostHistoryList.postHistory.isNotEmpty)
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
                      child: ClipPath(
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          decoration: const BoxDecoration(
                            border: Border(
                              left: BorderSide(
                                color: Colors.deepPurple,
                                width: 5,
                              ),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    FoodPostHistoryList.postHistory[index]
                                                .FoodDetails.length >
                                            20
                                        ? FoodPostHistoryList
                                                .postHistory[index].FoodDetails
                                                .substring(0, 20) +
                                            '...'
                                        : FoodPostHistoryList
                                            .postHistory[index].FoodDetails,
                                    style: const TextStyle(
                                        fontSize: 18,
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
                                        ? FoodPostHistoryList
                                                .postHistory[index].Address
                                                .substring(0, 25) +
                                            '...'
                                        : FoodPostHistoryList
                                            .postHistory[index].Address,
                                    style: const TextStyle(
                                        color: Colors.black, fontSize: 14),
                                  ),
                                  Text(
                                      FoodPostHistoryList
                                          .postHistory[index].CurrentTime
                                          .replaceAll(" ", "\n"),
                                      style: const TextStyle(
                                          color: Colors.black54, fontSize: 12)),
                                ],
                              ),
                              Column(
                                children: [
                                  Text(
                                    FoodPostHistoryList
                                        .postHistory[index].Status,
                                    style: TextStyle(
                                        color: FoodPostHistoryList
                                                    .postHistory[index]
                                                    .Status ==
                                                "Completed"
                                            ? Colors.green
                                            : Colors.orange,
                                        fontSize: 14),
                                  ),
                                ],
                              ),
                            ],
                          ),
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
