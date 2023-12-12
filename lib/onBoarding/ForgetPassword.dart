import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:host/onBoarding/OtpVerification.dart';
import 'package:host/onBoarding/controller/ForgetPasswordController.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:keyboard_actions/keyboard_actions.dart';

import '../utils/AppColor.dart';
import '../utils/AppComponents.dart';
import '../utils/AppConstans.dart';
import '../utils/AppFonts.dart';
import '../utils/AppUtils.dart';

class ForgetPassword extends StatelessWidget {
   ForgetPassword({super.key});
  var mobileController = TextEditingController();
  var controller = Get.put(ForgetPasswordController());

  String selectedDialCode = "91";
  FocusNode mobileNumberFocus = FocusNode();

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
                      height: 73,
                    ),
                    AppComponents.textWithRegular(
                        AppConstants.enterMobileNumber, 12,
                        color: AppColors.black),
                    SizedBox(
                      height: 16,
                    ),
                    mobileNumberTextField(),
                    SizedBox(
                      height: 40,
                    ),

                    AppComponents.createButton("Get OTP", () {
                      if(mobileController.text.isNotEmpty){
                        controller.forgetPassword(selectedDialCode, mobileController.text);

                      }else{
                        Fluttertoast.showToast(msg: "Please enter Mobile Number");
                      }

                    },
                        defaultGradient: AppUtils.buttonGradient2)
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
