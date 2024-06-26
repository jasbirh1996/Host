class MenuResponse {
  String message;
  List<MenuData> data;

  MenuResponse({
    required this.message,
    required this.data,
  });

  factory MenuResponse.fromJson(Map<String, dynamic>? json) => MenuResponse(
    message: json?["message"],
    data: List<MenuData>.from(json?["data"].map((x) => MenuData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class MenuData {
  String id;
  String menuName;
  String fontType;
  List<dynamic> itemImages;
  String fontColor;
  String backgroundImage;
  String currentStatus;
  dynamic catIdByRestaurant;
  List<Category> category;
  List<dynamic> customization;
  String addedBy;
  String ceremony;
  int addedOn;
  int itemPrice;
  String itemInformation;
  bool isActive;
  bool isVej;
  bool isNonVej;
  List<MenuList> menuList;

  MenuData({
    required this.id,
    required this.menuName,
    required this.fontType,
    required this.itemImages,
    required this.fontColor,
    required this.backgroundImage,
    required this.currentStatus,
    required this.catIdByRestaurant,
    required this.category,
    required this.customization,
    required this.addedBy,
    required this.ceremony,
    required this.addedOn,
    required this.itemPrice,
    required this.itemInformation,
    required this.isActive,
    required this.isVej,
    required this.isNonVej,
    required this.menuList,
  });

  factory MenuData.fromJson(Map<String, dynamic> json) => MenuData(
    id: json["_id"],
    menuName: json["menu_name"],
    fontType: json["font_type"],
    itemImages: List<dynamic>.from(json["item_images"].map((x) => x)),
    fontColor: json["font_color"],
    backgroundImage: json["background_image"],
    currentStatus: json["current_status"],
    catIdByRestaurant: json["cat_id_by_restaurant"],
    category: List<Category>.from(json["category"].map((x) => Category.fromJson(x))),
    customization: List<dynamic>.from(json["customization"].map((x) => x)),
    addedBy: json["added_by"],
    ceremony: json["ceremony"],
    addedOn: json["added_on"],
    itemPrice: json["item_price"],
    itemInformation: json["item_information"],
    isActive: json["is_active"],
    isVej: json["is_vej"],
    isNonVej: json["is_non_vej"],
    menuList: List<MenuList>.from(json["menuList"].map((x) => MenuList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "menu_name": menuName,
    "font_type": fontType,
    "item_images": List<dynamic>.from(itemImages.map((x) => x)),
    "font_color": fontColor,
    "background_image": backgroundImage,
    "current_status": currentStatus,
    "cat_id_by_restaurant": catIdByRestaurant,
    "category": List<dynamic>.from(category.map((x) => x.toJson())),
    "customization": List<dynamic>.from(customization.map((x) => x)),
    "added_by": addedBy,
    "ceremony": ceremony,
    "added_on": addedOn,
    "item_price": itemPrice,
    "item_information": itemInformation,
    "is_active": isActive,
    "is_vej": isVej,
    "is_non_vej": isNonVej,
    "menuList": List<dynamic>.from(menuList.map((x) => x.toJson())),
  };
}

class Category {
  String categoryName;
  String categoryImage;
  String catId;
  String menuId;

  Category({
    required this.categoryName,
    required this.categoryImage,
    required this.catId,
    required this.menuId,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    categoryName: json["category_name"],
    categoryImage: json["category_image"],
    catId: json["cat_id"],
    menuId: json["menu_id"],
  );

  Map<String, dynamic> toJson() => {
    "category_name": categoryName,
    "category_image": categoryImage,
    "cat_id": catId,
    "menu_id": menuId,
  };
}

class MenuList {
  String id;
  String categoryName;
  String menuId;
  String addedBy;
  int addedOn;
  String categoryImage;
  bool isActive;
  List<AddedDish> addedDish;

  MenuList({
    required this.id,
    required this.categoryName,
    required this.menuId,
    required this.addedBy,
    required this.addedOn,
    required this.categoryImage,
    required this.isActive,
    required this.addedDish,
  });

  factory MenuList.fromJson(Map<String, dynamic> json) => MenuList(
    id: json["_id"],
    categoryName: json["category_name"],
    menuId: json["menu_id"],
    addedBy: json["added_by"],
    addedOn: json["added_on"],
    categoryImage: json["category_image"],
    isActive: json["is_active"],
    addedDish: List<AddedDish>.from(json["added_dish"].map((x) => AddedDish.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "category_name": categoryName,
    "menu_id": menuId,
    "added_by": addedBy,
    "added_on": addedOn,
    "category_image": categoryImage,
    "is_active": isActive,
    "added_dish": List<dynamic>.from(addedDish.map((x) => x.toJson())),
  };
}

class AddedDish {
  String dishName;
  String addedBy;
  String category;
  int addedOn;
  String dishImage;
  bool isActive;
  int price;
  String description;
  String id;

  AddedDish({
    required this.dishName,
    required this.addedBy,
    required this.category,
    required this.addedOn,
    required this.dishImage,
    required this.isActive,
    required this.price,
    required this.description,
    required this.id,
  });

  factory AddedDish.fromJson(Map<String, dynamic> json) => AddedDish(
    dishName: json["dish_name"],
    addedBy: json["added_by"],
    category: json["category"],
    addedOn: json["added_on"],
    dishImage: json["dish_image"],
    isActive: json["is_active"],
    price: json["price"],
    description: json["description"],
    id: json["_id"],
  );

  Map<String, dynamic> toJson() => {
    "dish_name": dishName,
    "added_by": addedBy,
    "category": category,
    "added_on": addedOn,
    "dish_image": dishImage,
    "is_active": isActive,
    "price": price,
    "description": description,
    "_id": id,
  };
}
