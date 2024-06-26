import 'package:flutter/material.dart';
import 'package:host/utils/app_colors.dart';

class CustomLoader extends StatelessWidget {
  final double? size;

  const CustomLoader({super.key, this.size});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: SizedBox(
            height: size,
            width: size,
            child: const CircularProgressIndicator(
                color: AppColors.bgOrangeColor)));
  }
}
