import 'package:flutter/material.dart';
import 'items.dart';

class SelectedItemsProvider extends ChangeNotifier {
  List<Item> selectedItems = [];

  void addItem(Item item) {
    selectedItems.add(item);
    notifyListeners();
  }

  void removeItem(Item item) {
    selectedItems.remove(item);
    notifyListeners();
  }
}
