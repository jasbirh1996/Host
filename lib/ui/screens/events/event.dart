import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:host/ui/screens/events/event_controller.dart';
import 'package:host/ui/screens/events/ongoing/ongoing.dart';
import 'package:host/ui/screens/events/past/past_event.dart';
import 'package:host/ui/screens/events/scheduled/scheduled_event.dart';
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
  Color onGoing = AppColors.carrotRed;
  Color upComing = AppColors.grey;
  Color past = AppColors.grey;
  @override
  void initState() {
    /*controller.getOnGoingCeremony(callback: (){
      setState(() {
        controller.dropdownList.addAll(controller.mList.map((e) => e.eventName).toList());

      });
    });*/
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


  /// ongoing, scheduled , past tabs

              Container(
                  height: 70,
                  color: AppColors.bgLightPinkColor,
                  child:Column(
                    children: [
                      SizedBox(height: 16,),


                      Container(
                        height: 50,
                        color: Colors.white,
                        child: Row(
                          children: [
                            const SizedBox(
                              width: 15,
                            ),
                            Expanded(
                                child: AppComponents.getTransparentButton(
                                    "Ongoing", () {
                                  selectTab("Ongoing");
                                },
                                    color: onGoing,
                                    textColor: onGoing,
                                    defaultHeight: 39,
                                    fontSize: 14,
                                    defaultPaddingHorizontal: 12
                                )),
                            const SizedBox(
                              width: 15,
                            ),
                            Expanded(
                              child: AppComponents.getTransparentButton(
                                  "Scheduled", () {
                                selectTab("Upcoming");
                              },
                                  color: upComing,
                                  textColor: upComing,
                                  defaultHeight: 39,
                                  fontSize: 14,
                                  defaultPaddingHorizontal: 12
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Expanded(
                              child: AppComponents.getTransparentButton(
                                  "Past", () {
                                selectTab("Past");
                              },
                                  color: past,
                                  textColor: past,
                                  defaultHeight: 39,
                                  fontSize: 14,
                                  defaultPaddingHorizontal: 12
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),

                          ],
                        ),
                      ),


                    ],
                  )
              ),


              Expanded(child:  Obx(() {
                switch (controller.selectTopTabIndex.value) {
                  case 0:

                    return OnGoingEvent();
                  case 1:

                    return ScheduledEvent();
                  case 2:
                    {

                      return PastEvent();
                    }


                  default:
                    return Container(); // Placeholder for no selection
                }
              })),
              const BottomNavigationWidget(activeTab: 2)
            ],
          ),
        ),
      ),
    );
  }
  selectTab(String tab){
    switch(tab){
      case"Ongoing":{
        setState(() {
          onGoing = AppColors.carrotRed;
          upComing = AppColors.grey;
          past = AppColors.grey;
          controller.selectTopTabIndex.value = 0;
        });
      }
      case"Upcoming":{
        setState(() {
          onGoing = AppColors.grey;
          upComing = AppColors.carrotRed;
          past = AppColors.grey;
          controller.selectTopTabIndex.value = 1;
        });
      }
      case"Past":{
        setState(() {
          onGoing = AppColors.grey;
          upComing = AppColors.grey;
          past = AppColors.carrotRed;
          controller.selectTopTabIndex.value = 2;
        });
      }
    }
  }
}
