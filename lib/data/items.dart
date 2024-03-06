import 'dart:ffi';

enum ItemType {
  room,
  wine,
  charcuterie,
  discount,
}

class Item {
  ItemType itemType;
  String name;
  int quantity;
  double price;

  Item({
    required this.itemType,
    required this.name,
    required this.quantity,
    required this.price,
  });
}
