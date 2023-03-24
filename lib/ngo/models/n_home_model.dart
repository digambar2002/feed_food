// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

// History Page
class NgoFoodRequest {
  static List<NgoFoodRequestModel> requestList = [];
}

class NgoFoodRequestModel {
  final String id;
  final String SenderAccountNo;
  final String FoodDetails;
  final String FoodQuantity;
  final String CookingTime;
  final String Address;
  final String ZipCode;
  final String Status;
  final String CurrentTime;
  final String longitude;
  final String latitude;

  NgoFoodRequestModel(
      this.id,
      this.SenderAccountNo,
      this.FoodDetails,
      this.FoodQuantity,
      this.CookingTime,
      this.Address,
      this.ZipCode,
      this.Status,
      this.CurrentTime,
      this.longitude,
      this.latitude);

  NgoFoodRequestModel copyWith({
    String? id,
    String? SenderAccountNo,
    String? FoodDetails,
    String? FoodQuantity,
    String? CookingTime,
    String? Address,
    String? ZipCode,
    String? Status,
    String? CurrentTime,
    String? longitude,
    String? latitude,
  }) {
    return NgoFoodRequestModel(
      id ?? this.id,
      SenderAccountNo ?? this.SenderAccountNo,
      FoodDetails ?? this.FoodDetails,
      FoodQuantity ?? this.FoodQuantity,
      CookingTime ?? this.CookingTime,
      Address ?? this.Address,
      ZipCode ?? this.ZipCode,
      Status ?? this.Status,
      CurrentTime ?? this.CurrentTime,
      longitude ?? this.longitude,
      latitude ?? this.latitude,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'SenderAccountNo': SenderAccountNo,
      'FoodDetails': FoodDetails,
      'FoodQuantity': FoodQuantity,
      'CookingTime': CookingTime,
      'Address': Address,
      'ZipCode': ZipCode,
      'Status': Status,
      'CurrentTime': CurrentTime,
      'longitude': longitude,
      'latitude': latitude,
    };
  }

  factory NgoFoodRequestModel.fromMap(Map<String, dynamic> map) {
    return NgoFoodRequestModel(
      map['id'] as String,
      map['SenderAccountNo'] as String,
      map['FoodDetails'] as String,
      map['FoodQuantity'] as String,
      map['CookingTime'] as String,
      map['Address'] as String,
      map['ZipCode'] as String,
      map['Status'] as String,
      map['CurrentTime'] as String,
      map['longitude'] as String,
      map['latitude'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory NgoFoodRequestModel.fromJson(String source) =>
      NgoFoodRequestModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'NgoFoodRequestModel(id: $id, SenderAccountNo: $SenderAccountNo, FoodDetails: $FoodDetails, FoodQuantity: $FoodQuantity, CookingTime: $CookingTime, Address: $Address, ZipCode: $ZipCode, Status: $Status, CurrentTime: $CurrentTime, longitude: $longitude, latitude: $latitude)';
  }

  @override
  bool operator ==(covariant NgoFoodRequestModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.SenderAccountNo == SenderAccountNo &&
        other.FoodDetails == FoodDetails &&
        other.FoodQuantity == FoodQuantity &&
        other.CookingTime == CookingTime &&
        other.Address == Address &&
        other.ZipCode == ZipCode &&
        other.Status == Status &&
        other.CurrentTime == CurrentTime &&
        other.longitude == longitude &&
        other.latitude == latitude;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        SenderAccountNo.hashCode ^
        FoodDetails.hashCode ^
        FoodQuantity.hashCode ^
        CookingTime.hashCode ^
        Address.hashCode ^
        ZipCode.hashCode ^
        Status.hashCode ^
        CurrentTime.hashCode ^
        longitude.hashCode ^
        latitude.hashCode;
  }
}
