import 'package:get/get.dart';
import 'package:host/utils/api_constants.dart';

class MenuCategoryResponse {
  String? message;
  List<MenuCategoryBean>? data;
  int? stats;

  MenuCategoryResponse({this.message, this.data, this.stats});

  MenuCategoryResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['data'] != null) {
      data = <MenuCategoryBean>[];
      json['data'].forEach((v) {
        data!.add(MenuCategoryBean.fromJson(v));
      });
    }
    stats = json['stats'];
  }
}

class MenuCategoryBean {
  String? categoryName;
  String? categoryImage;
  String? catId;
  String? menuId;
  RxBool isSelected = false.obs;

  MenuCategoryBean(
      {this.categoryName, this.categoryImage, this.catId, this.menuId});

  MenuCategoryBean.fromJson(Map<String, dynamic> json) {
    categoryName = json['category_name'];
    categoryImage = '${ApiConstants.baseUrl}${json['category_image']}';
    catId = json['cat_id'];
    menuId = json['menu_id'];
  }
}
