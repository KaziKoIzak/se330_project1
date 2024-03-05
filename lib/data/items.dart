import 'dart:ffi';

enum ItemType {
  room,
  wine,
  charcuterie,
}

class Item {
  ItemType itemType;
  String name;
  int quantity;
  Float price;

  Item({
    required this.itemType,
    required this.name,
    required this.quantity,
    required this.price,
  });
}
