import 'package:flutter/material.dart';
import '../../../utils/app_colors.dart';
import '../../custom_widgets/custom_text.dart';
import '../../custom_widgets/svg_image_widget.dart';

class CustomTabMenu extends StatelessWidget {
  const CustomTabMenu({super.key,
    required this.text,
    required this.isSelected,
    required this.onTap,
    required this.icon});

  final bool isSelected;
  final String text;
  final Function()? onTap;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        height: 50,
        child: DecoratedBox(
            decoration: BoxDecoration(
              border: Border.all(
                  color: isSelected
                      ? AppColors.borderOrangeColor
                      : AppColors.borderGreyColor),
              color: AppColors.bgLightPinkColor,
              borderRadius: const BorderRadius.all(Radius.circular(11)),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgImageWidget(isSelected
                        ? 'menu_category_active'
                        : 'menu_category_inactive'),
                    // Image.network(icon, width: 15, height: 15,),
                    const SizedBox(width: 10),
                    CustomText(text,
                        fontFamily: 'OpenSans',
                        color: isSelected
                            ? AppColors.textColorOrange
                            : Colors.black),
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
