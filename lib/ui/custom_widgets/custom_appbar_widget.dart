import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/app_colors.dart';
import 'custom_text.dart';
import 'svg_image_widget.dart';

class CustomAppbarWidget extends StatelessWidget {
  const CustomAppbarWidget(this.title, {super.key});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.white,
          child: InkWell(
            onTap: () {
              Get.back();
            },
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SvgImageWidget('arrow_back_button'),
                SizedBox(width: 2),
                CustomText(
                  'Back',
                  color: AppColors.textColorOrange,
                )
              ],
            ),
          ),
        ),
        Center(
          child: CustomText(fontFamily: 'OpenSans',

            title,
            color: AppColors.black,
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        )
      ],
    );
  }
}
