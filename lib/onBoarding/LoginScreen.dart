import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:host/dashBoard/HostDashBoard.dart';
import 'package:host/data/model/login/LoginRequest.dart';
import 'package:host/onBoarding/ForgetPassword.dart';
import 'package:host/onBoarding/controller/LoginController.dart';
import 'package:host/utils/AppUtils.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:keyboard_actions/keyboard_actions.dart';

import '../utils/AppColor.dart';
import '../utils/AppComponents.dart';
import '../utils/AppConstans.dart';
import '../utils/AppFonts.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  var mobileController = TextEditingController();
  String selectedDialCode = "91";
  FocusNode mobileNumberFocus = FocusNode();
  var passwordC = TextEditingController();
  var passwordN = FocusNode();
  var controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: KeyboardActions(
        config: KeyboardActionsConfig(
            actions: [
              KeyboardActionsItem(focusNode:mobileNumberFocus)
            ]
        ),
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/app_bg.png"),
              fit: BoxFit.cover,
            ),
            color: Color.fromRGBO(
                0, 0, 0, 0.9), // Adjust the alpha value (0.5 for 50% opacity)
          ),
          child: Container(
            margin: EdgeInsets.only(left: 24, right: 24),
            child: Column(
              children: [
                AppComponents.topAverageHeight(context),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 41,
                    ),
                    AppComponents.textWithBold(AppConstants.welcome, 20,
                        color: Colors.black),
                    SizedBox(
                      height: 8,
                    ),
                    AppComponents.textWithRegular(
                        AppConstants.enterCredential, 12,
                        color: AppColors.greyText),
                    SizedBox(
                      height: 40,
                    ),
                    mobileNumberTextField(),
                    SizedBox(
                      height: 16,
                    ),
                    AppComponents.textField("Password",
                        isObscure: true, controller: passwordC, node: passwordN),
                    SizedBox(
                      height: 16,
                    ),
                    Align(
                      alignment: AlignmentDirectional.centerEnd,
                      child: InkWell(
                        onTap: () {
                          Get.to(() => ForgetPassword());
                        },
                        child: AppComponents.textWithRegular(
                            "Forgot Password?", 14,
                            color: AppColors.carrotRed),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    AppComponents.createButton("Login", () {
                      if (mobileController.text.isEmpty) {
                        Fluttertoast.showToast(
                            msg: "Please enter mobile number");
                      } else if (passwordC.text.isEmpty) {
                        Fluttertoast.showToast(msg: "Please enter password");
                      } else {
                        var loginReq = LoginRequest(
                            password: passwordC.text,
                            countryCode: selectedDialCode,
                            mobileNumber: mobileController.text,
                            latitude: 28.5355,
                            longitude: 77.3910,
                            deviceType: Platform.isIOS ? "Ios" : "Android",
                            deviceToken: "token");
                        controller.login(loginReq);
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

  Widget mobileNumberTextField() {
    return Card(
      elevation: 2, // Adjust the elevation as needed
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Container(
          height: 58,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Theme(
              data: ThemeData(
                inputDecorationTheme: InputDecorationTheme(
                  border: InputBorder.none, // Remove default underline
                ),
              ),
              child: Center(
                child: IntlPhoneField(
                  controller: mobileController,
                  focusNode: mobileNumberFocus,
                  flagsButtonPadding: const EdgeInsets.only(left: 8, right: 0),
                  dropdownIconPosition: IconPosition.trailing,
                  dropdownTextStyle: const TextStyle(
                      fontSize: 16,
                      fontFamily: AppFonts.montserratRegular,
                      color: AppColors.black),
                  style: const TextStyle(
                      fontSize: 16,
                      fontFamily: AppFonts.montserratRegular,
                      color: AppColors.black),
                  autovalidateMode: AutovalidateMode.disabled,
                  decoration: const InputDecoration(
                    hintText: AppConstants.enterMobileNumber,
                    hintStyle: TextStyle(
                        fontSize: 16,
                        fontFamily: AppFonts.montserratRegular,
                        color: AppColors.black),
                    focusedBorder: InputBorder.none,
                    counterText: '',
                  ),
                  initialCountryCode: "IN",
                  disableLengthCheck: false,
                  onChanged: (value) {},
                  showCountryFlag: false,
                  dropdownIcon: const Icon(
                    Icons.arrow_drop_down,
                    color: Colors.orange,
                  ),
                  onCountryChanged: (value) {
                    selectedDialCode = value.dialCode;
                  },
                ),
              ))),
    );
  }
}
