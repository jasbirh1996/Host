import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:host/ui/screens/home/home_controller.dart';
import '../../utils/AppComponents.dart';
import '../../utils/AppConstans.dart';
import '../../utils/AppUtils.dart';
import '../../utils/app_colors.dart';
import '../screens/home/draggable_table.dart';
import 'custom_text.dart';

class SittingPlanWidget extends StatelessWidget {
  const SittingPlanWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CustomText('FRONT', color: Colors.black),
        SizedBox(height: 20),
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              RotatedBox(
                  quarterTurns: -1,
                  child: CustomText('LEFT', color: Colors.black)),
              Expanded(child: SittingPlanRestaurant()),
              RotatedBox(
                  quarterTurns: -1,
                  child: CustomText('RIGHT', color: Colors.black)),
            ],
          ),
        ),
        SizedBox(height: 20),
        CustomText('BACK', color: Colors.black),
      ],
    );
  }
}

class SittingPlanRestaurant extends StatefulWidget {
  const SittingPlanRestaurant({Key? key}) : super(key: key);

  @override
  State<SittingPlanRestaurant> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<SittingPlanRestaurant> {
  List<DraggableTable> draggableWidgets = [];
  var scrollEnable = true;
  var save = false;
  int? _draggingIndex;

  var controller = Get.put(HomeController());

  @override
  void initState() {
    // Initial zoom level
    controller.getHomeTable(callback: (){
      setState(() {
        if (controller.tableShape.isNotEmpty) {
          draggableWidgets = controller.tableShape;
        }
      });
    });


    super.initState();
  }

  startRotation(int index) {
    setState(() {
      draggableWidgets[index].rotation += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: scrollEnable
                  ? const AlwaysScrollableScrollPhysics()
                  : const NeverScrollableScrollPhysics(),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                physics: scrollEnable
                    ? const AlwaysScrollableScrollPhysics()
                    : const NeverScrollableScrollPhysics(),
                child: Container(
                  color: Colors.white,
                  width: 1500,
                  height: 1500,
                  child: Stack(
                    children: [
                      for (int i = 0; i < draggableWidgets.length; i++)
                        _buildDraggableContainer(i),
                    ],
                  ),
                ),
              ),
            ),
            // Positioned(
            //   top: 0,
            //   left: 0,
            //   right: 0,
            //   child: Container(
            //       height: 75,
            //       color: Colors.white, // Example color
            //       child: Column(
            //         children: [
            //           const SizedBox(
            //             height: 15,
            //           ),
            //           // Container(
            //           //   color: Colors.black,
            //           //   height: 60,
            //           //   child: Row(
            //           //     mainAxisAlignment: MainAxisAlignment.start,
            //           //     children: [
            //           //       const SizedBox(
            //           //         width: 5,
            //           //       ),
            //           //       // Expanded(
            //           //       //   child: InkWell(
            //           //       //       onTap: () {
            //           //       //         Get.back();
            //           //       //       },
            //           //       //       child: AppComponents.backButton()),
            //           //       // ),
            //           //       // const Text(
            //           //       //   "My Table Plan",
            //           //       //   style: TextStyle(
            //           //       //       color: Colors.white,
            //           //       //       // fontFamily: AppFonts.montserratSemibold,
            //           //       //       fontSize: 16,
            //           //       //       fontWeight: FontWeight.bold),
            //           //       // ),
            //           //       // Expanded(
            //           //       //   child: Transform.scale(
            //           //       //     scale: .9,
            //           //       //     child: Switch(
            //           //       //       value: scrollEnable,
            //           //       //       onChanged: (value) {
            //           //       //         setState(() {
            //           //       //           scrollEnable = value;
            //           //       //         });
            //           //       //       },
            //           //       //     ),
            //           //       //   ),
            //           //       // )
            //           //     ],
            //           //   ),
            //           // ),
            //         ],
            //       )),
            // ),
          ],
        ),
      ),
    );
  }

  Widget _buildDraggableContainer(int index) {
    return Positioned(
      left: draggableWidgets[index].offset.dx,
      top: draggableWidgets[index].offset.dy,
      child: GestureDetector(
        onTapDown: (details) {
          if (scrollEnable) {
            // var tableNameC = TextEditingController();
            // var seatPerTable = TextEditingController();
            //
            // tableNameC.text = draggableWidgets[index].tableName;
            // seatPerTable.text = draggableWidgets[index].seatPerTable;
            // _updateAndDeleteTable(context, tableNameC, seatPerTable, index, "");
          }
          setState(() {
            _draggingIndex = index;
          });
        },
        child: GestureDetector(
          onPanUpdate: (details) {
            var currentPos = draggableWidgets;
            print(currentPos);

            // if (_draggingIndex == index) {
            //   setState(() {
            //     // Update current position during drag
            //     draggableWidgets[index].offset += details.delta;
            //   });
            // }
          },
          child: draggableWidgets[index].shape == AppConstants.squareShape
              ?
              // for square
              Column(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: const BoxDecoration(
                        color: AppColors.grey,
                        shape: BoxShape.rectangle,
                      ),
                      child: Container(
                        width: 40,
                        child: Center(
                          child: AppComponents.textWithRegular(
                              draggableWidgets[index].tableName, 10,
                              color: AppColors.black),
                        ),
                      ),
                    ),
                    AppComponents.textWithRegular(
                        "Seats " + draggableWidgets[index].seatPerTable, 10,
                        color: AppColors.white)
                  ],
                )
              : draggableWidgets[index].shape == AppConstants.rectangleShape
                  ?
                  // for rectangle
                  RotatedBox(
                      quarterTurns: draggableWidgets[index].rotation,
                      child: Column(
                        children: [
                          Container(
                            width: 90,
                            height: 38,
                            decoration: const BoxDecoration(
                              color: AppColors.grey,
                              shape: BoxShape.rectangle,
                            ),
                            child: Row(
                              children: [
                                const SizedBox(
                                  width: 8,
                                ),
                                Container(
                                  width: 40,
                                  child: AppComponents.textWithRegular(
                                      draggableWidgets[index].tableName, 10,
                                      color: AppColors.black),
                                ),
                                const Spacer(),
                                InkWell(
                                  onTap: () {
                                    startRotation(index);
                                  },
                                  child: Container(
                                    height: 30,
                                    width: 30,
                                    decoration: const BoxDecoration(
                                        gradient: AppUtils.buttonGradient),
                                    child: const Icon(
                                      Icons.refresh,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 8,
                                )
                              ],
                            ),
                          ),
                          Container(
                            width: 60,
                            child: AppComponents.textWithRegular(
                                "Seats " + draggableWidgets[index].seatPerTable,
                                10,
                                color: AppColors.white),
                          )
                        ],
                      ),
                    )
                  :
                  // for circle
                  Column(
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: const BoxDecoration(
                            color: AppColors.grey,
                            shape: BoxShape.circle,
                          ),
                          child: Container(
                            width: 40,
                            child: Center(
                              child: AppComponents.textWithRegular(
                                  draggableWidgets[index].tableName, 10,
                                  color: AppColors.black),
                            ),
                          ),
                        ),
                        AppComponents.textWithRegular(
                            "Seats " + draggableWidgets[index].seatPerTable, 10,
                            color: AppColors.white)
                      ],
                    ),
        ),
      ),
    );
  }
}
