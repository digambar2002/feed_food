import 'dart:convert';

import 'package:feed_food/utils/globals.dart';
import 'package:http/http.dart' as http;

import 'package:feed_food/utils/strings.dart';

class ProfileModel {
  // username check in database

  Future userProfile() async {
    String uri = FeedFoodStrings.volunteer_profile_url;
    try {
      http.Response res =
          await http.post(Uri.parse(uri), body: {'accountNo': UserAccountNo});

      var response = jsonDecode(res.body);

      if (response['success'] == true) {
        // print(response['profile']);
        return response['profile'];
      } else {
        return response['success'];
      }
    } catch (e) {
      // print(e);
      return false;
    }
  }

  Future userProfileUpdate(fname, lname, address, pincode) async {
    String uri = FeedFoodStrings.volunteer_update_profile_url;
    print(fname + lname + address + pincode);
    try {
      http.Response res = await http.post(Uri.parse(uri), body: {
        'accountNo': UserAccountNo,
        'fname': fname,
        'lname': lname,
        'address': address,
        'pincode': pincode,
      });

      var response = jsonDecode(res.body);
      print(response['success']);
      if (response['success'] == true) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      // print(e);
      return false;
    }
  }
}
