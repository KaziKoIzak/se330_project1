import 'package:flutter/material.dart';
import 'items.dart';

class SelectedItemsProvider extends ChangeNotifier {
  List<Item> _selectedItems = [];

  List<Item> get selectedItems => _selectedItems;

  void addItem(Item item) {
    // Check if the item already exists in the list
    int existingIndex = _selectedItems.indexWhere((existingItem) =>
        existingItem.name == item.name && existingItem.price == item.price);

    if (existingIndex != -1) {
      // If the item already exists, increment the quantity
      _selectedItems[existingIndex].quantity += 1;
    } else {
      // If the item doesn't exist, add it to the list
      _selectedItems.add(item);
    }

    notifyListeners();
  }

  void removeItem(Item item) {
    _selectedItems.remove(item);
    notifyListeners();
  }
}
