class OrderDetailsModel {
  final String itemQuantity, itemName, itemPrice;
  List<OrderDetailsSubItemsModel> subItems;

  OrderDetailsModel({
    required this.itemQuantity,
    required this.itemName,
    required this.itemPrice,
    required this.subItems,
  });
}

class OrderDetailsSubItemsModel {
  final String itemName, itemPrice;

  OrderDetailsSubItemsModel({
    required this.itemName,
    required this.itemPrice,
  });
}
