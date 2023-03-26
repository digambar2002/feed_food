import 'dart:convert';

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

      if (response['success'] != true) {
        return response['success'];
      }
    } catch (e) {
      print(e);
    }
    return true;
  }

  Future sendMail(var email, var otp) async {
    String uri = FeedFoodStrings.forgot_pass_url;

    try {
      http.Response res = await http.post(Uri.parse(uri), body: {
        'sendMail': email,
        'otp': otp,
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

  Future resetPassword(var password, var email) async {
    String uri = FeedFoodStrings.forgot_pass_url;

    try {
      http.Response res = await http.post(Uri.parse(uri), body: {
        'resetPassword': password,
        'email': email,
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
}
