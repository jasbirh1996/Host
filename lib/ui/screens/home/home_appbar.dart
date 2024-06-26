import 'package:flutter/material.dart';

import '../../custom_widgets/svg_image_widget.dart';

class HomeAppbar extends StatelessWidget {
  const HomeAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 45,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: const Row(children: [
        SvgImageWidget('header_logo'),
        Spacer(),
        SvgImageWidget('notifications_ic'),
      ],),
    );
  }
}