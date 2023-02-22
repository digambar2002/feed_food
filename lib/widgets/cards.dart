// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_web_browser/flutter_web_browser.dart';

import 'package:feed_food/models/news_model.dart';

class VHomeCard extends StatelessWidget {
  const VHomeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 400,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 155, 110, 246),
            Color.fromARGB(255, 116, 182, 247)
          ],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
        ),
      ),
      child: Row(
        children: [
          Column(
            children: [
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  "Share Your Love \n with donation",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 30,
                width: 100,
                child: ElevatedButton(
                  onPressed: (() {
                    print("hello world");
                  }),
                  child: Text(
                    "Donate",
                    style: TextStyle(fontSize: 14),
                  ),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.deepPurple[900],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      )),
                ),
              ),
            ],
          ),
          SizedBox(
            width: 10,
          ),
          Image.asset(
            "assets/images/donate_love.png",
            height: 160,
          ),
        ],
      ),
    );
  }
}

class TileCrad extends StatelessWidget {
  final String title_text;
  final String image_url;
  final String openUrl;
  TileCrad(
      {super.key,
      required this.title_text,
      required this.image_url,
      required this.openUrl});

  @override
  Widget build(BuildContext context) {
    return Card(
      // color: Color.fromARGB(255, 199, 185, 249),
      elevation: 5,
      child: InkWell(
        onTap: (() async {
          await FlutterWebBrowser.openWebPage(
            url: openUrl,
            customTabsOptions: const CustomTabsOptions(
              colorScheme: CustomTabsColorScheme.dark,
              toolbarColor: Colors.deepPurple,
              secondaryToolbarColor: Colors.green,
              navigationBarColor: Colors.amber,
              shareState: CustomTabsShareState.on,
              instantAppsEnabled: true,
              showTitle: true,
              urlBarHidingEnabled: true,
            ),
          );
        }),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          child: Column(
            children: [
              Image.asset(
                image_url,
                height: 40,
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                title_text,
                style: TextStyle(fontSize: 12),
              )
            ],
          ),
        ),
      ),
    );
  }
}

// Volunteer home page card
class NewsCards extends StatelessWidget {
  // we need list of articles
  final Articles articles;
  String str = "";
  NewsCards({super.key, required this.articles}) : assert(articles != null);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
          elevation: 10,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                SizedBox(
                  height: 8,
                ),
                FadeInImage(
                    placeholder: AssetImage("assets/images/news_default.jpg"),
                    image: NetworkImage(
                      articles.urlToImage,
                    )),
                // Image.network(
                //   articles.urlToImage,
                //   errorBuilder: (context, error, stackTrace) {
                //     return Text("can't load image");
                //   },
                // ),
                SizedBox(
                  height: 15,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(5),
                          bottomRight: Radius.circular(5)),
                      color: Colors.deepPurple[400],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(
                        articles.author,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Flexible(
                      child: Text(
                        articles.title,
                        overflow: TextOverflow.visible,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
                TextButton(
                    onPressed: (() async {
                      await FlutterWebBrowser.openWebPage(
                        url: articles.url,
                        customTabsOptions: const CustomTabsOptions(
                          colorScheme: CustomTabsColorScheme.dark,
                          toolbarColor: Colors.deepPurple,
                          secondaryToolbarColor: Colors.green,
                          navigationBarColor: Colors.amber,
                          shareState: CustomTabsShareState.on,
                          instantAppsEnabled: true,
                          showTitle: true,
                          urlBarHidingEnabled: true,
                        ),
                      );
                    }),
                    child: Text(
                      "read more",
                      style: TextStyle(),
                    )),
              ],
            ),
          )),
    );
  }

  // strConvert() {
  //   str = articles.title;
  //   return str.substring(0, 90) + "...";
  // }
}
