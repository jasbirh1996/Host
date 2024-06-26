import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:host/ui/screens/events/event.dart';
import 'package:host/ui/screens/home/home_screen.dart';
import '../../utils/app_colors.dart';
import 'custom_text.dart';
import 'svg_image_widget.dart';

class BottomNavigationWidget extends StatelessWidget {
  const BottomNavigationWidget({super.key, this.activeTab = 1});

  final int activeTab;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      // height: 80,
      decoration: const BoxDecoration(color: AppColors.bgDarkGreyColor),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              height: 60,
              child: DecoratedBox(
                decoration: const BoxDecoration(color: AppColors.white),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                        child: //activeTab == 1
                        //     ? const SizedBox()
                        //     :
                    _ceremonyWidget()
              ),
                    Expanded(
                        child: //activeTab == 2
                            // ? const SizedBox()
                            // :
                        _eventsWidget()
                    ),
                    Expanded(
                        child:
                            // activeTab == 3 ? const SizedBox() :
                            _jobsWidget()),
                    Expanded(
                        child:
                        // activeTab == 4 ? const SizedBox():
                        _profileWidget()),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _ceremonyWidget() => InkWell(
    onTap: (){
      Get.offAll(HomeScreen());
    },
    child: Column(
          mainAxisAlignment:
              activeTab == 0 ? MainAxisAlignment.start : MainAxisAlignment.center,
          children: [
            const SvgImageWidget('bottom_home_active'),
            const SizedBox(height: 5),
            CustomText('CEREMONY',
                fontSize: 10,
                color: activeTab == 1
                    ? AppColors.bottomNavColorActive
                    : AppColors.bottomNavColorUnActive),
          ],
        ),
  );

  _eventsWidget() => InkWell(
    onTap: (){
      Get.offAll(EventHost());

    },
    child: Column(
          mainAxisAlignment:
              activeTab == 2 ? MainAxisAlignment.start : MainAxisAlignment.center,
          children: [
            const SvgImageWidget('bottom_events'),
            const SizedBox(height: 5),
            CustomText('EVENTS',
                fontSize: 10,
                color: activeTab == 2
                    ? AppColors.bottomNavColorActive
                    : AppColors.bottomNavColorUnActive),
          ],
        ),
  );

  _jobsWidget() => Column(
        mainAxisAlignment:
            activeTab == 3 ? MainAxisAlignment.start : MainAxisAlignment.center,
        children: [
          const SvgImageWidget('bottom_jobs'),
          const SizedBox(height: 5),
          CustomText('Event Creator',
              fontSize: 10,
              color: activeTab == 4
                  ? AppColors.bottomNavColorActive
                  : AppColors.bottomNavColorUnActive),
        ],
      );

  _profileWidget() => Column(
        mainAxisAlignment:
            activeTab == 4 ? MainAxisAlignment.start : MainAxisAlignment.center,
        children: [
          const SvgImageWidget('bottom_profile'),
          const SizedBox(height: 5),
          CustomText('PROFILE',
              fontSize: 10,
              color: activeTab == 4
                  ? AppColors.bottomNavColorActive
                  : AppColors.bottomNavColorUnActive),
        ],
      );
}
