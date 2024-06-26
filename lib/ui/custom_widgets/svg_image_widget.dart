import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../utils/app_constant.dart';

class SvgImageWidget extends StatelessWidget {
  const SvgImageWidget(this.imageName, {super.key, this.size});

  final String imageName;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset('$imagePathSvg$imageName.svg',
        width: size, height: size);
  }
}
