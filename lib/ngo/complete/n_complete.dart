import 'dart:convert';

import 'package:feed_food/ngo/models/n_home_model.dart';
import 'package:feed_food/utils/globals.dart';
import 'package:feed_food/widgets/cards.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../utils/strings.dart';

class NComplete extends StatefulWidget {
  const NComplete({super.key});

  @override
  State<NComplete> createState() => _NCompleteState();
}

class _NCompleteState extends State<NComplete> {
  bool foodlist = true;
  bool foodData = false;

  @override
  void initState() {
    // TODO: implement initState
    _getCompleted();
    super.initState();
  }

  _getCompleted() async {
    var url = FeedFoodStrings.ngo_food_complete_url;

    try {
      // Make a GET request to the API endpoint
      var response = await http.post(Uri.parse(url),
          body: ({'FoodRequestComplete': UserAccountNo}));

      if (response.statusCode == 200) {
        // Decode the JSON data from the response
        var data = jsonDecode(response.body);
        // Return the list of articles from the API
        var products_data = data['request'];

        if (products_data == false) {
          setState(() {
            foodlist = false;
          });
        } else {
          setState(() {
            foodData = true;
          });
          NgoFoodRequest.requestList = List.from(products_data)
              .map<NgoFoodRequestModel>(
                  (item) => NgoFoodRequestModel.fromMap(item))
              .toList();
        }
      } else {
        // If the response was not successful, throw an error
        print("not connectd");
      }
      setState(() {});
    } catch (e) {
      print(e);
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
            children: const [
              Text(
                "Completed",
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
      body: foodlist == true && foodData == false
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : foodlist == false
              ? const SizedBox(
                  height: 300,
                  child: Center(
                    child: Text("You didn't complete any food request"),
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: ListView.builder(
                    itemCount: NgoFoodRequest.requestList.length,
                    itemBuilder: ((context, index) {
                      return NCompleteCard(
                          foodRequest: NgoFoodRequest.requestList[index]);
                    }),
                  ),
                ),
    );
  }
}
