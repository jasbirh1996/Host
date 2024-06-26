
class TableOrderResponse {
  String message;
  List<TableOrderData> data;

  TableOrderResponse({
    required this.message,
    required this.data,
  });

  factory TableOrderResponse.fromJson(Map<String, dynamic> ?json) => TableOrderResponse(
    message: json?["message"],
    data: List<TableOrderData>.from(json?["data"].map((x) => TableOrderData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class TableOrderData {
  String menuType;
  String restaurantId;
  String orderId;
  String userName;
  String placedBy;
  int addedOn;
  String tableId;
  String userId;
  dynamic ceremonyId;
  String type;
  int amount;
  String orderStatus;
  String tableName;
  String tableNumber;
  bool isAccepted;
  bool isRejected;
  String id;
  List<ItemList> itemList;

  TableOrderData({
    required this.menuType,
    required this.restaurantId,
    required this.orderId,
    required this.userName,
    required this.placedBy,
    required this.addedOn,
    required this.tableId,
    required this.userId,
    required this.ceremonyId,
    required this.type,
    required this.amount,
    required this.orderStatus,
    required this.tableName,
    required this.tableNumber,
    required this.isAccepted,
    required this.isRejected,
    required this.id,
    required this.itemList,
  });

  factory TableOrderData.fromJson(Map<String, dynamic> json) => TableOrderData(
    menuType: json["menu_type"],
    restaurantId: json["restaurant_id"],
    orderId: json["orderId"],
    userName: json["user_name"],
    placedBy: json["placed_by"],
    addedOn: json["added_on"],
    tableId: json["table_id"],
    userId: json["user_id"],
    ceremonyId: json["ceremony_id"],
    type: json["type"],
    amount: json["amount"],
    orderStatus: json["order_status"],
    tableName: json["table_name"],
    tableNumber: json["table_number"],
    isAccepted: json["is_accepted"],
    isRejected: json["is_rejected"],
    id: json["_id"],
    itemList: List<ItemList>.from(json["item_list"].map((x) => ItemList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "menu_type": menuType,
    "restaurant_id": restaurantId,
    "orderId": orderId,
    "user_name": userName,
    "placed_by": placedBy,
    "added_on": addedOn,
    "table_id": tableId,
    "user_id": userId,
    "ceremony_id": ceremonyId,
    "type": type,
    "amount": amount,
    "order_status": orderStatus,
    "table_name": tableName,
    "table_number": tableNumber,
    "is_accepted": isAccepted,
    "is_rejected": isRejected,
    "_id": id,
    "item_list": List<dynamic>.from(itemList.map((x) => x.toJson())),
  };
}

class ItemList {
  String menuId;
  List<Item> items;
  String id;

  ItemList({
    required this.menuId,
    required this.items,
    required this.id,
  });

  factory ItemList.fromJson(Map<String, dynamic> json) => ItemList(
    menuId: json["menu_id"],
    items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
    id: json["_id"],
  );

  Map<String, dynamic> toJson() => {
    "menu_id": menuId,
    "items": List<dynamic>.from(items.map((x) => x.toJson())),
    "_id": id,
  };
}

class Item {
  String itemId;
  String name;
  int quantity;
  int price;
  dynamic customization;

  Item({
    required this.itemId,
    required this.name,
    required this.quantity,
    required this.price,
    required this.customization,
  });

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    itemId: json["item_id"],
    name: json["name"],
    quantity: json["quantity"],
    price: json["price"],
    customization: json["customization"],
  );

  Map<String, dynamic> toJson() => {
    "item_id": itemId,
    "name": name,
    "quantity": quantity,
    "price": price,
    "customization": customization,
  };
}
