class ForgetPassResponse {
  String message;
  int status;
  Data data;

  ForgetPassResponse({
    required this.message,
    required this.status,
    required this.data,
  });

  factory ForgetPassResponse.fromJson(Map<String, dynamic> ?json) => ForgetPassResponse(
    message: json?["message"],
    status: json?["status"],
    data: Data.fromJson(json?["data"]),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "status": status,
    "data": data.toJson(),
  };
}

class Data {
  String accessToken;

  Data({
    required this.accessToken,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    accessToken: json["access_token"],
  );

  Map<String, dynamic> toJson() => {
    "access_token": accessToken,
  };
}