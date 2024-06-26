import 'package:host/utils/api_constants.dart';

class MenuItemListResponse {
  String? message;
  List<MenuItemBean>? data;
  int? stats;

  MenuItemListResponse({this.message, this.data, this.stats});

  MenuItemListResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['data'] != null) {
      data = <MenuItemBean>[];
      json['data'].forEach((v) {
        data!.add(new MenuItemBean.fromJson(v));
      });
    }
    stats = json['stats'];
  }
}

class MenuItemBean {
  String? dishName;
  String? addedBy;
  String? category;
  int? addedOn;
  String? dishImage;
  bool? isActive;
  int? price;
  String? description;
  String? sId;

  MenuItemBean(
      {this.dishName,
      this.addedBy,
      this.category,
      this.addedOn,
      this.dishImage,
      this.isActive,
      this.price,
      this.description,
      this.sId});

  MenuItemBean.fromJson(Map<String, dynamic> json) {
    dishName = json['dish_name'];
    addedBy = json['added_by'];
    category = json['category'];
    addedOn = json['added_on'];
    dishImage = '${ApiConstants.baseUrl}${json['dish_image']}';
    isActive = json['is_active'];
    price = json['price'];
    description = json['description'];
    sId = json['_id'];
  }
}
