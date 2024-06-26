import 'package:flutter/material.dart';
import 'custom_text.dart';
import '../../utils/app_colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.onClick});

  final Function()? onClick;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: const SizedBox(
          height: 55,
          width: double.infinity,
          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                stops: [0.1, 0.33, 0.66],
                colors: [
                  AppColors.bgOrangeColor,
                  AppColors.gradientColor2,
                  AppColors.bgYellowColor,
                ],
              ),
            ),
            child: Center(
                child: CustomText('View Menu',
                    color: AppColors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 16)),
          )),
    );
  }
}
