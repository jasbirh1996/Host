import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:motion_toast/resources/arrays.dart';

class FlutterMotionToast {
  static void showToast({
    required BuildContext context,
    required String message,
    required bool isSuccess,
  }) {
    if (isSuccess) {
      _showSuccessToast(context,message);
    } else {
      _showErrorToast( context,message);
    }
  }

  static void _showSuccessToast(BuildContext context, String message) {
    MotionToast.success(
      description: Container(
        height: 400,
        child: Text(message, style: const TextStyle(
            color: Colors.white
        ),),
      ),
      position: MotionToastPosition.bottom,
      toastDuration: const Duration(seconds: 4),
      animationType: AnimationType.fromTop,
    ).show(context);
  }

  static void _showErrorToast (BuildContext context,String message) {
    MotionToast.error(
      description: Container(
        height: 200,

        child: Text(message, style: const TextStyle(
            color: Colors.white
        ),),
      ),
      position: MotionToastPosition.bottom,
      iconSize: 2,
      toastDuration: const Duration(seconds: 3),
      animationType: AnimationType.fromTop,
    ).show(context);
  }
}