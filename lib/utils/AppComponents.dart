import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'AppFonts.dart';
import 'AppUtils.dart';

class AppComponents {

  static Widget backButton() {
    return Row(
      children: [
        Image.asset(
          "assets/images/back.png",
          width: 30,
          height: 25,
        ),
        Text(
          "Back",
          style: TextStyle(color: AppColors.carrotRed),
        ),
      ],
    );
  }
  static Widget getTransparentButton(
      String text, VoidCallback onPressedCallback,{
        Color color = AppColors.carrotRed,
        Color textColor = AppColors.carrotRed,
        double defaultHeight = 56,
        double fontSize = 16,
        double defaultPaddingHorizontal = 16,
        double defaultPaddingVertical = 12,
        String defaultfont = AppFonts.openSansRegular
  }) {
    return Material(
      color: Colors.transparent,
      child: GestureDetector(
        onTap: onPressedCallback,
        child: Container(
          height: defaultHeight,
          decoration: BoxDecoration(
            border: Border.all(color: color),
            borderRadius: BorderRadius.circular(6.0),
          ),
          // padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          child: Center(
            child: Text(
              '$text',
              style:  TextStyle(
                  color: textColor,
                  fontSize: fontSize,
                  fontFamily: defaultfont),
            ),
          ),
        ),
      ),
    );
  }

  static Widget createButton(String text, VoidCallback onPressedCallback,
      {Gradient defaultGradient = AppUtils.buttonGradient}) {
    return Container(
      height: 56,
      decoration: BoxDecoration(
        gradient: defaultGradient,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: InkWell(
        onTap: onPressedCallback,
        child: Container(
          child: Center(
            child: Text(
              text,
              style: const TextStyle(
                  color: Colors.white,
                  fontFamily: AppFonts.montserratRegular,
                  fontSize: 16),
            ),
          ),
        ),
      ),
    );
  }

  static Widget createButtonWithIcon(String text, VoidCallback onPressed) {
    return Container(
      height: 56,
      width: 122,
      decoration: BoxDecoration(
        gradient: AppUtils.buttonGradient2,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: InkWell(
        onTap: onPressed,
        child: Container(
          child: Center(
              child: Row(
            children: [
              SizedBox(
                width: 11,
              ),
              Text(
                text,
                style: const TextStyle(
                    color: Colors.white,
                    fontFamily: AppFonts.montserratRegular,
                    fontSize: 16),
              ),
              Spacer(),
              Image.asset(
                "assets/images/next.png",
                width: 34,
                height: 34,
              ),
              SizedBox(
                width: 11,
              )
            ],
          )),
        ),
      ),
    );
  }

  static Widget textWithRegular(String text, double size,
      {Color color = Colors.white , TextAlign? align,int? mxline}) {
    return Text(
      textAlign:align,

      text,
      style: TextStyle(
          fontFamily: AppFonts.montserrat, fontSize: size, color: color),
      softWrap: true,
      overflow: TextOverflow.ellipsis,
      maxLines:mxline ,
    );
  }

  static Widget textWithSemiBold(String text, double size,
      {Color color = Colors.white,int? mxLines}) {
    return Text(
      text,
      style: TextStyle(
          fontFamily: AppFonts.montserratSemibold,
          fontSize: size,

          color: color),

      softWrap: true,
      overflow: TextOverflow.ellipsis,
      maxLines: mxLines,

    );
  }

  static Widget textWithBold(String text, double size,
      {Color color = Colors.white}) {
    return Text(text,
        style: TextStyle(
          fontFamily: AppFonts.montserratBold,
          fontWeight: FontWeight.bold,
          fontSize: size,
          color: color,
        ));
  }

  static Widget topAverageHeight(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.3,
    );
  }

  static Widget textField(String hint,
      {Color color = AppColors.greyText,
      bool isObscure = false,
      FocusNode? node,
      TextEditingController? controller}) {
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
                inputDecorationTheme: const InputDecorationTheme(
                  border: InputBorder.none, // Remove default underline
                ),
              ),
              child: Center(
                  child: Padding(
                padding: const EdgeInsets.only(
                  left: 16,
                ),
                child: TextField(
                  controller: controller,
                  focusNode: node,
                  obscureText: isObscure,
                  decoration: InputDecoration(
                      hintText: hint, hintStyle: TextStyle(color: color)),
                ),
              )))),
    );
  }

  static Widget textFormField(String hint,
      {Color color = AppColors.greyText, bool isObscure = false}) {
    return Card(
      elevation: 1,
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
          child: Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Stack(
              alignment: Alignment.topRight,
              children: [
                TextField(
                  obscureText: isObscure,
                  decoration: InputDecoration(
                    hintText: hint,
                    hintStyle: TextStyle(
                      color: color,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Icon(
                    Icons.star,
                    color: Colors.orange,
                    size: 15,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  static Widget textView(String hint, {Color color = AppColors.greyText}) {
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Container(
        width: double.infinity,
        height: 58,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 4),
          child: Row(
            children: [
              Text(
                hint,
                style: const TextStyle(
                    color: AppColors.black,
                    fontFamily: AppFonts.montserratRegular,
                    fontSize: 18),
              ),
              Spacer(),
              Icon(
                Icons.arrow_drop_down_sharp,
                color: AppColors.carrotRed,
                size: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
