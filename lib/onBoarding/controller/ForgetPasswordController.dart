import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:host/data/model/forgetPass/ForgetPassResponse.dart';
import '../../data/ApiEndpoints.dart';
import '../../data/network/NetworkClass.dart';
import '../../utils/SharedPref.dart';
import '../OtpVerification.dart';

class ForgetPasswordController extends GetxController{
  var client = NetworkClass();
  forgetPassword(String countryCode,String mobNumber){
    var request = <String,dynamic>{};
    request['country_code'] =countryCode;
    request['mobile_number'] = mobNumber;

    client.postRequest(ApiEndPoint.forgetPass, request).then((value) {

      if(value.data !=null){
        var data = ForgetPassResponse.fromJson(value.data);
        SharedPref.saveAccessToken(data.data.accessToken);


        Get.to(()=>OtpVerification(number: countryCode +" "+ mobNumber,));

      }else if(value.loading){

      }else{
        Fluttertoast.showToast(msg: value.error??"something went wrong");

        // something went wrong
      }


    });
    
  }
  
}