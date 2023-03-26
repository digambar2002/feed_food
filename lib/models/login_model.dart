import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:feed_food/utils/strings.dart';

class LoginModel {
  // username check in database

  Future LoginUser(String username, String password) async {
    String uri = FeedFoodStrings.login_url;
    try {
      http.Response res = await http.post(Uri.parse(uri),
          body: {'username': username, 'password': password});

      var response = jsonDecode(res.body);

      if (response['success'] == true) {
        return response;
      } else {
        return response;
      }
    } catch (e) {
      // print(e);
      return false;
    }
  }
}
