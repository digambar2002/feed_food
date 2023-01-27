import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

import 'package:feed_food/utils/strings.dart';

class LoginModel {
  // username check in database
  Future LoginUser(String username, String password) async {
    String uri = FeedFoodStrings.register_url;
    try {
      http.Response res = await http.post(Uri.parse(uri), body: {
        'username': username,
        'password': password,
      });

      var response = jsonDecode(res.body);
      // var response;
      // if (res.body.isNotEmpty) {
      //   response = json.decode(res.body);
      // }
      if (response['success'] == true) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }
}
