import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_web_browser/flutter_web_browser.dart';

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

class NewsCards extends StatefulWidget {
  const NewsCards({super.key});

  @override
  State<NewsCards> createState() => _NewsCardsState();
}

class _NewsCardsState extends State<NewsCards> {
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
                Image.network(
                    "https://images.hindustantimes.com/tech/img/2023/02/15/1600x900/asteroid_1676434888953_1676434897704_1676434897704.jpg"),
                SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "2023-02-15",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.deepPurple[200]),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Flexible(
                      child: Text(
                        "Asteroid today: Space rock speeding towards Earth at a fearsome 60905 kmph - HT Tech",
                        overflow: TextOverflow.visible,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w100),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          )),
    );
  }
}
