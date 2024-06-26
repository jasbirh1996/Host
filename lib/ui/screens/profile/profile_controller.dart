import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:host/ui/screens/profile/profile_response.dart';
import 'package:host/utils/SharedPref.dart';

import '../../../network/app_repo.dart';

class ProfileController extends GetxController {

  final isLoading = true.obs;

  final response = ProfileResponse().obs;

  @override
  void onReady() {
    super.onReady();
    getProfileDetails();
  }

  getProfileDetails() async {
    try {
      response.value = await AppRepo().getProfileDetails();
      isLoading.value = false;
    } on Exception catch (e) {
      isLoading.value = false;
    }
  }
}
