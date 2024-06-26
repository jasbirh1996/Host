import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:host/ui/custom_widgets/custom_loader.dart';

import '../../../utils/app_colors.dart';
import '../../custom_widgets/bottom_navigation_widget.dart';
import '../../custom_widgets/custom_dropdown.dart';
import '../../custom_widgets/custom_tab.dart';
import '../../custom_widgets/job_details_widget.dart';
import '../../custom_widgets/sitting_plan_widget.dart';
import '../home/home_controller.dart';
import 'home_appbar.dart';

/*class HomeScreen extends GetView<HomeController> {
   HomeScreen({super.key});
  var controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            const HomeAppbar(),
            Expanded(
                child: Obx(() => controller.isLoading.value
                    ? const CustomLoader()
                    : Column(children: [
                  Container(
                    color: AppColors.bgLightPinkColor,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 20),
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 45,
                          decoration: const BoxDecoration(
                              color: AppColors.bgLightGreyColor,
                              borderRadius:
                              BorderRadius.all(Radius.circular(5))),
                          child: Stack(
                            children: [
                              DecoratedBox(
                                decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(5))),
                                child: Theme(
                                  data: Theme.of(context).copyWith(
                                    canvasColor: Colors.white,
                                  ),
                                  child: Obx(() => CustomDropDown(
                                      textColor: Colors.black,
                                      list: controller.dropdownList,
                                      selectedValue: controller
                                          .selectedDropdownItem.value,
                                      onChanged:
                                      controller.onDropdownChanged)),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 3.0),
                                child: Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Row(
                                    children: [
                                      Expanded(
                                          child: Container(
                                            height: 1,
                                            color:
                                            AppColors.borderOrangeColor,
                                          )),
                                      Expanded(
                                          child: Container(
                                            height: 1,
                                            color:
                                            AppColors.borderYellowColor,
                                          )),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            Expanded(
                                child: Obx(() => CustomTab(
                                  text: 'Sitting Plan',
                                  isSelected: controller
                                      .isSittingPlanSelected.value,
                                  onTap: !controller
                                      .isSittingPlanSelected.value
                                      ? controller.onTabClick
                                      : null,
                                ))),
                            // const SizedBox(width: 15),
                            Expanded(
                                child: Obx(() => CustomTab(
                                  text: 'Event Details',
                                  isSelected: !controller
                                      .isSittingPlanSelected.value,
                                  onTap: controller
                                      .isSittingPlanSelected.value
                                      ? controller.onTabClick
                                      : null,
                                ))),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                      child: Obx(() => Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 20.0),
                        child: controller.isSittingPlanSelected.value
                            ? const SittingPlanWidget()
                            : EventDetailsWidget(bean: controller.eventDetailsResponse.value.data),
                      ))),
                ]))),
            const BottomNavigationWidget(activeTab: 1)
          ],
        ),
      ),
    );
  }
}*/

class HomeScreen extends StatelessWidget {
   HomeScreen({super.key});

  var controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            const HomeAppbar(),
            Expanded(
                child: Obx(() => controller.isLoading.value
                    ? const CustomLoader()
                    : Column(children: [
                  Container(
                    color: AppColors.bgLightPinkColor,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 20),
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 45,
                          decoration: const BoxDecoration(
                              color: AppColors.bgLightGreyColor,
                              borderRadius:
                              BorderRadius.all(Radius.circular(5))),
                          child: Stack(
                            children: [
                              DecoratedBox(
                                decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(5))),
                                child: Theme(
                                  data: Theme.of(context).copyWith(
                                    canvasColor: Colors.white,
                                  ),
                                  child: Obx(() => CustomDropDown(
                                      textColor: Colors.black,
                                      list: controller.dropdownList,
                                      selectedValue: controller
                                          .selectedDropdownItem.value,
                                      onChanged:
                                      controller.onDropdownChanged)),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 3.0),
                                child: Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Row(
                                    children: [
                                      Expanded(
                                          child: Container(
                                            height: 1,
                                            color:
                                            AppColors.borderOrangeColor,
                                          )),
                                      Expanded(
                                          child: Container(
                                            height: 1,
                                            color:
                                            AppColors.borderYellowColor,
                                          )),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            Expanded(
                                child: Obx(() => CustomTab(
                                  text: 'Sitting Plan',
                                  isSelected: controller
                                      .isSittingPlanSelected.value,
                                  onTap: !controller
                                      .isSittingPlanSelected.value
                                      ? controller.onTabClick
                                      : null,
                                ))),
                            // const SizedBox(width: 15),
                            Expanded(
                                child: Obx(() => CustomTab(
                                  text: 'Event Details',
                                  isSelected: !controller
                                      .isSittingPlanSelected.value,
                                  onTap: controller
                                      .isSittingPlanSelected.value
                                      ? controller.onTabClick
                                      : null,
                                ))),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                      child: Obx(() => Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 20.0),
                        child: controller.isSittingPlanSelected.value
                            // ? const SittingPlanWidget()
                            ?  SittingPlanRestaurant()
                            : EventDetailsWidget(bean: controller.eventDetailsResponse.value.data),
                      ))),
                ]))),
            const BottomNavigationWidget(activeTab: 1)
          ],
        ),
      ),
    );
  }
}

