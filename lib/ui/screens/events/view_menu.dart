
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:host/ui/screens/events/event_controller.dart';
import 'package:host/ui/screens/events/view_image_dialog.dart';

import '../../../Utils/app_colors.dart';
import '../../../data/ApiEndpoints.dart';
import '../../../utils/AppComponents.dart';
import '../../../utils/AppFonts.dart';
import '../../../utils/AppUtils.dart';
import '../../../utils/CustomDialog.dart';


class MenuView extends StatefulWidget {
  String ceremonyId;
   MenuView({super.key,required this.ceremonyId});

  @override
  State<MenuView> createState() => _MenuState();
}

class _MenuState extends State<MenuView> {
  var controller = Get.put(EventController());
  int _selectedIndex = 0;
  double size = 170;
  TextEditingController searchController = TextEditingController();
  var quantity = 0;
  var totalItems = 0;



  @override
  void initState() {
    controller.getMenu(widget.ceremonyId,callback: (data){
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
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 26,
                ),

                /// top view
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      width: 5,
                    ),
                    InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: AppComponents.backButton()),
                    Spacer(),
                    const Text(
                      "Menu",
                      style: TextStyle(
                          color: Colors.black,

                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                    Spacer(),

                    SizedBox(
                      width: 40,
                    )
                  ],
                ),
                SizedBox(
                  height: 29,
                ),




                SizedBox(
                  height: 17,
                ),

                /// category

                Container(
                  padding: EdgeInsets.only(top: 20,bottom: 20),
                  color: AppColors.bgLightPinkColor,
                  margin: EdgeInsets.only(left: 7),
                  height: 90,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.creatorList.first.menuList.length,
                      itemBuilder: (BuildContext context, int index) {
                        var catData =
                        controller.creatorList.first.menuList[index];
                        return InkWell(
                          onTap: () {
                            setState(() {
                              _selectedIndex = index;
                            });
                          },
                          child: Container(
                              margin: EdgeInsets.only(left: 13),
                              width: 135,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                      color: _selectedIndex == index
                                          ? AppColors.carrotRed
                                          : AppColors.grey)),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 10,
                                  ),
                                  catData.categoryImage.isNotEmpty
                                      ? CachedNetworkImage(
                                    height: 18,
                                    width: 18,
                                    imageUrl: ApiEndPoint.baseUrl +
                                        catData.categoryImage,
                                    placeholder: (context, url) =>
                                        CircularProgressIndicator(),
                                    errorWidget: (context, url, error) =>
                                        Icon(Icons.error),
                                  )
                                      : Icon(
                                    Icons.menu_book,
                                    color: _selectedIndex == index
                                        ? AppColors.carrotRed
                                        : Colors.white60,
                                  ),
                                  SizedBox(
                                    width: 6,
                                  ),
                                  Container(
                                      width: 80,
                                      child: AppComponents.textWithRegular(
                                          AppUtils.capitalizeFirstLetter(
                                              catData.categoryName),
                                          14,
                                          mxline: 1,
                                          color: _selectedIndex == index
                                              ? AppColors.carrotRed
                                              : Colors.black)),
                                  Spacer(),
                                ],
                              )),
                        );
                      }),
                ),
                SizedBox(
                  height: 17,
                ),
                GradientDivider2(),
                SizedBox(
                  height: 17,
                ),

                /// menu item list
                Expanded(
                  child:ListView.builder(
                      itemCount: controller.creatorList.first
                          .menuList[_selectedIndex].addedDish.length,
                      itemBuilder: (BuildContext context, int index) {
                        var itemData = controller.creatorList.first.menuList[_selectedIndex].addedDish[index];
                        var menuId =  controller.creatorList.first.menuList.first.menuId;
                        return Card(
                          color: Colors.white,
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 20, top: 20),
                                height: 94,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    /// item image
                                    itemData.dishImage.isNotEmpty
                                        ? InkWell(
                                      onTap: () {
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return ViewImageDialog(
                                              showGif: true,
                                              gifImage:
                                              ApiEndPoint.baseUrl +
                                                  itemData.dishImage,
                                              label: "",
                                              description: ".",
                                              image: '',
                                              showButton: false,
                                            );
                                          },
                                        );
                                      },
                                      child: Image.network(
                                        ApiEndPoint.baseUrl +
                                            itemData.dishImage,
                                        height: 75,
                                        width: 75,
                                      ),
                                    )
                                        : Container(
                                      height: 75,
                                      width: 75,
                                      color: AppColors.grey,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),

                                    /// item name and description
                                    Expanded(
                                      child:
                                      Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            child: AppComponents.textWithSemiBold(
                                                AppUtils.capitalizeFirstLetter(
                                                    itemData.dishName),
                                                14,color: Colors.black,mxLines: 2),
                                          ),
                                          SizedBox(
                                            height: 4,
                                          ),
                                          Container(

                                              child: AppComponents.textWithRegular(
                                                  itemData.description, 10,
                                                  mxline: 2,
                                                  color: AppColors.grey)),
                                          Container(

                                              child: AppComponents.textWithBold(
                                                "${controller.creatorList.first.currency} "+ itemData.price.toString(), 20,

                                                color: AppColors.carrotRed,)),
                                        ],
                                      ),
                                    ),


                                    /// add to cart button and + - button to add or remove cart based on condition
                                    Container(
                                      margin: EdgeInsets.only(right: 8),
                                      width: 35,
                                      height: 17,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.rectangle,
                                          border: Border.all(
                                              color: Colors.green,
                                              width: 1),
                                          borderRadius:
                                          BorderRadius.circular(2),
                                          color: Colors.white),
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width: 2,
                                          ),
                                          Icon(
                                            Icons.star,
                                            color: Colors.green,
                                            size: 8,
                                          ),
                                          SizedBox(
                                            width: 2,
                                          ),
                                          AppComponents.textWithRegular(
                                              "4.5", 10,
                                              color: Colors.green)
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                  ],
                                ),
                              ),

                            ],
                          ),
                        );
                      })
                ),

                /// added cart items
                totalItems != 0
                    ? Container(
                  margin: EdgeInsets.only(left: 20, bottom: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppComponents.textWithBold(
                          "$totalItems Items Added", 16),
                      SizedBox(
                        height: 6,
                      ),
                      InkWell(
                        onTap: () {

                        },
                        child: Container(
                            width: 79,
                            height: 29,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                gradient: AppUtils.buttonGradient),
                            child: Center(
                              child: AppComponents.textWithRegular(
                                  "View Cart", 14,
                                  color: Colors.white),
                            )),
                      ),
                    ],
                  ),
                )
                    : Container()
              ],
            ),
          ),
        ),

    );
  }
}

class GradientDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: .7,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.carrotRed.withOpacity(.2),
            AppColors.carrotRed,
            AppColors.carrotRed.withOpacity(.2),
          ],
          stops: [0.0, 0.5, 1.0],
        ),
      ),
    );
  }
}

class GradientDivider3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: .7,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.grey.withOpacity(.2),
            AppColors.grey,
            Colors.grey.withOpacity(.2),
          ],
          stops: [0.0, 0.5, 1.0],
        ),
      ),
    );
  }
}

class GradientDivider2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: .7,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.btnGradient,
            AppColors.carrotRed,
            AppColors.btnGradient,
          ],
          stops: [0.0, 0.5, 1.0],
        ),
      ),
    );
  }
}


