import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:host/ui/screens/events/event_controller.dart';
import 'package:host/ui/screens/events/table_plan/order_view.dart';
import 'package:host/ui/screens/events/table_view.dart';
import 'package:host/ui/screens/events/view_menu.dart';
import 'package:host/utils/AppComponents.dart';
import 'package:host/utils/AppUtils.dart';
import 'package:host/utils/app_colors.dart';
import 'package:host/utils/dotted_widget.dart';

import '../../../../utils/AppFonts.dart';
import '../../../custom_widgets/custom_text.dart';

class TableDetailView extends StatefulWidget {
  String tableId;
  String tableNumber;

  TableDetailView({super.key, required this.tableId,required this.tableNumber});

  @override
  State<TableDetailView> createState() => _EventHostState();
}

class _EventHostState extends State<TableDetailView> {
  var controller = Get.put(EventController());
var totalCostList = <int>[];
var totalCost = 0;
  @override
  void initState() {
    controller.getTableOrder(widget.tableId, callback: () {
      setState(() {

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
                      "Orders",
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: AppFonts.montserratSemibold,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    Expanded(child: Container())
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                margin: EdgeInsets.only(left: 20,right: 20),
                height: 51,
                child: Card(
                  child: Row(
                    children: [
                      SizedBox(width: 15,),
                      AppComponents.textWithRegular("Table Number", 14,color: AppColors.grey),
                      Spacer(),
                      AppComponents.textWithRegular("${widget.tableNumber}", 14,color: AppColors.carrotRed)
                      ,       SizedBox(width: 15,),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Expanded(
                child: ListView.builder(
                    itemCount: controller.tableOrderList.length,
                    itemBuilder: (BuildContext context, int index) {
                      var data = controller.tableOrderList[index];
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(margin: EdgeInsets.only(left: 20),
                              child: AppComponents.textWithSemiBold("Order ${index +1}", 16,color: Colors.black)),
                          SizedBox(height: 15,),
                          Container(
                            margin: EdgeInsets.only(left: 20, right: 20),
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
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(16)),
                                      // border: Border.symmetric(
                                      //     vertical: BorderSide(color: AppColors.bgOrangeColor))
                                    ),
                                    child: Container(
                                      height: 190,
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            height: 12,
                                          ),
                                          Row(
                                            children: [
                                              SizedBox(
                                                width: 12,
                                              ),
                                              AppComponents.textWithRegular(
                                                  "Table Number", 12,
                                                  color: AppColors.grey),
                                              Spacer(),
                                              AppComponents.textWithBold(
                                                  data.tableName, 12,
                                                  color: AppColors.black),
                                              SizedBox(
                                                width: 12,
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 17,
                                          ),
                                          Row(
                                            children: [
                                              Spacer(),
                                              AppComponents.textWithRegular(
                                                  "Order Date & Time : ${AppUtils().getDateForTableView(data.addedOn * 1000)}",
                                                  12,
                                                  color: AppColors.carrotRed),
                                              Spacer(),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 17,
                                          ),
                                          Container(
                                              margin: EdgeInsets.only(
                                                  left: 20, right: 20, bottom: 15),
                                              child: DottedLine()),

                                          Row(
                                            children: [
                                              SizedBox(width: 12,),
                                              Column(
                                                children: [
                                                  AppComponents.textWithRegular(
                                                      "Order Qty", 12,
                                                      color: Colors.grey),
                                                  SizedBox(
                                                    height: 6,
                                                  ),

                                                  AppComponents.textWithRegular(
                                                      data.itemList.first.items
                                                          .map((e) => e.quantity)
                                                          .toList()
                                                          .reduce(
                                                              (value, element) =>
                                                          value + element)
                                                          .toString(),
                                                      12,
                                                      color: Colors.black),
                                                ],
                                              ),
                                              Spacer(),
                                              Column(
                                                children: [
                                                  AppComponents.textWithRegular(
                                                      "Total Amount", 12,
                                                      color: Colors.grey),
                                                  SizedBox(
                                                    height: 6,
                                                  ),
                                                  AppComponents.textWithBold(
                                                      "\$ ${
                                                          (data.itemList.first.items
                                                              .map((e) => e.quantity *e.price)
                                                              .toList()
                                                              .reduce(
                                                                  (value, element) =>
                                                              value + element))}",
                                                      12,
                                                      color: Colors.black),
                                                ],
                                              ),
                                              SizedBox(width: 12,),
                                            ],
                                          ),
                                          Expanded(child: Container()),
                                          Container(
                                            height: 46,
                                              child: AppComponents.createButton("View Order", () {

                                                controller.tableOrderData = data;
                                                Get.to(OrderView(orderName: "Order ${index +1}"));

                                              }))
                                        ],
                                      ),
                                    )),
                              ),
                            ),
                          ),
                          SizedBox(height: 15,),



                        ],
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
