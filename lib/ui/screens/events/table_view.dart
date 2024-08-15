import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:host/ui/screens/events/table_plan/table_controller.dart';
import 'package:host/ui/screens/events/table_plan/table_detail.dart';
import 'package:host/ui/screens/events/view_menu.dart';
import 'package:host/utils/api_constants.dart';

import '../../../Utils/app_colors.dart';

import '../../../utils/AppComponents.dart';
import '../../../utils/AppConstans.dart';

import '../../../utils/AppFonts.dart';
import '../../../utils/AppUtils.dart';
import '../../../utils/CustomDialog.dart';
import '../home/draggable_table.dart';

import 'event_controller.dart';

class TableView extends StatefulWidget {
  String eventName;
  String? ceremonyId;

  TableView({Key? key, required this.eventName, this.ceremonyId})
      : super(key: key);

  @override
  State<TableView> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<TableView> {
  List<DraggableTable> draggableWidgets = [];
  var controller = Get.put(TableController());
  var totalOrderPrice = 0;
  var totalOrderPriceList = <int>[];

  var event = Get.put(EventController());
  var scrollEnable = false;

  int? _draggingIndex;

  @override
  void initState() {
    // Initial zoom level
    if (widget.ceremonyId != null) {
      event.getTotalOrder(callback: (){
        setState(() {
          totalOrderPrice = event.totalOrder;
        });
      });
      
      event.getCeremonyDetail(widget.ceremonyId ?? "", callback: () {
        setState(() {

          var data = event.ceremonyDetail!.tabledata;
          var list = data
              .map((e) => DraggableTable(
                  Offset(
                      double.parse(e.position.x), double.parse(e.position.y)),
                  e.tableType,
                  e.tableName,
                  e.seatPerTable.toString(),
                  e.tableCount.toString(),
                  e.position.rotation,
                  e.id,
                  e.qrCode,e.tableStatus))
              .toList();
          draggableWidgets = list;
        });
      });
    }

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
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                  height: 136,
                  color: Colors.white, // Example color
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 15,
                      ),
                      Container(
                        color: Colors.white,
                        height: 60,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const SizedBox(
                              width: 5,
                            ),
                            Expanded(
                              child: InkWell(
                                  onTap: () {
                                    Get.back();
                                  },
                                  child: AppComponents.backButton()),
                            ),
                            const Text(
                              "Table Plan",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: AppFonts.montserratSemibold,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            Expanded(
                              child: Transform.scale(
                                scale: .9,
                                child: Switch(
                                  value: scrollEnable,
                                  onChanged: (value) {
                                    setState(() {
                                      scrollEnable = value;
                                    });
                                  },
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 10,),
                      GradientDivider(),

                    ],
                  )),
            ),
          ],
        ),
        floatingActionButton: controller.saved
            ? Container(
                margin: const EdgeInsets.only(left: 30),
                height: 223,
                width: MediaQuery.of(context).size.width * 1,
                child: Container(
                    height: 142,
                    color: AppColors.bgLightPinkColor,
                    child: Column(
                      children: [
                        Expanded(
                            child: ListView(
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                const Spacer(),
                                // empty
                                Row(
                                  children: [
                                    Container(
                                      height: 9,
                                      width: 9,
                                      decoration: const BoxDecoration(
                                          color: AppColors.grey,
                                          shape: BoxShape.circle),
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    AppComponents.textWithRegular("Empty", 10,
                                        color: AppColors.black)
                                  ],
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                //served
                                Row(
                                  children: [
                                    Container(
                                      height: 9,
                                      width: 9,
                                      decoration: const BoxDecoration(
                                          color: Colors.green,
                                          shape: BoxShape.circle),
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    AppComponents.textWithRegular("Served", 10,
                                        color: AppColors.black)
                                  ],
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                // waiting
                                Row(
                                  children: [
                                    Container(
                                      height: 9,
                                      width: 9,
                                      decoration: const BoxDecoration(
                                          color: AppColors.carrotRed,
                                          shape: BoxShape.circle),
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    AppComponents.textWithRegular("Waiting", 10,
                                        color: AppColors.black)
                                  ],
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                const Spacer()
                              ],
                            ),
                            Container(
                                margin: EdgeInsets.only(
                                    left: 20, top: 20, bottom: 10),
                                child: AppComponents.textWithBold(
                                    "View Total Orders", 18,
                                    color: Colors.black)),
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    height: 110,
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: event.ceremonyDetail!.menuList.length + 1,
                                      itemBuilder: (BuildContext context, int index) {
                                        if (index == 0) {
                                          return Container(
                                            margin: EdgeInsets.only(left: 20),
                                            height: 110,
                                            width: 120,
                                            decoration: BoxDecoration(
                                              gradient: AppUtils.buttonGradient,
                                              shape: BoxShape.rectangle,
                                              borderRadius: BorderRadius.circular(10.0),
                                            ),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                const SizedBox(height: 18),
                                                Row(
                                                  children: [
                                                    const SizedBox(width: 10),
                                                    AppComponents.textWithSemiBold("\$ $totalOrderPrice", 16, color: Colors.white),
                                                    const Spacer(),
                                                    Container(
                                                      height: 40,
                                                      width: 40,
                                                      decoration: const BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        color: Color(0xFFFF7655),
                                                      ),
                                                      child: Center(
                                                        child: SvgPicture.asset(
                                                          "assets/images/sales_revenue.svg",
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    ),
                                                    const SizedBox(width: 10)
                                                  ],
                                                ),
                                                Container(
                                                  margin: const EdgeInsets.only(left: 10, top: 6),
                                                  child: AppComponents.textWithSemiBold("Total Cost", 16, color: Colors.white),
                                                ),
                                              ],
                                            ),
                                          );
                                        } else {
                                          var data = event.ceremonyDetail!.menuList[index - 1];
                                          return Container(
                                            margin: EdgeInsets.only(left: 20),
                                            height: 90,
                                            width: 120,
                                            decoration: BoxDecoration(
                                              gradient: AppUtils.buttonGradient,
                                              shape: BoxShape.rectangle,
                                              borderRadius: BorderRadius.circular(10.0),
                                            ),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                const SizedBox(height: 18),
                                                Row(
                                                  children: [
                                                    const SizedBox(width: 10),
                                                    AppComponents.textWithSemiBold("${data.totalOrders.toString()}", 16, color: Colors.white),
                                                    const Spacer(),
                                                    Container(
                                                      height: 40,
                                                      width: 40,
                                                      decoration: const BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        color: Color(0xFFFF7655),
                                                      ),
                                                      child: Center(
                                                        child: ClipOval(
                                                          child: Image.network(ApiConstants.baseUrl + data.categoryImage),
                                                        ),
                                                      ),
                                                    ),
                                                    const SizedBox(width: 10),
                                                  ],
                                                ),
                                                Container(
                                                  width: 100,
                                                  margin: const EdgeInsets.only(left: 10, top: 6),
                                                  child: AppComponents.textWithSemiBold("Total ${data.categoryName}", 13, color: Colors.white),
                                                ),
                                              ],
                                            ),
                                          );
                                        }
                                      },
                                    ),
                                  ),
                                )

                              ],
                            )

                          ],
                        )),
                        const SizedBox(
                          height: 20,
                        )
                      ],
                    )),
              )
            : Container(
                margin: const EdgeInsets.only(left: 30),
                height: 92,
                width: MediaQuery.of(context).size.width * 1,
                child: Container(
                    height: 92,
                    color: AppColors.grey.withOpacity(0.6),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 29,
                        ),
                        Row(
                          children: [
                            const SizedBox(
                              width: 20,
                            ),
                            Expanded(
                                child: AppComponents.createButton("Save", () {
                              setState(() {
                                controller.saved = true;
                              });
                            })),
                            const SizedBox(
                              width: 20,
                            ),
                            Expanded(
                                child: AppComponents.getTransparentButton(
                                    "Add More Table", () {})),
                            const SizedBox(
                              width: 20,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        )
                      ],
                    )),
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
          if(draggableWidgets[index].tableStatus !="empty"){
            Get.to(TableDetailView(tableId: draggableWidgets[index].id,tableNumber: draggableWidgets[index].tableName,));
          }else{
            print("table_id ${draggableWidgets[index].id}");
            Fluttertoast.showToast(msg: "No Active Orders");
          }
          // if (scrollEnable) {
          //   var tableNameC = TextEditingController();
          //   var seatPerTable = TextEditingController();
          //
          //   tableNameC.text = draggableWidgets[index].tableName;
          //   seatPerTable.text = draggableWidgets[index].seatPerTable;
          //   _updateAndDeleteTable(
          //       context, tableNameC, seatPerTable,index,draggableWidgets[index].id);
          // }
          // setState(() {
          //   _draggingIndex = index;
          // });
        },
        child: GestureDetector(
          onPanUpdate: (details) {
            // var currentPos = draggableWidgets;
            //
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
                            decoration:  BoxDecoration(
                              color: setTableColor(draggableWidgets[index].tableStatus),                              shape: BoxShape.rectangle,
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
                          decoration:  BoxDecoration(
                            color: setTableColor(draggableWidgets[index].tableStatus),
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
                            color: AppColors.black)
                      ],
                    ),
        ),
      ),
    );
  }
 Color setTableColor(String status){
    switch(status){
      case "empty":{
        return AppColors.grey;
      }
      case "waiting":{
        return AppColors.carrotRed;
      }
      case "served":{
        return Colors.green;
      }
    }
    return AppColors.grey;
  }
}
