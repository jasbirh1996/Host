import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:host/data/ApiEndpoints.dart';
import 'package:host/data/model/login/LoginRequest.dart';
import 'package:host/ui/screens/home/home_screen.dart';

import '../../data/model/login/LoginResponse.dart';
import '../../data/network/NetworkClass.dart';
import '../../utils/SharedPref.dart';
import '../../utils/app_routes.dart';

class LoginController extends GetxController {
  final client = NetworkClass();

  login(LoginRequest request) {
    client.postRequest(ApiEndPoint.login, request).then((value) {
      if (value.data != null) {
        var data = LoginResponse.fromJson(value.data);
        SharedPref.saveAccessToken(data.data.accessToken);

        SharedPref().saveUserData(data.data);
        Get.offAll(HomeScreen());
        // Get.offAllNamed(homeScreenRoute);
        // Get.to(()=>HostDashBoard());
      } else if (value.loading) {
      } else {
        Fluttertoast.showToast(msg: value.error ?? "something went wrong");
        debugPrint(value.error);
        // something went wrong
      }
    });
  }
}
