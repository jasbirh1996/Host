import 'dart:ui';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:host/network/apiservice.dart';
import 'package:host/ui/screens/home/event_details_response.dart';
import 'package:host/ui/screens/home/sitting_plan_response.dart';
import 'package:host/utils/SharedPref.dart';

import '../../../data/ApiEndpoints.dart';
import '../../../network/app_repo.dart';
import '../../../network/sitting_plan.dart';
import 'draggable_table.dart';

class HomeController extends GetxController {
  var selectedNavigationIndex = 0.obs;
  var client = ApiService();
  var selectedDropdownItem = 'Jack\'s Birthday Party'.obs;
  var dropdownList = [
    'Jack\'s Birthday Party',
    'William\'s Anniversary',
    'Ian\'s Engagement'
  ];

  var isSittingPlanSelected = true.obs;

  onBottomNavigationTap(int index) {
    selectedNavigationIndex.value = index;
  }

  onDropdownChanged(String? value) {
    selectedDropdownItem.value = value ?? dropdownList[0];
  }

  onTabClick() {
    isSittingPlanSelected.value = !isSittingPlanSelected.value;
  }

  final isLoading = false.obs;
  final sittingPlanResponse = SittingPlanResponse().obs;
  final eventDetailsResponse = EventDetailsResponse().obs;

  @override
  void onReady() {
    super.onReady();

    getHomeData();
  }

  List<DraggableTable> tableShape = [];

  // final List<TablesData> tableData = [];
  var count = 0;
  String x = "10";
  String y = "110";
  var saved = true;

  var selectedShape = "Round";
  double width = 50.0;

  // var client = ApiService();

  var eventType = "";
  var eventName = "Jasbir";
  var eventDate = "";
  var eventStartTime = 0;
  var eventEndTime = 0;
  var tableCount = 0;
  var seatPerTable = 0;
  var tableType = "Round";

  /*getHomeData() async {
    try {
      final responses = await AppRepo().getHomeData();
      sittingPlanResponse.value = responses[0] as SittingPlanResponse;
      eventDetailsResponse.value = responses[1] as EventDetailsResponse;

      dropdownList = [eventDetailsResponse.value.data?.eventName ?? ''];

      selectedDropdownItem.value =
          eventDetailsResponse.value.data?.eventName ?? '';

      tableShape.clear();

      var list = (sittingPlanResponse.value.data ?? [])
          .map((e) => DraggableTable(
              Offset(double.parse(e.position?.x ?? '0.0'),
                  double.parse(e.position?.y ?? '0.0')),
              e.tableType ?? '',
              e.tableName ?? '',
              e.seatPerTable.toString(),
              e.tableCount.toString(),
              e.position?.rotation ?? 0,
              e.sId ?? '',
              e.qrCode ?? ''))
          .toList();

      tableShape = list;

      isLoading.value = false;
    } on Exception catch (e) {
      isLoading.value = false;
    }
  }*/

  getHomeData() async {
    try {
      final responses = await AppRepo().getHomeData();
      // sittingPlanResponse.value = responses[0] as SittingPlanResponse;
      eventDetailsResponse.value = responses[1] as EventDetailsResponse;

      dropdownList = [eventDetailsResponse.value.data?.eventName ?? ''];

      selectedDropdownItem.value =
          eventDetailsResponse.value.data?.eventName ?? '';

      // tableShape.clear();
      //
      // var list = (sittingPlanResponse.value.data ?? [])
      //     .map((e) => DraggableTable(
      //     Offset(double.parse(e.position?.x ?? '0.0'),
      //         double.parse(e.position?.y ?? '0.0')),
      //     e.tableType ?? '',
      //     e.tableName ?? '',
      //     e.seatPerTable.toString(),
      //     e.tableCount.toString(),
      //     e.position?.rotation ?? 0,
      //     e.sId ?? '',
      //     e.qrCode ?? ''))
      //     .toList();
      //
      // tableShape = list;
      isSittingPlanSelected.value  = true;

      isLoading.value = false;
    } on Exception catch (e) {
      isLoading.value = false;
    }
  }

  getHomeTable( {VoidCallback? callback}) async{
    var map = <String,dynamic>{};
    var userData = await SharedPref().getUserData();
    map["cermony_id"]= userData?.ceremonyId;
    client.postRequest(ApiEndPoint.getHomeTables,map ).then((value) {
      if (value.data != null) {
        tableShape.clear();

        var data = GetRestaurantTableResponse.fromJson(value.data);
        var list = data.data
            .map((e) => DraggableTable(
            Offset(double.parse(e.position.x), double.parse(e.position.y)),
            e.tableType,
            e.tableName,
            e.seatPerTable.toString(),
            e.tableCount.toString(),
            e.position.rotation,
            e.id,
            e.qrCode,e.tableStatus))
            .toList();

        tableShape = list;
        callback?.call();


      } else if (value.loading) {
      } else {
        Fluttertoast.showToast(msg: value.error ?? "something went wrong");

        // something went wrong
      }
    });
  }
}
