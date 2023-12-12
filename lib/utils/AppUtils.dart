
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'AppColor.dart';



class AppUtils{

  static const buttonGradient =  LinearGradient(
    colors: [AppColors.btnGradient,AppColors.carrotRed2],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );
  static const buttonGradient2 =  LinearGradient(
    colors: [AppColors.carrotRed2,AppColors.btnGradient,],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );
}