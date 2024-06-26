import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:host/onBoarding/PermissionScreen.dart';
import '../../../onBoarding/LoginScreen.dart';
import 'splash_controller.dart';

class SplashScreen extends GetView<SplashController> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge, overlays: []);
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      // Make the status bar transparent// Use dark icons on the status bar
      systemNavigationBarColor:
          Colors.transparent, // Make the system navigation bar transparent
      // Use dark icons on the system navigation bar
    ));

    Future.delayed(const Duration(seconds: 4), () {
      controller.checkPermission().then((value) {
        if (value) {
          Get.offAll(LoginScreen());
          // Get.offAll(PermissionScreen());
        } else {
          Get.offAll(PermissionScreen());
        }
      });
    });

    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/splash_bg.png"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Center(
                    child: Image.asset(
                  "assets/images/logo.png",
                  height: 194,
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
