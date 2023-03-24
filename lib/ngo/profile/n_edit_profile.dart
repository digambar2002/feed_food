import 'package:feed_food/widgets/sheet.dart';
import 'package:flutter/material.dart';

class nEditProfile extends StatefulWidget {
  const nEditProfile({Key ? key});

  @override
  State<nEditProfile> createState() => _nEditProfileState();
}

class _nEditProfileState extends State<nEditProfile> {
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
                          "Edit Profile",
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
                
                body: Container(
                  padding: EdgeInsets.only(left: 16, top: 25, right: 16),
                  child: GestureDetector(
                    onTap: () {
                      FocusScope.of(context).unfocus();
                    },
                    child: ListView(
                      children: [
                        SizedBox(
                          height: 15,
                        ),
                        Center(
                          child: Stack(
                            children: [
                              Container(
                                width: 130,
                                height: 130,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 4,
                                    color: Theme.of(context).scaffoldBackgroundColor
                                  ),
                                  boxShadow: [
                                  BoxShadow(
                                    spreadRadius: 2, blurRadius: 10,
                                    color: Colors.black.withOpacity(0.1),
                                    offset: Offset(0, 10)
                                  ),
                                  ],
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage("assets/images/Profile Pic.png"),
                                    ),
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                right: 0,
                                child: Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    width: 4,
                                    color: Theme.of(context).scaffoldBackgroundColor,
                                  ),
                                  color: Colors.deepPurple,
                                ),
                                child: Icon(
                                  Icons.edit, color: Colors.white,
                                  ),
                              ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 35,
                        ),
                        buildTextField("Full Name", ""),
                        buildTextField("E-mail",""),
                        buildTextField("Adress", ""),
                        buildTextField("Phone", ""),
                        SizedBox(
                          height: 35,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                           ElevatedButton(
                          onPressed: (() => showModalBottomSheet(
                              context: context,
                              builder: ((context) =>
                                  FeedFoodSheet().buildSheet(context)),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(20))))),
                          child: Text(
                            "Cancel",
                            style: TextStyle(fontSize: 20, color: Colors.black),
                          ),
                          style: ElevatedButton.styleFrom(
                              primary: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              )),
                        ),
                               ElevatedButton(
                          onPressed: (() => showModalBottomSheet(
                              context: context, 
                              builder: ((context) =>
                                 FeedFoodSheet().buildSheet(context)),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(20))))),
                          child: Text(
                            "Save",
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                          style: ElevatedButton.styleFrom(
                              primary: Colors.deepPurple,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              )),
                        ),

                            
                          ],
                        )
                                
                                
                        
                        
                      ],
                    ),
                  ),
                ),





    );
  }
}

Widget buildTextField(String labelText,String placeholder) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 35.0),
      child: TextField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(bottom: 3),
          labelText: labelText,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText:placeholder,
          hintStyle: TextStyle(
            fontSize: 16, 
            fontWeight: FontWeight.bold,
            color: Colors.black,
          )
        ),
      ),
    );
  }

