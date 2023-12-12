class OtpResponse {
  String message;
  Data data;
  int stats;

  OtpResponse({
    required this.message,
    required this.data,
    required this.stats,
  });

  factory OtpResponse.fromJson(Map<String, dynamic>? json) => OtpResponse(
    message: json?["message"],
    data: Data.fromJson(json?["data"]),
    stats: json?["stats"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "data": data.toJson(),
    "stats": stats,
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
  int addedOn;
  bool isVerified;
  String id;

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
    required this.addedOn,
    required this.isVerified,
    required this.id,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    name: json["name"],
    password: json["password"],
    cermony: json["cermony"],
    gender: json["gender"],
    profileImage: json["profile_image"],
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
    addedOn: json["added_on"],
    isVerified: json["is_verified"],
    id: json["_id"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "password": password,
    "cermony": cermony,
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
    "added_on": addedOn,
    "is_verified": isVerified,
    "_id": id,
  };
}
