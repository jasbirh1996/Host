

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:host/onBoarding/LoginScreen.dart';
import 'package:host/onBoarding/controller/ResetPassController.dart';
import 'package:keyboard_actions/keyboard_actions.dart';

import '../utils/app_colors.dart';
import '../utils/AppComponents.dart';
import '../utils/AppConstans.dart';
import '../utils/AppFonts.dart';
import '../utils/AppUtils.dart';
import '../utils/CustomDialog.dart';
import '../utils/FlutterMotionToast.dart';

class ResetPassword extends StatelessWidget {
  ResetPassword({super.key});

  var controller = Get.put(ResetPassController());
  var passwordC = TextEditingController();
  var confirmPassC = TextEditingController();

  var passwordN = FocusNode();
  var confirmPassN = FocusNode();

  bool validatePassword(
      String password, String confirmPassword, BuildContext context) {
    if (password.isEmpty && confirmPassword.isEmpty) {
      Fluttertoast.showToast(msg: "Please enter password and confirm password");
      // Password fields are empty
      return false;
    }

    if (password.isEmpty) {
      Fluttertoast.showToast(msg: "Please enter password");
      // Password fields are empty
      return false;
    }

    if (confirmPassword.isEmpty) {
      Fluttertoast.showToast(msg: "Please enter confirm password");
      // Password fields are empty
      return false;
    }



    if (password != confirmPassword) {
      // Passwords do not match
      Fluttertoast.showToast(msg: "Passwords do not match");
      return false;
    }

    if (password.length < 8 || password.length > 15) {
      // Password length is not within the specified range

      FlutterMotionToast.showToast(
        context: context,
        message: AppConstants.passwordValidationMessage,
        isSuccess: false,
      );
      return false;
    }

    // Check for at least one uppercase letter
    if (!password.contains(RegExp(r'[A-Z]'))) {
      FlutterMotionToast.showToast(
        context: context,
        message: AppConstants.passwordValidationMessage,
        isSuccess: false,
      );
      // No uppercase letter found
      return false;
    }

    // Check for at least one lowercase letter
    if (!password.contains(RegExp(r'[a-z]'))) {
      FlutterMotionToast.showToast(
        context: context,
        message: AppConstants.passwordValidationMessage,
        isSuccess: false,
      );
      return false;
    }
    if (!password.contains(RegExp(r'[0-9]'))) {
      Fluttertoast.showToast(
          msg: AppConstants.passwordValidationMessage, fontSize: 10);
      // No digit found
      return false;
    }
    // Check for at least one special character
    if (!password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      // No special character found
      FlutterMotionToast.showToast(
        context: context,
        message: AppConstants.passwordValidationMessage,
        isSuccess: false,
      );
      return false;
    }

    // If all checks pass, the password is valid
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: KeyboardActions(
        config: KeyboardActionsConfig(actions: [
          KeyboardActionsItem(focusNode: passwordN),
          KeyboardActionsItem(focusNode: confirmPassN),
        ]),
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
                    AppComponents.textWithBold(AppConstants.resetPassword, 20,
                        color: Colors.black),
                    SizedBox(
                      height: 34,
                    ),
                    AppComponents.textWithRegular(AppConstants.newPassword, 14,
                        color: AppColors.black),
                    SizedBox(
                      height: 16,
                    ),
                    AppComponents.textField("Password",
                        isObscure: true,
                        controller: passwordC,
                        node: passwordN),
                    SizedBox(
                      height: 16,
                    ),
                    AppComponents.textWithRegular(
                        AppConstants.confirmPassword, 14,
                        color: AppColors.black),
                    SizedBox(
                      height: 16,
                    ),
                    AppComponents.textField("Password",
                        isObscure: true,
                        controller: confirmPassC,
                        node: confirmPassN),
                    SizedBox(
                      height: 40,
                    ),
                    AppComponents.createButton("Confirm", () {
                      if (validatePassword(
                          passwordC.text, confirmPassC.text, context)) {
                        controller.resetPassword(passwordC.text, context);
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
}
