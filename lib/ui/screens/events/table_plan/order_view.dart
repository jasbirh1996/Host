import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:host/ui/screens/events/event_controller.dart';
import 'package:host/ui/screens/events/table_view.dart';
import 'package:host/ui/screens/events/view_menu.dart';
import 'package:host/utils/AppComponents.dart';
import 'package:host/utils/AppUtils.dart';
import 'package:host/utils/app_colors.dart';
import 'package:host/utils/dotted_widget.dart';

import '../../../../utils/AppFonts.dart';
import '../../../custom_widgets/custom_text.dart';

class OrderView extends StatefulWidget {
  String orderName;

  OrderView({super.key, required this.orderName});

  @override
  State<OrderView> createState() => _EventHostState();
}

class _EventHostState extends State<OrderView> {
  var controller = Get.put(EventController());
  var totalPriceList = <int>[];
  var totalPrice = 0;

  @override
  void initState() {
    controller.tableOrderData!.itemList.first.items.forEach((element) {
      totalPriceList.add(element.price * element.quantity);
    });
    setState(() {
      totalPrice = totalPriceList.reduce((value, element) => value + element);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                    Text(
                      "${widget.orderName}",
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: AppFonts.openSansBold,
                          fontSize: 20,
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
                  margin: EdgeInsets.only(left: 20),
                  child: AppComponents.textWithSemiBold("Order Items", 16,
                      color: Colors.black)),
              SizedBox(
                height: 16,
              ),
              Container(
                  height: 180,
                  margin:
                      EdgeInsets.only(top: 16, bottom: 20, left: 20, right: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Card(
                    color: Colors.white,
                    child: Column(
                      children: [
                        Container(
                          height: 40,
                          decoration: BoxDecoration(
                              color: AppColors.carrotRed,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(12),
                                  topRight: Radius.circular(12))),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 12,
                              ),
                              AppComponents.textWithSemiBold(
                                  "Item", 12,
                                  color: Colors.white),
                              Spacer(),
                              AppComponents.textWithSemiBold("Qty", 12,
                                  color: Colors.white),
                              Spacer(),
                              AppComponents.textWithSemiBold("Price", 12,
                                  color: Colors.white),
                              SizedBox(
                                width: 12,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 100,
                          child: ListView.builder(
                              itemCount: controller
                                  .tableOrderData!.itemList.first.items.length,
                              itemBuilder: (BuildContext context, int index) {
                                var data = controller.tableOrderData!.itemList
                                    .first.items[index];
                                return Container(
                                  height: 40,
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: 12,
                                      ),
                                      Container(
                                        width: 100,
                                        child: AppComponents.textWithBold(data.name, 12,
                                            color: Colors.black),
                                      ),
                                      Spacer(),
                                      Container(
                                        width: 50,
                                        child: AppComponents.textWithSemiBold(
                                            data.quantity.toString(), 12,
                                            color: Colors.grey),
                                      ),
                                      Spacer(),
                                      Container(
                                        width: 40,
                                        child: AppComponents.textWithSemiBold(
                                            "\$ ${data.price}", 12,
                                            color: AppColors.carrotRed),
                                      ),
                                      SizedBox(
                                        width: 12,
                                      ),
                                    ],
                                  ),
                                );
                              }),
                        )
                      ],
                    ),
                  )),
              Container(
                  margin: EdgeInsets.only(left: 20),
                  child: AppComponents.textWithSemiBold("Total Amount", 16,
                      color: Colors.black)),
              SizedBox(
                height: 16,
              ),
              Container(
                margin: EdgeInsets.only(left: 20, right: 20),
                height: 51,
                child: Card(
                  child: Row(
                    children: [
                      SizedBox(
                        width: 15,
                      ),
                      AppComponents.textWithRegular("Total Price", 13,
                          color: AppColors.grey),
                      Spacer(),
                      AppComponents.textWithBold("\$ ${totalPrice}", 12,
                          color: AppColors.carrotRed),
                      SizedBox(
                        width: 15,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
