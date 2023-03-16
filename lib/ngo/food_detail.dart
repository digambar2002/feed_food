//Author : Prachi Nathjogi

import 'package:feed_food/widgets/sheet.dart';
import 'package:flutter/material.dart';

class FoodDetail extends StatelessWidget {
  const FoodDetail({Key ? key});

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
            child: Image.asset("assets/images/nHome1.png",
            fit: BoxFit.fill),
            
          ),
        scroll(),
         Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 150, horizontal: 50),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 60,
                        width: 300,
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            "Submit",
                            style: TextStyle(fontSize: 24),
                          ),
                          style: ElevatedButton.styleFrom(
                              primary: Colors.deepPurple[900],
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              )),
                        ),
                      ),
                    ],
                  ),
                      
                      ),
                    ],

        
    ),
    
    );
  
  }
  
  scroll() {
    return DraggableScrollableSheet(
      initialChildSize: 0.6,
      maxChildSize: 1.0,
      minChildSize: 0.6,
      builder: (context, ScrollController){
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20,),
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          ),
          child: SingleChildScrollView(
            controller: ScrollController,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(padding: const EdgeInsets.only(top: 10,bottom: 25),
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
                  "Shev Bhaji & Chapati",
                  style: TextStyle(
                        color: Colors.black,
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        
                      ),
                ),
               SizedBox(
                  height: 15,
                ),
                Row(children: [

                  // For NGO Profile
                  CircleAvatar(
                    radius: 25,
                    backgroundImage: AssetImage("assets/images/Profile Pic.png"),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    "Ngo Name",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                  ),
                ],
                ),
                 const Padding(padding: EdgeInsetsDirectional.symmetric(vertical: 15),
                child: Divider(
                  height: 8,
                ),
                ),
                 Text(
                  "Food Shelf Life",
                  style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold
                      ),
                ),
                const SizedBox(
                  height: 6,
                ),
                Text(
                  "8 hour",
                  style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                      ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Quantity",
                  style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                ), const SizedBox(
                  height: 6,
                ),
                Text(
                  "For 50 People",
                  style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                      ),
                ),

                const Padding(padding: EdgeInsets.symmetric(vertical: 15),
                child: Divider(
                  height: 8,
                ),
                ),
                Text(
                  "Description",
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
                  "gvgjfffffffffffff trrrrtttttttttttttt vvvvvvvvvvvvvvvvvvvvvv wwwwwwwwwwww cgttewq zzzsdvv oojgv qaagg  vvvc rty dsa njjj",
                  style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                      ),
                ),
                const Padding(padding: EdgeInsetsDirectional.symmetric(vertical: 15),
                child: Divider(
                  height: 6,
                ),
                ),
                 Text(
                  "Ingredients",
                  style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(
                  height: 10,
                ),
                ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 3,
                  itemBuilder: (context, index) => ingredients(context),
                  ),
                 
              ],
            ),
          ),
        );
      }
    );
            
    }
    
      ingredients(BuildContext context) {
        return Padding(padding: EdgeInsets.symmetric(vertical: 10),
        child: Row(children: [
          const CircleAvatar(
            radius: 10,
            backgroundColor: Color(0xFFE3FFF8),
            child: Icon(
              Icons.done,
              size: 15,
            ),
          ),
          const SizedBox(width: 10,),
          Text("Masala",
          style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                      ),
          ),
        ],),
        );
      }
              
  } 


   