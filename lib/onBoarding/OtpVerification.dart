import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:host/onBoarding/ResetPassword.dart';
import 'package:host/onBoarding/controller/OtpVerificationController.dart';
import 'package:host/utils/AppFonts.dart';
import 'package:keyboard_actions/keyboard_actions.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../utils/AppColor.dart';
import '../utils/AppComponents.dart';
import '../utils/AppConstans.dart';
import '../utils/AppUtils.dart';
import 'controller/TimerController.dart';

class OtpVerification extends StatelessWidget {
  String number;
  var otp = "";
  var controller = Get.put(OtpVerificationController());

  OtpVerification({super.key, required this.number});

  var timerController = Get.put(TimerController());
  FocusNode node = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: KeyboardActions(
        config: KeyboardActionsConfig(
            actions: [KeyboardActionsItem(focusNode: node)]),
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/app_bg_2.png"),
              fit: BoxFit.cover,
            ),
            color: Color.fromRGBO(
                0, 0, 0, 0.9), // Adjust the alpha value (0.5 for 50% opacity)
          ),
          child: Container(
            margin: EdgeInsets.only(left: 24, right: 24),
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.06,
                ),
                InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: const Row(
                    children: [
                      Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                        size: 18,
                      ),
                      Text(
                        "Back",
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: AppFonts.montserratRegular,
                            fontSize: 14),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.12,
                ),
                SizedBox(
                  height: 41,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppComponents.textWithBold(AppConstants.verification, 20,
                        color: Colors.black),
                    SizedBox(
                      height: 11,
                    ),
                    Row(
                      children: [
                        AppComponents.textWithRegular(
                            AppConstants.verificationCode, 14,
                            color: Colors.black),
                        AppComponents.textWithSemiBold("+"+number, 14,
                            color: Colors.black),
                      ],
                    ),
                    SizedBox(
                      height: 54,
                    ),
                    AppComponents.textWithBold(AppConstants.enterCodeHere, 20,
                        color: Colors.black),
                    SizedBox(
                      height: 12,
                    ),
                    Row(
                      children: [
                        AppComponents.textWithRegular(
                            AppConstants.youCanResend, 12,
                            color: Colors.black),
                        Obx(() => Text(
                              "00:${timerController.timeRemaining.value}",
                              style: const TextStyle(
                                  fontSize: 12,
                                  fontFamily: AppFonts.montserratRegular,
                                  color: AppColors.carrotRed),
                            ))
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    pinTextField(context),
                    SizedBox(
                      height: 26,
                    ),
                    Obx(() => timerController.timeRemaining.value == 0
                        ? Row(
                            children: [
                              AppComponents.textWithRegular(
                                  AppConstants.didNotReceiveCode, 12,
                                  color: Colors.black),
                              Spacer(),
                              InkWell(
                                onTap: () {
                                  timerController.timeRemaining.value = 30;
                                  timerController.startTimer();
                                  Fluttertoast.showToast(msg: "OTP resent to your mobile number successfully");

                                },
                                child: AppComponents.textWithRegular(
                                    AppConstants.resendNewOtp, 14,
                                    color: AppColors.carrotRed),
                              )
                            ],
                          )
                        : Container()),
                    SizedBox(
                      height: 40,
                    ),
                    AppComponents.createButton("Submit", () {
                      if (otp.isNotEmpty) {
                        controller.verifyOtp(otp);
                      } else {
                        Fluttertoast.showToast(msg: "Please Enter OTP");
                      }
                    }, defaultGradient: AppUtils.buttonGradient2)
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget pinTextField(BuildContext context) {
    return Container(
      child: Center(
        child: PinCodeTextField(
          focusNode: node,
          appContext: context,
          length: 4,
          onChanged: (value) {
            otp = value;
          },
          onCompleted: (value) {
            // Handle PIN submission
          },
          pinTheme: PinTheme(
            shape: PinCodeFieldShape.box,
            borderRadius: BorderRadius.circular(7),
            borderWidth: 0.2,
            fieldHeight: 58,
            fieldWidth: 63,
            activeColor: AppColors.carrotRed,
            inactiveColor: AppColors.carrotRed,
            selectedColor: AppColors.carrotRed,
          ),
          keyboardType: TextInputType.number,
          textStyle: const TextStyle(fontSize: 20, color: AppColors.carrotRed),
          obscureText: true,
          obscuringCharacter: "*",
          animationType: AnimationType.fade,
          animationDuration: const Duration(milliseconds: 300),
        ),
      ),
    );
  }
}
