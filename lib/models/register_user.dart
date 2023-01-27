import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

import 'package:feed_food/utils/strings.dart';

class RegisterUserModel {
  // username check in database
  Future usernameValidation(var value) async {
    final bool usernameValid = RegExp(r"^[a-zA-Z0-9_]{5,15}$").hasMatch(value);
    String uri = FeedFoodStrings.register_vaildate_url;

    if (value!.isEmpty) {
      return "username cannot empty";
    } else if (!usernameValid) {
      return "username must be 5 character long";
    }
    try {
      http.Response res = await http.post(Uri.parse(uri), body: {
        'username': value,
      });

      var response = jsonDecode(res.body);
      if (response['success'] != true) {
        return response['success'];
      }
    } catch (e) {
      print(e);
    }

    return true;
  }

  Future emailValidation(var value) async {
    String uri = FeedFoodStrings.register_vaildate_url;
    try {
      http.Response res = await http.post(Uri.parse(uri), body: {
        'email': value,
      });

      var response = jsonDecode(res.body);
      if (response['success'] != true) {
        return response['success'];
      }
    } catch (e) {
      print(e);
    }
    return true;
  }

  Future phoneValidation(var value) async {
    String uri = FeedFoodStrings.register_vaildate_url;
    try {
      http.Response res = await http.post(Uri.parse(uri), body: {
        'phone': value,
      });

      var response = jsonDecode(res.body);
      if (response['success'] != true) {
        return response['success'];
      }
    } catch (e) {
      print(e);
    }
    return true;
  }

  Future InsertVolunteerData(
      String username, String email, String phone, String password) async {
    String uri = FeedFoodStrings.register_url;
    try {
      http.Response res = await http.post(Uri.parse(uri), body: {
        'username': username,
        'email': email,
        'phone': phone,
        'password': password
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
