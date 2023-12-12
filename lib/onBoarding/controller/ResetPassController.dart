import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:host/data/model/resetPass/ResetPasswordResponse.dart';
import 'package:host/onBoarding/ResetPassword.dart';


import '../../data/ApiEndpoints.dart';

import '../../data/network/NetworkClass.dart';
import '../../utils/CustomDialog.dart';
import '../LoginScreen.dart';

class ResetPassController extends GetxController{
  var client = NetworkClass();

  resetPassword(String password,BuildContext context){
    var request = <String,dynamic>{};
    request['password'] = password;


    client.postRequest(ApiEndPoint.resetPass, request).then((value) {

      if(value.data !=null){
        var data = ResetPasswordResponse.fromJson(value.data);
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return CustomDialog(
              showGif: false,
              gifImage: 'assets/images/logo_icon.png',
              label: "",
              description: "Password Successfully updated",
              image: 'assets/images/successful.png',
            );
          },
        );

        Future.delayed(Duration(seconds: 2)).then((value) =>Get.to(()=>LoginScreen()));


      }else if(value.loading){

      }else{
        Fluttertoast.showToast(msg: value.error??"something went wrong");
        print(value.error);
        // something went wrong
      }

    });

  }
}