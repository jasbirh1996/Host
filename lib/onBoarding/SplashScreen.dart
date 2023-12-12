import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:host/onBoarding/PermissionScreen.dart';

import '../utils/SharedPref.dart';
import 'LoginScreen.dart';
import 'controller/SplashController.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});
  var controller = Get.put(SplashController());
  @override
  Widget build(BuildContext context) {
    // Remove the following line to show the status bar
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge, overlays: []);
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // Make the status bar transparent// Use dark icons on the status bar
      systemNavigationBarColor: Colors.transparent, // Make the system navigation bar transparent
      // Use dark icons on the system navigation bar
    ));



    Future.delayed(Duration(seconds: 4), () {


      controller.checkPermission().then((value) {
        if(value){
          Get.offAll(LoginScreen());
        }else{
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
                    child: Image.asset("assets/images/logo.png",
                      height: 194,
                    )
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
