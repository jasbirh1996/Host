import 'package:flutter/material.dart';
import '../../../utils/app_colors.dart';
import '../../custom_widgets/custom_text.dart';
import '../../custom_widgets/svg_image_widget.dart';
import 'menu_item_list_respoonse.dart';

class MenuItemWidget extends StatelessWidget {
  const MenuItemWidget({super.key, required this.bean});

  final MenuItemBean bean;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 2,
          shadowColor: AppColors.bgLightPinkColor,
          child: Container(
            padding: const EdgeInsets.all(10),
            color: Colors.white,
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                  child: Image.network(bean.dishImage ?? '',
                      height: 75, width: 75),
                ),
                // const SizedBox(
                //     height: 75,
                //     width: 75,
                //     child: DecoratedBox(
                //         decoration: BoxDecoration(
                //             color: AppColors.white,
                //             borderRadius:
                //                 BorderRadius.all(Radius.circular(5))))),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            bean.dishName ?? '',
                            fontFamily: 'OpenSans',
                            color: AppColors.black,
                            fontWeight: FontWeight.w700,
                          ),
                          DecoratedBox(
                              decoration: BoxDecoration(
                                  color: AppColors.white,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(2)),
                                  border: Border.all(
                                      color: AppColors.borderGreenColor)),
                              child: const Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 5, vertical: 3),
                                child: Center(
                                  child: Row(
                                    children: [
                                      SvgImageWidget('star_green'),
                                      SizedBox(width: 5),
                                      CustomText(
                                        '0',
                                        fontFamily: 'OpenSans',
                                        color: AppColors.black,
                                        fontSize: 10,
                                      ),
                                    ],
                                  ),
                                ),
                              ))
                        ],
                      ),
                      const SizedBox(height: 5),
                      CustomText(bean.description ?? '',
                          fontFamily: 'OpenSans',
                          color: AppColors.textColorLightGrey3,
                          fontSize: 10),
                      const SizedBox(height: 10),
                      CustomText(
                        '\$${bean.price ?? ''}',
                        fontFamily: 'OpenSans',
                        color: AppColors.textColorOrange,
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
