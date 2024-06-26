class TablesData {
  String tableType;
  int tableCount;
  int seatPerTable;
  int rotation;

  TablesData({
    required this.tableType,
    required this.tableCount,
    required this.seatPerTable,
    required this.rotation,
  });

  factory TablesData.fromJson(Map<String, dynamic> json) => TablesData(
    tableType: json["table_type"],
    tableCount: json["table_count"],
    seatPerTable: json["seat_per_table"],
    rotation: json["rotation"],
  );

  Map<String, dynamic> toJson() => {
    "table_type": tableType,
    "table_count": tableCount,
    "seat_per_table": seatPerTable,
    "rotation": rotation,
  };
}