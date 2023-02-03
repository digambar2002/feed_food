import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

import 'package:feed_food/utils/strings.dart';

class ForgotPasswordModel {
  Future emailValidation(var value) async {
    String uri = FeedFoodStrings.forgot_pass_url;

    try {
      http.Response res = await http.post(Uri.parse(uri), body: {
        'resetEmail': value,
      });

      var response = jsonDecode(res.body);
      print(response);
      if (response['success'] != true) {
        return response['success'];
      }
    } catch (e) {
      print(e);
    }
    return true;
  }
}
