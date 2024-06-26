import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/app_colors.dart';
import 'custom_text.dart';
import 'svg_image_widget.dart';

class CustomTab extends StatelessWidget {
  const CustomTab(
      {super.key,
      required this.text,
      required this.isSelected,
      required this.onTap,
      this.isIcon = false});

  final bool isSelected;
  final String text;
  final Function()? onTap;
  final bool isIcon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        height: 50,
        child: DecoratedBox(
            decoration: BoxDecoration(
                color: isSelected ? AppColors.bgOrangeColor : Colors.white,
                borderRadius: const BorderRadius.all(Radius.circular(5))),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    isIcon
                        ? SvgImageWidget(
                            isSelected ? 'menu_ic_active' : 'menu_ic')
                        : const SizedBox(),
                    isIcon ? const SizedBox(width: 10) : const SizedBox(),
                    CustomText(text,
                        fontFamily: 'OpenSans',
                        color: isSelected ? Colors.white : Colors.black),
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
