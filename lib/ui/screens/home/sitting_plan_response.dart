class SittingPlanResponse {
  String? message;
  List<Data>? data;
  int? stats;

  SittingPlanResponse({this.message, this.data, this.stats});

  SittingPlanResponse.fromJson(Map<String, dynamic>? json) {
    message = json?['message'];
    if (json?['data'] != null) {
      data = <Data>[];
      json?['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
    stats = json?['stats'];
  }
}

class Data {
  String? ceremonyId;
  int? addedOn;
  String? restaurantId;
  String? tableType;
  String? tableName;
  int? tableCount;
  int? seatPerTable;
  Position? position;
  int? rotation;
  String? qrCode;
  String? sId;

  Data(
      {this.ceremonyId,
      this.addedOn,
      this.restaurantId,
      this.tableType,
      this.tableName,
      this.tableCount,
      this.seatPerTable,
      this.position,
      this.rotation,
      this.qrCode,
      this.sId});

  Data.fromJson(Map<String, dynamic> json) {
    ceremonyId = json['ceremony_id'];
    addedOn = json['added_on'];
    restaurantId = json['restaurant_id'];
    tableType = json['table_type'];
    tableName = json['table_name'];
    tableCount = json['table_count'];
    seatPerTable = json['seat_per_table'];
    position =
        json['position'] != null ? Position.fromJson(json['position']) : null;
    rotation = json['rotation'];
    qrCode = json['qrCode'];
    sId = json['_id'];
  }
}

class Position {
  String? x;
  String? y;
  int? rotation;

  Position({this.x, this.y, this.rotation});

  Position.fromJson(Map<String, dynamic> json) {
    x = json['x'];
    y = json['y'];
    rotation = json['rotation'] ?? 0;
  }
}
