import 'dart:ui';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:host/network/m8/ceremony_detail_response.dart';
import 'package:host/network/m8/table_order_response.dart';

import '../../../data/ApiEndpoints.dart';
import '../../../network/apiservice.dart';
import '../../../network/m8/menu_response.dart';
import '../../../network/m8/ongoing_ceremony_response.dart';

class EventController extends GetxController {
  var client = ApiService();
  List<MenuData> creatorList = [];
  var mList = <CeremonyData>[];
  var tableOrderList = <TableOrderData>[];
  TableOrderData? tableOrderData;
  var totalOrder = 0;
  CeremonyDetail? ceremonyDetail;
  var selectedDropdownItem = 'Select an event'.obs;
  var dropdownList = ['Select an event'];

  onDropdownChanged(String? value) {
    selectedDropdownItem.value = value ?? dropdownList[0];
  }

  getOnGoingCeremony({VoidCallback? callback}) {
    client.postRequest(ApiEndPoint.ongoingCeremony, null).then((value) {
      if (value.data != null) {
        var data = OnGoingCeremonyHost.fromJson(value.data);
        mList = data.data;

        callback?.call();
      } else {
        Fluttertoast.showToast(msg: "something went wrong");

        // something went wrong
      }
    });
  }

  getCeremonyDetail(String ceremonyId, {VoidCallback? callback}) {
    var req = {"ceremony_id": ceremonyId};
    client.postRequest(ApiEndPoint.getCeremonyDetail, req).then((value) {
      if (value.data != null) {
        var data = GetCeremonyDetailResponse.fromJson(value.data);
        ceremonyDetail = data.data;

        callback?.call();
      } else {
        Fluttertoast.showToast(msg: "something went wrong");

        // something went wrong
      }
    });
  }

  getMenu(String ceremonyId, {VoidCallback? callback}) {
    print("id $ceremonyId");
    var req = {"ceremony_id": ceremonyId};

    client.postRequest(ApiEndPoint.getAllMenu, req).then((value) {
      if (value.data != null) {
        var data = MenuResponse.fromJson(value.data);
        creatorList = data.data;
        callback?.call();
      } else if (value.loading) {
      } else {
        Fluttertoast.showToast(msg: value.error ?? "something went wrong");

        // something went wrong
      }
    });
  }

  getTableOrder(String tableId, {VoidCallback? callback}) {
    var req = {"table_id": tableId};
    client.postRequest(ApiEndPoint.tableOrder, req).then((value) {
      if (value.data != null) {
        var data = TableOrderResponse.fromJson(value.data);
        tableOrderList = data.data;

        callback?.call();
      } else {
        Fluttertoast.showToast(msg: "something went wrong");

        // something went wrong
      }
    });
  }

  getTotalOrder({VoidCallback? callback}) {
    client.postRequest(ApiEndPoint.totalOrderValue, null).then((value) {
      if (value.data != null) {
        var json = value.data;
        totalOrder = json?["totalCost"];

        callback?.call();
      } else if (value.loading) {
      } else {
        Fluttertoast.showToast(msg: value.error ?? "something went wrong");

        // something went wrong
      }
    });
  }
}
