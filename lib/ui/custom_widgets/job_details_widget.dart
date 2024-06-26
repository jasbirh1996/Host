import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:host/ui/custom_widgets/svg_image_widget.dart';
import 'package:host/ui/screens/home/event_details_response.dart';
import 'package:host/utils/AppUtils.dart';
import 'package:host/utils/app_routes.dart';
import '../../utils/SharedPref.dart';
import '../../utils/app_colors.dart';
import '../screens/events/view_menu.dart';
import 'custom_button.dart';
import 'custom_text.dart';

class EventDetailsWidget extends StatelessWidget {
  const EventDetailsWidget({super.key, required this.bean});
  final EventDetailsBean? bean;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: 2,
            shadowColor: AppColors.bgOrangeColor,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: DecoratedBox(
                decoration: const BoxDecoration(
                  color: AppColors.bgDarkGreyColor,
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                  // border: Border.symmetric(
                  //     vertical: BorderSide(color: AppColors.bgOrangeColor))
                ),
                child: Container(
                  color: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      CustomText(bean?.eventName??'',
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                          fontSize: 18),
                      const SizedBox(height: 8),
                      CustomText('Booked On : ${bean?.eventDate}',
                          color: AppColors.textColorLightGrey, fontSize: 12),
                      const SizedBox(height: 15),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Divider(
                          color: AppColors.dividerColor1,
                          height: 1,
                          thickness: 1,
                        ),
                      ),
                      const SizedBox(height: 15),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SvgImageWidget('calendar'),
                          const SizedBox(width: 8),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const CustomText('Event Date & Time',
                                  color: AppColors.textColorLightGrey2),
                              const SizedBox(height: 3),
                              CustomText(
                                '${bean?.eventDate} | ${AppUtils().getTimeFromEpochMillis(bean!.eventStartTime??0)}',
                                fontWeight: FontWeight.w700,
                              ),
                            ],
                          ),
                          const Spacer(),
                          const SizedBox(width: 5),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              const CustomText(
                                'Created By',
                                color: AppColors.textColorLightGrey2,
                              ),
                              const SizedBox(height: 3),
                              Row(
                                children: [
                                  Container(
                                    width: 100,
                                    child: CustomText(
                                      bean?.addedBy?.name??'',
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Get.toNamed(profileRoute);
                                    },
                                    child: const CustomText(' View',
                                        fontWeight: FontWeight.w700,
                                        color: AppColors.textColorOrange),
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                      const SizedBox(height: 15),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          CustomButton(
            onClick: () async{
              var userData = await SharedPref().getUserData();
              Get.to(MenuView(ceremonyId: userData?.ceremonyId??"",));
            },
          )
        ],
      ),
    );
  }
}
