class LoginRequest {
  String password;
  String countryCode;
  String mobileNumber;
  double latitude;
  double longitude;
  String deviceType;
  String deviceToken;

  LoginRequest({
    required this.password,
    required this.countryCode,
    required this.mobileNumber,
    required this.latitude,
    required this.longitude,
    required this.deviceType,
    required this.deviceToken,
  });

  factory LoginRequest.fromJson(Map<String, dynamic> json) => LoginRequest(
    password: json["password"],
    countryCode: json["country_code"],
    mobileNumber: json["mobile_number"],
    latitude: json["latitude"]?.toDouble(),
    longitude: json["longitude"]?.toDouble(),
    deviceType: json["device_type"],
    deviceToken: json["device_token"],
  );

  Map<String, dynamic> toJson() => {
    "password": password,
    "country_code": countryCode,
    "mobile_number": mobileNumber,
    "latitude": latitude,
    "longitude": longitude,
    "device_type": deviceType,
    "device_token": deviceToken,
  };
}
