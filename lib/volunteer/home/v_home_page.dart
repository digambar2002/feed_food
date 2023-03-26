import 'dart:convert';

import 'package:feed_food/models/news_model.dart';
import 'package:feed_food/widgets/cards.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_browser/flutter_web_browser.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

import '../../utils/strings.dart';

class VHomePage extends StatefulWidget {
  const VHomePage({super.key});

  @override
  State<VHomePage> createState() => _VHomePageState();
}

class _VHomePageState extends State<VHomePage> {
  @override
  void initState() {
    // TODO: implement initState

    // setState(() {});
    super.initState();
    getNews();
  }

  getNews() async {
    // URL for the news API endpoint
    var url =
        'https://newsapi.org/v2/top-headlines?country=us&apiKey=492cea89686a4a0cbd038b1015ad08c3';
    try {
      // Make a GET request to the API endpoint
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        // Decode the JSON data from the response
        var data = jsonDecode(response.body);
        // Return the list of articles from the API
        var productsData = data['articles'];
        NewsModel.News = List.from(productsData)
            .map<Articles>((item) => Articles.fromMap(item))
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
        title: Text(
          FeedFoodStrings.BrandName,
          style: GoogleFonts.dancingScript(
              fontWeight: FontWeight.w900,
              fontSize: 28,
              color: Colors.deepPurple[500]),
        ),

        // to remove arrow
        automaticallyImplyLeading: false,
        elevation: 0,
        actions: [
          Row(
            children: [
              IconButton(
                onPressed: (() {
                  FlutterWebBrowser.openWebPage(url: FeedFoodStrings.url);
                }),
                icon: const Icon(Icons.public_outlined),
              ),
              // IconButton(
              //   onPressed: (() {
              //     print(isTypeSet);
              //   }),
              //   icon: const Icon(Icons.volunteer_activism_outlined),
              // ),
            ],
          )
        ],
      ),
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 20,
              ),
              const VHomeCard(),
              const SizedBox(
                height: 30,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Donate",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.blueGrey[900]),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      TileCrad(
                        title_text: "Food",
                        image_url: "assets/images/v_home_icon_1.png",
                        openUrl: FeedFoodStrings.ngo_url1,
                      ),
                      TileCrad(
                        title_text: "Education",
                        image_url: "assets/images/v_home_icon_2.png",
                        openUrl: FeedFoodStrings.ngo_url2,
                      ),
                      TileCrad(
                        title_text: "Water",
                        image_url: "assets/images/v_home_icon_3.png",
                        openUrl: FeedFoodStrings.ngo_url3,
                      ),
                      TileCrad(
                        title_text: "Clothes",
                        image_url: "assets/images/v_home_icon_4.png",
                        openUrl: FeedFoodStrings.ngo_url4,
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Lates Update",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.blueGrey[900]),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Flexible(
                child: (NewsModel.News.isNotEmpty)
                    ? ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: NewsModel.News.length,
                        itemBuilder: ((context, index) {
                          return NewsCards(
                            articles: NewsModel.News[index],
                          );
                        }))
                    : const Center(
                        child: CircularProgressIndicator(),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
