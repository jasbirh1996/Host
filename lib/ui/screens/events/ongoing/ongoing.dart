import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../Utils/app_colors.dart';
import '../../../../utils/AppComponents.dart';
import '../../../../utils/AppUtils.dart';
import '../../../../utils/app_routes.dart';
import '../../../custom_widgets/custom_dropdown.dart';
import '../../../custom_widgets/custom_text.dart';
import '../../../custom_widgets/svg_image_widget.dart';
import '../event_controller.dart';
import '../table_view.dart';
import '../view_menu.dart';

class OnGoingEvent extends StatefulWidget {
  const OnGoingEvent({super.key});

  @override
  State<OnGoingEvent> createState() => _OnGoingEventState();
}

class _OnGoingEventState extends State<OnGoingEvent> {
  var controller = Get.put(EventController());
  @override
  void initState() {
    controller.getOnGoingCeremony(callback: (){
      controller.dropdownList.clear();
      controller.dropdownList = ['Select an event'];

      setState(() {
        controller.dropdownList.addAll(controller.mList.map((e) => e.eventName).toList());

      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        child: Column(
          children: [
            Container(
                height: 70,
                color: AppColors.bgLightPinkColor,
                child:Column(
                  children: [
                   SizedBox(height: 10,),
                    Container(
                      margin: EdgeInsets.only(left: 16,right: 16),
                      width: double.infinity,
                      height: 35,
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
                  ],
                )
            ),
            Expanded(
              child: ListView.builder(itemCount: controller.mList.length,itemBuilder: (BuildContext context, int index)
              {
                var data = controller.mList[index];
                return Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 20,right: 20),
                      child: Card(
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
                                  CustomText(data.eventName,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black,
                                      fontSize: 18),
                                  const SizedBox(height: 8),
                                  CustomText('Booked On : ${data.eventDate}',
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
                                            '${AppUtils().formatDate(data.eventStartTime*1000)}',
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

                                                child: CustomText(
                                                  data.restaurantId.firstname,
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
                    ),
                    SizedBox(height: 12,),
                    Container(
                      margin: EdgeInsets.only(left: 20,right: 20),
                      child: Row(
                        children: [
                          Expanded(child: Container(
                              height: 48,
                              child: AppComponents.getTransparentButton("View Table", () {
                                Get.to(TableView(eventName: "",ceremonyId: data.id,));
                              }))),
                          SizedBox(width: 15,),

                          Expanded(child: Container(
                              height: 48,
                              child: AppComponents.createButton("View Menu", () {
                                print("_ceremony ${data.id}");
                                Get.to(MenuView(ceremonyId: data.id,));
                              })))
                        ],
                      ),
                    )
                  ],
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
