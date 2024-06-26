class GetRestaurantTableResponse {
  String message;
  List<RestaurantTables> data;

  GetRestaurantTableResponse({
    required this.message,
    required this.data,
  });

  factory GetRestaurantTableResponse.fromJson(Map<String, dynamic>? json) => GetRestaurantTableResponse(
    message: json?["message"],
    data: List<RestaurantTables>.from(json?["data"].map((x) => RestaurantTables.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class RestaurantTables {
  dynamic ceremonyId;
  int addedOn;
  String? restaurantId;
  String tableType;
  String tableName;
  int tableCount;
  int seatPerTable;
  Position position;
  int rotation;
  String id;
  String qrCode;
  String tableStatus;

  RestaurantTables({
    required this.ceremonyId,
    required this.addedOn,
    this.restaurantId,
    required this.tableType,
    required this.tableName,
    required this.tableCount,
    required this.seatPerTable,
    required this.position,
    required this.rotation,
    required this.id,
    required this.qrCode,
    required this.tableStatus
  });

  factory RestaurantTables.fromJson(Map<String, dynamic> json) => RestaurantTables(
      ceremonyId: json["ceremony_id"],
      addedOn: json["added_on"],
      restaurantId: json["restaurant_id"],
      tableType: json["table_type"],
      tableName: json["table_name"],
      tableCount: json["table_count"],
      seatPerTable: json["seat_per_table"],
      position: Position.fromJson(json["position"]),
      rotation: json["rotation"],
      id: json["_id"],
      qrCode: json["qrCode"],
      tableStatus: json["table_status"]
  );

  Map<String, dynamic> toJson() => {
    "ceremony_id": ceremonyId,
    "added_on": addedOn,
    "restaurant_id": restaurantId,
    "table_type": tableType,
    "table_name": tableName,
    "table_count": tableCount,
    "seat_per_table": seatPerTable,
    "position": position.toJson(),
    "rotation": rotation,
    "_id": id,
    "qrCode":qrCode,
    "table_status":tableStatus,
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
