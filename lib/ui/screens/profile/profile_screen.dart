import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:host/data/ApiEndpoints.dart';
import 'package:host/utils/AppComponents.dart';
import '../../../utils/app_colors.dart';
import '../../custom_widgets/custom_appbar_widget.dart';
import '../../custom_widgets/custom_text.dart';
import 'profile_controller.dart';

class ProfileScreen extends GetView<ProfileController> {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const CustomAppbarWidget('Creator Profile'),
            const SizedBox(height: 10),
            const Divider(
              color: AppColors.borderOrangeColor,
              height: 1,
            ),
            DecoratedBox(
              decoration:
                  const BoxDecoration(color: AppColors.bgLightPinkColor),
              child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 85,
                        width: 85,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                              color: AppColors.white,
                              shape: BoxShape.circle,
                              border:
                                  Border.all(color: AppColors.bgOrangeColor)),
                          child: ClipRRect(
                            child: Obx(() => Image.network(
                                "${controller.response.value.data?.profilePic}" ??
                                    ''),)
                          ),
                        ),
                      ),
                      const SizedBox(width: 15),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Obx(() => CustomText(
                                '${controller.response.value.data?.firstname} ${controller.response.value.data?.lastname}',
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                fontFamily: 'Montserrat')),
                            const SizedBox(height: 5),
                            Obx(() => CustomText(
                                controller.response.value.data?.email ?? '',
                                color: AppColors.textColorLightGrey3,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Montserrat')),
                            const SizedBox(height: 5),
                            Obx(() => CustomText(
                                '${controller.response.value.data?.countryCode}-${controller.response.value.data?.mobileNumber}',
                                color: AppColors.textColorLightGrey3,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Montserrat')),
                          ],
                        ),
                      ),
                      Spacer(),

                      Icon(Icons.star,color: AppColors.carrotRed,size: 20,),
                      SizedBox(width: 5,),
                      AppComponents.textWithBold("4.0", 14,color: Colors.black)

                    ],
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomText('Business Details',
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                  const SizedBox(height: 16),
                  Card(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 2,
                    shadowColor: AppColors.bgOrangeColor,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      color: Colors.white,
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const CustomText('Business name',
                                    color: AppColors.textColorLightGrey2,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400),
                                Obx(() => CustomText(
                                    controller.response.value.data
                                        ?.businessName ??
                                        '',
                                    color: AppColors.textColorOrange,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700),)
                              ]),
                          const SizedBox(height: 10),
                          const Divider(color: AppColors.borderOrangeColor),
                          const SizedBox(height: 10),
                          const CustomText('Business Logo',
                              color: AppColors.textColorLightGrey2,
                              fontSize: 12,
                              fontWeight: FontWeight.w400),
                          const SizedBox(height: 8),
                          SizedBox(
                            height: 40,
                            width: 40,
                            child: Card(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6),
                              ),
                              elevation: 2,
                              child: Container(
                                color: Colors.white,
                                child: Center(
                                  child: Obx(() => Image.network("${controller
                                      .response.value.data?.businessLogo}" ??
                                      '')),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          const CustomText('Images',
                              color: AppColors.textColorLightGrey2,
                              fontSize: 12,
                              fontWeight: FontWeight.w400),
                          const SizedBox(height: 8),
                          SizedBox(
                            height: 45,
                            child: Obx(() => ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: controller
                                    .response.value.data?.images?.length ??
                                    0,
                                itemBuilder: (_, index) => Row(
                                  children: [
                                    Image.network(controller.response.value
                                        .data?.images?[index].url ??
                                        ''),
                                    const SizedBox(width: 10)
                                  ],
                                )),)
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
