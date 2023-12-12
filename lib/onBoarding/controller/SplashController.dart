import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class SplashController extends GetxController{
  Future<bool> checkPermission() async{
    var permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      return false;
    }else{
      return true;
    }
  }
}