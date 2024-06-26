import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:host/ui/screens/events/event_controller.dart';
import 'package:host/ui/screens/events/table_view.dart';
import 'package:host/ui/screens/events/view_menu.dart';
import 'package:host/utils/AppComponents.dart';
import 'package:host/utils/app_colors.dart';

import '../../../utils/AppUtils.dart';
import '../../../utils/app_routes.dart';
import '../../custom_widgets/bottom_navigation_widget.dart';
import '../../custom_widgets/custom_dropdown.dart';
import '../../custom_widgets/custom_text.dart';
import '../../custom_widgets/svg_image_widget.dart';

class EventHost extends StatefulWidget {
  const EventHost({super.key});

  @override
  State<EventHost> createState() => _EventHostState();
}

class _EventHostState extends State<EventHost> {
  var controller = Get.put(EventController());
  @override
  void initState() {
    controller.getOnGoingCeremony(callback: (){
      setState(() {
        controller.dropdownList.addAll(controller.mList.map((e) => e.eventName).toList());

      });
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              SizedBox(
                height: 24,
              ),
              Text(
                "My Events",
                style: TextStyle(
                    fontSize: 20, fontFamily: "OpenSans-SemiBold.ttf"),
              ),
              SizedBox(height: 12,),



              Container(
                  height: 130,
                  color: AppColors.bgLightPinkColor,
                  child:Column(
                    children: [
                      SizedBox(height: 16,),
                      Container(
                        color: Colors.white,

                        margin: EdgeInsets.only(left: 16,right: 16),
                        child: Row(
                          children: [
                            Expanded(child: Container(
                              decoration: BoxDecoration(
                                  color: AppColors.carrotRed,
                                  borderRadius: BorderRadius.circular(8)
                              ),
                              height: 39,
                              child: Center(
                                child: Text(
                                  "Ongoing",
                                  style: TextStyle(fontFamily: "OpenSans-Regular.ttf",fontSize: 14,color: Colors.white),
                                ),
                              ),
                            )),
                            Expanded(child: Container(

                              height: 39,
                              child: Center(
                                child: Text(
                                  "Scheduled",
                                  style: TextStyle(fontFamily: "OpenSans-Regular.ttf",fontSize: 14,color: Colors.black),
                                ),
                              ),
                            )),
                            Expanded(child: Container(

                              height: 39,
                              child: Center(
                                child: Text(
                                  "Past",
                                  style: TextStyle(fontFamily: "OpenSans-Regular.ttf",fontSize: 14,color: Colors.black),
                                ),
                              ),
                            ))
                          ],
                        ),),
                      SizedBox(height: 16,),
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
              const BottomNavigationWidget(activeTab: 2)
            ],
          ),
        ),
      ),
    );
  }
}
