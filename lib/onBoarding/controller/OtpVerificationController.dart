import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:host/data/model/OtpResponse.dart';
import '../../data/ApiEndpoints.dart';
import '../../data/network/NetworkClass.dart';
import '../../utils/SharedPref.dart';
import '../ResetPassword.dart';

class OtpVerificationController extends GetxController{
  var client = NetworkClass();

  verifyOtp(String otp){
    print("otp is $otp");
    var req = <String,dynamic>{};
    req['OTP'] = otp;
    client.postRequest(ApiEndPoint.verifyOtp,req ).then((value) {
      if(value.data !=null){
        var data = OtpResponse.fromJson(value.data);
        SharedPref.saveAccessToken(data.data.accessToken);

        if(data.data.isVerified){
          Get.off(()=>ResetPassword());
          
        }else{
          Fluttertoast.showToast(msg: "Invalid Otp");
        }


      }else if(value.loading){

      }else{
        Fluttertoast.showToast(msg: value.error??"something went wrong");
        print(value.error);
        // something went wrong
      }
    });
  }
}