class OnGoingCeremonyHost {
  String message;
  List<CeremonyData> data;
  int stats;
  String myId;

  OnGoingCeremonyHost({
    required this.message,
    required this.data,
    required this.stats,
    required this.myId,
  });

  factory OnGoingCeremonyHost.fromJson(Map<String, dynamic>? json) => OnGoingCeremonyHost(
    message: json?["message"],
    data: List<CeremonyData>.from(json?["data"].map((x) => CeremonyData.fromJson(x))),
    stats: json?["stats"],
    myId: json?["myId"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "stats": stats,
    "myId": myId,
  };
}

class CeremonyData {
  String eventType;
  RestaurantId restaurantId;
  int addedOn;
  int startedOn;
  String eventName;
  String eventDate;
  int eventStartTime;
  int eventEndTime;
  String tableType;
  int tableCount;
  int seatPerTable;
  bool isStarted;
  bool isCompleted;
  bool isSaved;
  List<dynamic> hostIds;
  List<dynamic> menuItems;
  List<dynamic> staffList;
  int numberOfDays;
  int amount;
  String id;

  CeremonyData({
    required this.eventType,
    required this.restaurantId,
    required this.addedOn,
    required this.startedOn,
    required this.eventName,
    required this.eventDate,
    required this.eventStartTime,
    required this.eventEndTime,
    required this.tableType,
    required this.tableCount,
    required this.seatPerTable,
    required this.isStarted,
    required this.isCompleted,
    required this.isSaved,
    required this.hostIds,
    required this.menuItems,
    required this.staffList,
    required this.numberOfDays,
    required this.amount,
    required this.id,
  });

  factory CeremonyData.fromJson(Map<String, dynamic> json) => CeremonyData(
    eventType: json["event_type"],
    restaurantId: RestaurantId.fromJson(json["restaurant_id"]),
    addedOn: json["added_on"],
    startedOn: json["started_on"],
    eventName: json["event_name"],
    eventDate: json["event_date"],
    eventStartTime: json["event_start_time"],
    eventEndTime: json["event_end_time"],
    tableType: json["table_type"],
    tableCount: json["table_count"],
    seatPerTable: json["seat_per_table"],
    isStarted: json["is_started"],
    isCompleted: json["is_completed"],
    isSaved: json["is_saved"],
    hostIds: List<dynamic>.from(json["host_ids"].map((x) => x)),
    menuItems: List<dynamic>.from(json["menu_items"].map((x) => x)),
    staffList: List<dynamic>.from(json["staff_list"].map((x) => x)),
    numberOfDays: json["number_of_days"],
    amount: json["amount"],
    id: json["_id"],
  );

  Map<String, dynamic> toJson() => {
    "event_type": eventType,
    "restaurant_id": restaurantId.toJson(),
    "added_on": addedOn,
    "started_on": startedOn,
    "event_name": eventName,
    "event_date": eventDate,
    "event_start_time": eventStartTime,
    "event_end_time": eventEndTime,
    "table_type": tableType,
    "table_count": tableCount,
    "seat_per_table": seatPerTable,
    "is_started": isStarted,
    "is_completed": isCompleted,
    "is_saved": isSaved,
    "host_ids": List<dynamic>.from(hostIds.map((x) => x)),
    "menu_items": List<dynamic>.from(menuItems.map((x) => x)),
    "staff_list": List<dynamic>.from(staffList.map((x) => x)),
    "number_of_days": numberOfDays,
    "amount": amount,
    "_id": id,
  };
}

class RestaurantId {
  CurrentStatus currentStatus;
  String shopNumber;
  String streetNumber;
  String locality;
  String restaurantIsOpen;
  String otp;
  String countryCode;
  String mobileNumber;
  String deviceType;
  String deviceToken;
  int userType;
  String isoCode;
  bool isBlocked;
  bool isDeleted;
  bool isProfileCreated;
  String socialId;
  String socialType;
  String profilePic;
  String firstname;
  String lastname;
  String businessName;
  String email;
  String restaurantWebsite;
  String country;
  String city;
  String restaurantAddress;
  String restaurantDescription;
  String businessLogo;
  int restaurantWorkingSince;
  int rating;
  List<dynamic> restaurantRuningDays;
  String restaurantOpeningFrom;
  String restaurantOpeningTo;
  dynamic restaurantTags;
  bool isActive;
  int addedOn;
  bool isEmailVerified;
  String id;
  String accessToken;
  List<Image> images;

