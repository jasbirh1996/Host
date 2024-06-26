// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import 'draggable_table.dart';
//
// class TableController extends GetxController {
//   List<DraggableTable> tableShape = [];
//
//   final List<TablesData> tableData = [];
//   var count = 0;
//   String x = "10";
//   String y = "110";
//   var saved = true;
//
//   var selectedShape = "Round";
//   double width = 50.0;
//   // var client = ApiService();
//
//   var eventType = "";
//   var eventName = "Jasbir";
//   var eventDate = "";
//   var eventStartTime = 0;
//   var eventEndTime = 0;
//   var tableCount = 0;
//   var seatPerTable = 0;
//   var tableType = "Round";
//
//   @override
//   void onInit() {
//     super.onInit();
//   }
//
//   getRestaurantTables({VoidCallback? callback}) {
//     client.postRequest(ApiEndPoint.getRestaurantTable, null).then((value) {
//       if (value.data != null) {
//         tableShape.clear();
//
//         var data = GetRestaurantTableResponse.fromJson(value.data);
//         var list = data.data
//             .map((e) => DraggableTable(
//             Offset(double.parse(e.position.x), double.parse(e.position.y)),
//             e.tableType,
//             e.tableName,
//             e.seatPerTable.toString(),
//             e.tableCount.toString(),
//             e.position.rotation,
//             e.id,
//             e.qrCode))
//             .toList();
//
//         tableShape = list;
//         callback?.call();
//       } else if (value.loading) {
//       } else {
//         Fluttertoast.showToast(msg: value.error ?? "something went wrong");
//
//         // something went wrong
//       }
//     });
//   }
// }