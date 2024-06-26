import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:host/ui/custom_widgets/custom_loader.dart';
import 'package:host/ui/screens/menu/custom_tab_menu.dart';

import '../../../utils/app_colors.dart';
import '../../custom_widgets/custom_appbar_widget.dart';
import 'menu_item_widget.dart';
import 'view_menu_controller.dart';

class MenuScreen extends GetView<ViewMenuController> {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const CustomAppbarWidget('Menu'),
            const SizedBox(height: 10),
            Expanded(
                child: Obx(() => controller.isLoading.value
                    ? const CustomLoader()
                    : Column(
                        children: [
                          SizedBox(
                            height: 100,
                            child: DecoratedBox(
                              decoration: const BoxDecoration(
                                  color: AppColors.bgLightPinkColor),
                              child: Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Obx(() => ListView.builder(
                                        itemCount:
                                            controller.listMenuCategory.length,
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (_, index) => Row(
                                          children: [
                                            CustomTabMenu(
                                              text: controller
                                                      .listMenuCategory[index]
                                                      .categoryName ??
                                                  '',
                                              isSelected: controller
                                                  .listMenuCategory[index]
                                                  .isSelected
                                                  .value,
                                              icon: controller
                                                      .listMenuCategory[index]
                                                      .categoryImage ??
                                                  '',
                                              onTap: !controller
                                                      .listMenuCategory[index]
                                                      .isSelected
                                                      .value
                                                  ? () {
                                                      controller
                                                          .onTabClick(index);
                                                    }
                                                  : null,
                                            ),
                                            const SizedBox(width: 15)
                                          ],
                                        ),
                                      ))
                                  ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Expanded(
                            child: Obx(() => controller.isDataLoading.value
                                ? const CustomLoader()
                                : ListView.builder(
                                    itemCount: controller
                                        .listMenuItem.length,
                                    itemBuilder: (_, index) => Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 15.0),
                                          child: MenuItemWidget(
                                              bean: controller
                                                  .listMenuItem[index]),
                                        ))),
                          )
                        ],
                      )))
          ],
        ),
      ),
    );
  }
}
