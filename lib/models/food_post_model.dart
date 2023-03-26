// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:feed_food/utils/strings.dart';

// insert post details
class FoodPostModel {
  Future InsertFoodPostData(
    String SenderAccountNo,
    String FoodDetails,
    String FoodQuantity,
    String CookingTime,
    String Address,
    String ZipCode,
    String longitude,
    String latitude,
    String Status,
  ) async {
    String uri = FeedFoodStrings.volunteer_post_url;
    try {
      http.Response res = await http.post(Uri.parse(uri), body: {
        'FoodRequest': 'FoodRequest',
        'SenderAccountNo': SenderAccountNo,
        'FoodDetails': FoodDetails,
        'FoodQuantity': FoodQuantity,
        'CookingTime': CookingTime,
        'Address': Address,
        'ZipCode': ZipCode,
        'longitude': longitude,
        'latitude': latitude,
        'Status': Status,
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
      return false;
    }
  }
}

// History Page
class FoodPostHistoryList {
  static List<FoodPostHistoryModel> postHistory = [];
}

class FoodPostHistoryModel {
  final String FoodDetails;
  final String FoodQuantity;
  final String CookingTime;
  final String Address;
  final String ZipCode;
  final String Status;
  final String CurrentTime;

  FoodPostHistoryModel(
    this.FoodDetails,
    this.FoodQuantity,
    this.CookingTime,
    this.Address,
    this.ZipCode,
    this.Status,
    this.CurrentTime,
  );

  FoodPostHistoryModel copyWith({
    String? FoodDetails,
    String? FoodQuantity,
    String? CookingTime,
    String? Address,
    String? ZipCode,
    String? Status,
    String? CurrentTime,
  }) {
    return FoodPostHistoryModel(
      FoodDetails ?? this.FoodDetails,
      FoodQuantity ?? this.FoodQuantity,
      CookingTime ?? this.CookingTime,
      Address ?? this.Address,
      ZipCode ?? this.ZipCode,
      Status ?? this.Status,
      CurrentTime ?? this.CurrentTime,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'FoodDetails': FoodDetails,
      'FoodQuantity': FoodQuantity,
      'CookingTime': CookingTime,
      'Address': Address,
      'ZipCode': ZipCode,
      'Status': Status,
      'CurrentTime': CurrentTime,
    };
  }

  factory FoodPostHistoryModel.fromMap(Map<String, dynamic> map) {
    return FoodPostHistoryModel(
      map['FoodDetails'] as String,
      map['FoodQuantity'] as String,
      map['CookingTime'] as String,
      map['Address'] as String,
      map['ZipCode'] as String,
      map['Status'] as String,
      map['CurrentTime'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory FoodPostHistoryModel.fromJson(String source) =>
      FoodPostHistoryModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'FoodPostHistoryModel(FoodDetails: $FoodDetails, FoodQuantity: $FoodQuantity, CookingTime: $CookingTime, Address: $Address, ZipCode: $ZipCode, Status: $Status, CurrentTime: $CurrentTime)';
  }

  @override
  bool operator ==(covariant FoodPostHistoryModel other) {
    if (identical(this, other)) return true;

    return other.FoodDetails == FoodDetails &&
        other.FoodQuantity == FoodQuantity &&
        other.CookingTime == CookingTime &&
        other.Address == Address &&
        other.ZipCode == ZipCode &&
        other.Status == Status &&
        other.CurrentTime == CurrentTime;
  }

  @override
  int get hashCode {
    return FoodDetails.hashCode ^
        FoodQuantity.hashCode ^
        CookingTime.hashCode ^
        Address.hashCode ^
        ZipCode.hashCode ^
        Status.hashCode ^
        CurrentTime.hashCode;
  }
}
