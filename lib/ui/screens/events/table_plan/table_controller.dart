import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:host/ui/screens/events/table_plan/table_data.dart';

import '../../../../network/apiservice.dart';
import '../../home/draggable_table.dart';

class TableController extends GetxController {
  List<DraggableTable> tableShape = [];

  final List<TablesData> tableData = [];
  var count = 0;
  String x = "10";
  String y = "110";
  var saved = true;

  var selectedShape = "Round";
  double width = 50.0;
  var client = ApiService();

  var eventType = "";
  var eventName = "Jasbir";
  var eventDate = "";
  var eventStartTime = 0;
  var eventEndTime = 0;
  var tableCount = 0;
  var seatPerTable = 0;
  var tableType = "Round";



}