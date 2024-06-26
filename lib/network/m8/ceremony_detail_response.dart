
class GetCeremonyDetailResponse {
  String message;
  CeremonyDetail data;

  GetCeremonyDetailResponse({
    required this.message,
    required this.data,
  });

  factory GetCeremonyDetailResponse.fromJson(Map<String, dynamic>?json) => GetCeremonyDetailResponse(
    message: json?["message"],
    data: CeremonyDetail.fromJson(json?["data"]),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "data": data.toJson(),
  };
}

class CeremonyDetail {
  String id;
  String eventType;
  String restaurantId;
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
  List<dynamic> dataStaffList;
  int numberOfDays;
  int amount;
  String orderStatus;
  List<StaffList> staffList;
  List<MenuList> menuList;
  List<HostList> hostList;
  List<Table> tabledata;

  CeremonyDetail({
    required this.id,
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
    required this.dataStaffList,
    required this.numberOfDays,
    required this.amount,
    required this.orderStatus,
    required this.staffList,
    required this.menuList,
    required this.hostList,
    required this.tabledata,
  });

  factory CeremonyDetail.fromJson(Map<String, dynamic> json) => CeremonyDetail(
    id: json["_id"],
    eventType: json["event_type"],
    restaurantId: json["restaurant_id"],
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
    dataStaffList: List<dynamic>.from(json["staff_list"].map((x) => x)),
    numberOfDays: json["number_of_days"],
    amount: json["amount"],
    orderStatus: json["order_status"],
    staffList: List<StaffList>.from(json["staffList"].map((x) => StaffList.fromJson(x))),
    menuList: List<MenuList>.from(json["menuList"].map((x) => MenuList.fromJson(x))),
    hostList: List<HostList>.from(json["hostList"].map((x) => HostList.fromJson(x))),
    tabledata: List<Table>.from(json["tabledata"].map((x) => Table.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "event_type": eventType,
    "restaurant_id": restaurantId,
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
    "staff_list": List<dynamic>.from(dataStaffList.map((x) => x)),
    "number_of_days": numberOfDays,
    "amount": amount,
    "order_status": orderStatus,
    "staffList": List<dynamic>.from(staffList.map((x) => x.toJson())),
    "menuList": List<dynamic>.from(menuList.map((x) => x.toJson())),
    "hostList": List<dynamic>.from(hostList.map((x) => x.toJson())),
    "tabledata": List<dynamic>.from(tabledata.map((x) => x.toJson())),
  };
}

class HostList {
  String name;
  String password;
  String email;
  String about;
  String cermony;
  String ceremonyId;
  String gender;
  String profileImage;
  String countryCode;
  String mobileNumber;
  String deviceType;
  String restaurantId;
  int latitude;
  int longitude;
  String deviceToken;
  String isoCode;
  String accessToken;
  bool isActive;
  bool isDeleted;
  int otp;
  int addedOn;
  bool isVerified;
  String id;

  HostList({
    required this.name,
    required this.password,
    required this.email,
    required this.about,
    required this.cermony,
    required this.ceremonyId,
    required this.gender,
    required this.profileImage,
    required this.countryCode,
    required this.mobileNumber,
    required this.deviceType,
    required this.restaurantId,
    required this.latitude,
    required this.longitude,
    required this.deviceToken,
    required this.isoCode,
    required this.accessToken,
    required this.isActive,
    required this.isDeleted,
    required this.otp,
    required this.addedOn,
    required this.isVerified,
    required this.id,
  });

  factory HostList.fromJson(Map<String, dynamic> json) => HostList(
    name: json["name"],
    password: json["password"],
    email: json["email"],
    about: json["about"],
    cermony: json["cermony"],
    ceremonyId: json["ceremony_id"],
    gender: json["gender"],
    profileImage: json["profile_image"],
    countryCode: json["country_code"],
    mobileNumber: json["mobile_number"],
    deviceType: json["device_type"],
    restaurantId: json["restaurant_id"],
    latitude: json["latitude"],
    longitude: json["longitude"],
    deviceToken: json["device_token"],
    isoCode: json["isoCode"],
    accessToken: json["access_token"],
    isActive: json["is_active"],
    isDeleted: json["is_deleted"],
    otp: json["OTP"],
    addedOn: json["added_on"],
    isVerified: json["is_verified"],
    id: json["_id"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "password": password,
    "email": email,
    "about": about,
    "cermony": cermony,
    "ceremony_id": ceremonyId,
    "gender": gender,
    "profile_image": profileImage,
    "country_code": countryCode,
    "mobile_number": mobileNumber,
    "device_type": deviceType,
    "restaurant_id": restaurantId,
    "latitude": latitude,
    "longitude": longitude,
    "device_token": deviceToken,
    "isoCode": isoCode,
    "access_token": accessToken,
    "is_active": isActive,
    "is_deleted": isDeleted,
    "OTP": otp,
    "added_on": addedOn,
    "is_verified": isVerified,
    "_id": id,
  };
}

class MenuList {
  String id;
  String categoryName;
  String menuId;
  String addedBy;
  int addedOn;
  String categoryImage;
  int totalOrders;
  bool isActive;
  List<AddedDish> addedDish;

  MenuList({
    required this.id,
    required this.categoryName,
    required this.menuId,
    required this.addedBy,
    required this.addedOn,
    required this.categoryImage,
    required this.totalOrders,
    required this.isActive,
    required this.addedDish,
  });

  factory MenuList.fromJson(Map<String, dynamic> json) => MenuList(
    id: json["_id"],
    categoryName: json["category_name"],
    menuId: json["menu_id"],
    addedBy: json["added_by"],
    addedOn: json["added_on"],
    categoryImage: json["category_image"],
    totalOrders: json["total_orders"],
    isActive: json["is_active"],
    addedDish: List<AddedDish>.from(json["added_dish"].map((x) => AddedDish.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "category_name": categoryName,
    "menu_id": menuId,
    "added_by": addedBy,
    "added_on": addedOn,
    "category_image": categoryImage,
    "total_orders": totalOrders,
    "is_active": isActive,
    "added_dish": List<dynamic>.from(addedDish.map((x) => x.toJson())),
  };
}

class AddedDish {
  String dishName;
  String addedBy;
  String category;
  int addedOn;
  String dishImage;
  bool isActive;
  int price;
  String description;
  String id;

  AddedDish({
    required this.dishName,
    required this.addedBy,
    required this.category,
    required this.addedOn,
    required this.dishImage,
    required this.isActive,
    required this.price,
    required this.description,
    required this.id,
  });

  factory AddedDish.fromJson(Map<String, dynamic> json) => AddedDish(
    dishName: json["dish_name"],
    addedBy: json["added_by"],
    category: json["category"],
    addedOn: json["added_on"],
    dishImage: json["dish_image"],
    isActive: json["is_active"],
    price: json["price"],
    description: json["description"],
    id: json["_id"],
  );

  Map<String, dynamic> toJson() => {
    "dish_name": dishName,
    "added_by": addedBy,
    "category": category,
    "added_on": addedOn,
    "dish_image": dishImage,
    "is_active": isActive,
    "price": price,
    "description": description,
    "_id": id,
  };
}

class StaffList {
  Location location;
  List<CeremoneyList> ceremoneyList;
  String name;
  String password;
  String staffType;
  String about;
  String designation;
  String gender;
  String profileImage;
  String countryCode;
  String mobileNumber;
  String country;
  String city;
  String deviceType;
  String restaurantId;
  List<Table> tableId;
  double latitude;
  String address;
  int rate;
  double longitude;
  int totalEvent;
  String deviceToken;
  String accessToken;
  String isoCode;
  bool isActive;
  bool isDeleted;
  bool isBlocked;
  int otp;
  bool isVerified;
  int addedOn;
  String id;

  StaffList({
    required this.location,
    required this.ceremoneyList,
    required this.name,
    required this.password,
    required this.staffType,
    required this.about,
    required this.designation,
    required this.gender,
    required this.profileImage,
    required this.countryCode,
    required this.mobileNumber,
    required this.country,
    required this.city,
    required this.deviceType,
    required this.restaurantId,
    required this.tableId,
    required this.latitude,
    required this.address,
    required this.rate,
    required this.longitude,
    required this.totalEvent,
    required this.deviceToken,
    required this.accessToken,
    required this.isoCode,
    required this.isActive,
    required this.isDeleted,
    required this.isBlocked,
    required this.otp,
    required this.isVerified,
    required this.addedOn,
    required this.id,
  });

  factory StaffList.fromJson(Map<String, dynamic> json) => StaffList(
    location: Location.fromJson(json["location"]),
    ceremoneyList: List<CeremoneyList>.from(json["ceremoneyList"].map((x) => CeremoneyList.fromJson(x))),
    name: json["name"],
    password: json["password"],
    staffType: json["staffType"],
    about: json["about"],
    designation: json["designation"],
    gender: json["gender"],
    profileImage: json["profile_image"],
    countryCode: json["country_code"],
    mobileNumber: json["mobile_number"],
    country: json["country"],
    city: json["city"],
    deviceType: json["device_type"],
    restaurantId: json["restaurant_id"],
    tableId: List<Table>.from(json["table_id"].map((x) => Table.fromJson(x))),
    latitude: json["latitude"]?.toDouble(),
    address: json["address"],
    rate: json["rate"],
    longitude: json["longitude"]?.toDouble(),
    totalEvent: json["totalEvent"],
    deviceToken: json["device_token"],
    accessToken: json["access_token"],
    isoCode: json["isoCode"],
    isActive: json["is_active"],
    isDeleted: json["is_deleted"],
    isBlocked: json["is_blocked"],
    otp: json["OTP"],
    isVerified: json["is_verified"],
    addedOn: json["added_on"],
    id: json["_id"],
  );

  Map<String, dynamic> toJson() => {
    "location": location.toJson(),
    "ceremoneyList": List<dynamic>.from(ceremoneyList.map((x) => x.toJson())),
    "name": name,
    "password": password,
    "staffType": staffType,
    "about": about,
    "designation": designation,
    "gender": gender,
    "profile_image": profileImage,
    "country_code": countryCode,
    "mobile_number": mobileNumber,
    "country": country,
    "city": city,
    "device_type": deviceType,
    "restaurant_id": restaurantId,
    "table_id": List<dynamic>.from(tableId.map((x) => x.toJson())),
    "latitude": latitude,
    "address": address,
    "rate": rate,
    "longitude": longitude,
    "totalEvent": totalEvent,
    "device_token": deviceToken,
    "access_token": accessToken,
    "isoCode": isoCode,
    "is_active": isActive,
    "is_deleted": isDeleted,
    "is_blocked": isBlocked,
    "OTP": otp,
    "is_verified": isVerified,
    "added_on": addedOn,
    "_id": id,
  };
}

class CeremoneyList {
  String ceremony;

  CeremoneyList({
    required this.ceremony,
  });

  factory CeremoneyList.fromJson(Map<String, dynamic> json) => CeremoneyList(
    ceremony: json["ceremony"],
  );

  Map<String, dynamic> toJson() => {
    "ceremony": ceremony,
  };
}

class Location {
  String type;
  List<double> coordinates;

  Location({
    required this.type,
    required this.coordinates,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
    type: json["type"],
    coordinates: List<double>.from(json["coordinates"].map((x) => x?.toDouble())),
  );

  Map<String, dynamic> toJson() => {
    "type": type,
    "coordinates": List<dynamic>.from(coordinates.map((x) => x)),
  };
}

class Table {
  String ceremonyId;
  int addedOn;
  String restaurantId;
  String tableType;
  String tableStatus;
  int tableNumber;
  String tableName;
  int tableCount;
  int seatPerTable;
  Position position;
  int rotation;
  String qrCode;
  String id;

  Table({
    required this.ceremonyId,
    required this.addedOn,
    required this.restaurantId,
    required this.tableType,
    required this.tableStatus,
    required this.tableNumber,
    required this.tableName,
    required this.tableCount,
    required this.seatPerTable,
    required this.position,
    required this.rotation,
    required this.qrCode,
    required this.id,
  });

  factory Table.fromJson(Map<String, dynamic> json) => Table(
    ceremonyId: json["ceremony_id"],
    addedOn: json["added_on"],
    restaurantId: json["restaurant_id"],
    tableType: json["table_type"],
    tableStatus: json["table_status"],
    tableNumber: json["table_number"],
    tableName: json["table_name"],
    tableCount: json["table_count"],
    seatPerTable: json["seat_per_table"],
    position: Position.fromJson(json["position"]),
    rotation: json["rotation"],
    qrCode: json["qrCode"],
    id: json["_id"],
  );

  Map<String, dynamic> toJson() => {
    "ceremony_id": ceremonyId,
    "added_on": addedOn,
    "restaurant_id": restaurantId,
    "table_type": tableType,
    "table_status": tableStatus,
    "table_number": tableNumber,
    "table_name": tableName,
    "table_count": tableCount,
    "seat_per_table": seatPerTable,
    "position": position.toJson(),
    "rotation": rotation,
    "qrCode": qrCode,
    "_id": id,
  };
}

class Position {
  String x;
  String y;
  int rotation;

  Position({
    required this.x,
    required this.y,
    required this.rotation,
  });

  factory Position.fromJson(Map<String, dynamic> json) => Position(
    x: json["x"],
    y: json["y"],
    rotation: json["rotation"],
  );

  Map<String, dynamic> toJson() => {
    "x": x,
    "y": y,
    "rotation": rotation,
  };
}
