import 'package:feed_food/widgets/sheet.dart';
import 'package:flutter/material.dart';

class nNotification extends StatelessWidget {
  const nNotification({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
                title: Container(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Notification",
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
      body: getBody(),
    );
  }
  Widget getBody(){
    List items =[
      "1",
      "2"
    ];
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index){
      return getCard();
    });

  }
  Widget getCard(){
    return Padding(
      padding:const EdgeInsets.all(10.0),
      child: Card(
        child: ListTile(
          title: Row(
            children:<Widget>[
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(13),
                  image: DecorationImage(
                    fit:BoxFit.fill,
                    image: AssetImage("assets/images/Profile Pic.png"),
                    ),
                  ),
              ),
              SizedBox(width: 20,),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Muttor Paneer",
                     style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600, fontSize: 12),
                  ),
                  
                  Text(
                    "Quantity for 50 people",
                    style: TextStyle(color: Colors.black, fontSize: 10,fontWeight: FontWeight.w300),
                    ),
                ],
              ),
            ]),
        ),
      ) 
      );
  }
}