  RestaurantId({
    required this.currentStatus,
    required this.shopNumber,
    required this.streetNumber,
    required this.locality,
    required this.restaurantIsOpen,
    required this.otp,
    required this.countryCode,
    required this.mobileNumber,
    required this.deviceType,
    required this.deviceToken,
    required this.userType,
    required this.isoCode,
    required this.isBlocked,
    required this.isDeleted,
    required this.isProfileCreated,
    required this.socialId,
    required this.socialType,
    required this.profilePic,
    required this.firstname,
    required this.lastname,
    required this.businessName,
    required this.email,
    required this.restaurantWebsite,
    required this.country,
    required this.city,
    required this.restaurantAddress,
    required this.restaurantDescription,
    required this.businessLogo,
    required this.restaurantWorkingSince,
    required this.rating,
    required this.restaurantRuningDays,
    required this.restaurantOpeningFrom,
    required this.restaurantOpeningTo,
    required this.restaurantTags,
    required this.isActive,
    required this.addedOn,
    required this.isEmailVerified,
    required this.id,
    required this.accessToken,
    required this.images,
  });

  factory RestaurantId.fromJson(Map<String, dynamic> json) => RestaurantId(
    currentStatus: CurrentStatus.fromJson(json["current_status"]),
    shopNumber: json["shop_number"],
    streetNumber: json["street_number"],
    locality: json["locality"],
    restaurantIsOpen: json["restaurant_is_open"],
    otp: json["OTP"],
    countryCode: json["country_code"],
    mobileNumber: json["mobile_number"],
    deviceType: json["device_type"],
    deviceToken: json["device_token"],
    userType: json["userType"],
    isoCode: json["isoCode"],
    isBlocked: json["is_blocked"],
    isDeleted: json["is_deleted"],
    isProfileCreated: json["is_profile_created"],
    socialId: json["social_id"],
    socialType: json["social_type"],
    profilePic: json["profile_pic"],
    firstname: json["firstname"],
    lastname: json["lastname"],
    businessName: json["business_name"],
    email: json["email"],
    restaurantWebsite: json["restaurant_website"],
    country: json["country"],
    city: json["city"],
    restaurantAddress: json["restaurant_address"],
    restaurantDescription: json["restaurant_description"],
    businessLogo: json["business_logo"],
    restaurantWorkingSince: json["restaurant_working_since"],
    rating: json["rating"],
    restaurantRuningDays: List<dynamic>.from(json["restaurant_runing_days"].map((x) => x)),
    restaurantOpeningFrom: json["restaurant_opening_from"],
    restaurantOpeningTo: json["restaurant_opening_to"],
    restaurantTags: json["restaurant_tags"],
    isActive: json["is_active"],
    addedOn: json["added_on"],
    isEmailVerified: json["is_email_verified"],
    id: json["_id"],
    accessToken: json["access_token"],
    images: List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "current_status": currentStatus.toJson(),
    "shop_number": shopNumber,
    "street_number": streetNumber,
    "locality": locality,
    "restaurant_is_open": restaurantIsOpen,
    "OTP": otp,
    "country_code": countryCode,
    "mobile_number": mobileNumber,
    "device_type": deviceType,
    "device_token": deviceToken,
    "userType": userType,
    "isoCode": isoCode,
    "is_blocked": isBlocked,
    "is_deleted": isDeleted,
    "is_profile_created": isProfileCreated,
    "social_id": socialId,
    "social_type": socialType,
    "profile_pic": profilePic,
    "firstname": firstname,
    "lastname": lastname,
    "business_name": businessName,
    "email": email,
    "restaurant_website": restaurantWebsite,
    "country": country,
    "city": city,
    "restaurant_address": restaurantAddress,
    "restaurant_description": restaurantDescription,
    "business_logo": businessLogo,
    "restaurant_working_since": restaurantWorkingSince,
    "rating": rating,
    "restaurant_runing_days": List<dynamic>.from(restaurantRuningDays.map((x) => x)),
    "restaurant_opening_from": restaurantOpeningFrom,
    "restaurant_opening_to": restaurantOpeningTo,
    "restaurant_tags": restaurantTags,
    "is_active": isActive,
    "added_on": addedOn,
    "is_email_verified": isEmailVerified,
    "_id": id,
    "access_token": accessToken,
    "images": List<dynamic>.from(images.map((x) => x.toJson())),
  };
}

class CurrentStatus {
  bool isPending;
  bool isAccepted;
  bool isRejected;

  CurrentStatus({
    required this.isPending,
    required this.isAccepted,
    required this.isRejected,
  });

  factory CurrentStatus.fromJson(Map<String, dynamic> json) => CurrentStatus(
    isPending: json["is_pending"],
    isAccepted: json["is_accepted"],
    isRejected: json["is_rejected"],
  );

  Map<String, dynamic> toJson() => {
    "is_pending": isPending,
    "is_accepted": isAccepted,
    "is_rejected": isRejected,
  };
}

class Image {
  String url;
  String id;

  Image({
    required this.url,
    required this.id,
  });

  factory Image.fromJson(Map<String, dynamic> json) => Image(
    url: json["url"],
    id: json["_id"],
  );

  Map<String, dynamic> toJson() => {
    "url": url,
    "_id": id,
  };
}
