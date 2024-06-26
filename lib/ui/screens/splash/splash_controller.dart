import 'dart:io';

import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  Future<bool> checkPermission() async {
    // addSubmodule(
    //     'https://github.com/iampawan/fluttercalculator.git', 'calculator');
    return true;
  }

  // static Future<void> addSubmodule(
  //     String repoUrl, String destinationPath) async {
  //   try {
  //     final result = await Process.run(
  //       'usr/local/bin/git',
  //       ['submodule', 'add', repoUrl, destinationPath],
  //     );
  //     print(result.stdout);
  //   } catch (e) {
  //     print('Failed to add submodule: $e');
  //   }
  // }
}
