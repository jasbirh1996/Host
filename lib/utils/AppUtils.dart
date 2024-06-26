
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'app_colors.dart';



class AppUtils{
  static  const cardRedPink =  LinearGradient(
    colors: [Color(0xFFFE485F), Color(0xFFFF7A58)],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );
  // purple graident card
  static  const purpleGradientCard =  LinearGradient(
    colors: [Color(0xFF6C58EC), Color(0xFFB293FE)],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );
  static String capitalizeFirstLetter(String input) {
    if (input.isEmpty) {
      return input; // Return the original string if it's empty
    }
    return input[0].toUpperCase() + input.substring(1);
  }
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
  String getTimeFromEpochMillis(int epochMillis) {
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(epochMillis);
    String formattedTime = DateFormat('hh:mm a').format(dateTime); // 'a' for AM/PM
    return formattedTime;
  }
  String getDateForTableView(int epochMillis) {
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(epochMillis);
    String formattedTime = DateFormat('dd/MM/yy | hh:mm a').format(dateTime); // 'a' for AM/PM
    return formattedTime;
  }
  String formatDate(int epochMillis) {
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(epochMillis);
    String formattedTime = DateFormat('dd MMM, yy | hh:mm a').format(dateTime); // 'a' for AM/PM
    return formattedTime;
  }
}