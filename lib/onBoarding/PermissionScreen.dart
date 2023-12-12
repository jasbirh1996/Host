
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/route_manager.dart';
import 'package:host/onBoarding/LoginScreen.dart';
import 'package:host/onBoarding/controller/PermissionController.dart';
import 'package:host/utils/AppComponents.dart';
import 'package:host/utils/AppConstans.dart';
import 'package:host/utils/AppUtils.dart';

import '../utils/AppColor.dart';
import '../utils/SharedPref.dart';

class PermissionScreen extends StatelessWidget {
   PermissionScreen({super.key});
   var controller = Get.put(PermissionController());

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        width: double.infinity,
       decoration: const BoxDecoration(
      image: DecorationImage(
      image: AssetImage("assets/images/app_bg.png"),
      fit: BoxFit.cover,
      ),
    color: Color.fromRGBO(0, 0, 0, 0.9), // Adjust the alpha value (0.5 for 50% opacity)

    ),
        child: Container(
          margin: EdgeInsets.only(left: 24,right: 24),
          child: Column(

            children: [
              AppComponents.topAverageHeight(context),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 41,),
                  AppComponents.textWithBold(AppConstants.permissionRequired, 20,color: Colors.black),
                  SizedBox(height: 8,),
                  AppComponents.textWithRegular(AppConstants.allow_this, 12,color: AppColors.greyText),
                  SizedBox(height: 40,),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset("assets/images/location_icon.png",
                        height: 22,
                      )
                      ,
                      const SizedBox(
                        width: 16,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          AppComponents.textWithSemiBold(AppConstants.location, 20,color: Colors.black),
                          const SizedBox(
                            height: 3,
                          ),
                          AppComponents.textWithRegular(
                              AppConstants.locationContent, 12,color: AppColors.greyText)
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 24,),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset("assets/images/bell_icon.png",
                        height: 22,
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          AppComponents.textWithSemiBold(
                              AppConstants.notification, 20,color: Colors.black),
                          const SizedBox(
                            height: 3,
                          ),
                          AppComponents.textWithRegular(
                              AppConstants.notificationContent, 12,color: AppColors.greyText)
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 40,),
                  Row(
                    children: [
                      Expanded(
                          child: AppComponents.getTransparentButton("Deny", () {
                            Get.to(LoginScreen());

                          })),
                      SizedBox(
                        width: 24,
                      ),
                      Expanded(
                        child: Container(
                          child: AppComponents.createButton('Allow', () {

                            controller.determinePosition().then((value) {

                            });

                            Get.off(()=>LoginScreen());
                          }),
                        ),
                      ),
                    ],
                  ),
                ],
              )



            ],
          ),
        ),


      ),

    );
  }
}
