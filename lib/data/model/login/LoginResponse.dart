import 'package:host/utils/api_constants.dart';

class LoginResponse {
  int status;
  String message;
  Data data;

  LoginResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory LoginResponse.fromJson(Map<String, dynamic>? json) => LoginResponse(
        status: json?["status"],
        message: json?["message"],
        data: Data.fromJson(json?["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data.toJson(),
      };
}

class Data {
  String name;
  String password;
  String cermony;
  String gender;
  String profileImage;
  String countryCode;
  String mobileNumber;
  String deviceType;
  String restaurantId;
  double latitude;
  double longitude;
  String deviceToken;
  String accessToken;
  bool isActive;
  int otp;
  bool isVerified;
  String id;
  String ceremonyId;

  Data({
    required this.name,
    required this.password,
    required this.cermony,
    required this.gender,
    required this.profileImage,
    required this.countryCode,
    required this.mobileNumber,
    required this.deviceType,
    required this.restaurantId,
    required this.latitude,
    required this.longitude,
    required this.deviceToken,
    required this.accessToken,
    required this.isActive,
    required this.otp,
    required this.isVerified,
    required this.id,
    required this.ceremonyId,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        name: json["name"],
        password: json["password"],
        cermony: '',//json["cermony"],
        gender: json["gender"],
        profileImage: '${ApiConstants.baseUrl}${json["profile_image"]}',
        countryCode: json["country_code"],
        mobileNumber: json["mobile_number"],
        deviceType: json["device_type"],
        restaurantId: json["restaurant_id"],
        latitude: json["latitude"]?.toDouble(),
        longitude: json["longitude"]?.toDouble(),
        deviceToken: json["device_token"],
        accessToken: json["access_token"],
        isActive: json["is_active"],
        otp: json["OTP"],
        isVerified: json["is_verified"],
        id: json["_id"],
        ceremonyId: json["ceremony_id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "password": password,
        "cermony_id": cermony,
        "gender": gender,
        "profile_image": profileImage,
        "country_code": countryCode,
        "mobile_number": mobileNumber,
        "device_type": deviceType,
        "restaurant_id": restaurantId,
        "latitude": latitude,
        "longitude": longitude,
        "device_token": deviceToken,
        "access_token": accessToken,
        "is_active": isActive,
        "OTP": otp,
        "is_verified": isVerified,
        "_id": id,
        "ceremony_id": ceremonyId,
      };
}
