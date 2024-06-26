import 'package:flutter/material.dart';
import '../../utils/app_colors.dart';
import 'custom_text.dart';

class CustomDropDown<T> extends StatelessWidget {
  const CustomDropDown(
      {super.key,
      required this.list,
      required this.selectedValue,
      required this.onChanged, this.textColor = Colors.white});

  final List<T> list;
  final T selectedValue;
  final Function(T?)? onChanged;

  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<T>(
      isExpanded: true,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      value: selectedValue,
      icon: const Icon(Icons.arrow_drop_down,
          color: AppColors.bgOrangeColor, size: 34),
      dropdownColor: Colors.white,
      elevation: 16,
      underline: const SizedBox(),
      onChanged: onChanged,
      items: list.map<DropdownMenuItem<T>>((T value) {
        return DropdownMenuItem<T>(
            value: value,
            child: CustomText(
              value is String ? value : '',
              color: textColor,
            ));
      }).toList(),
    );
  }
}
