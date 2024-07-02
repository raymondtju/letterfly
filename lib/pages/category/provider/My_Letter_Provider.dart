import 'package:Letterfly/components/categoryItem.dart';
import 'package:flutter/material.dart';

class MyLetterProvider with ChangeNotifier {
  bool _CategoryViewIsGrid = false;
  bool get CategoryViewIsGrid => _CategoryViewIsGrid;
  int folderlastid = 0;
  List<CategoryItem> folders = [];

  set setCategoryViewGrid(val) {
    _CategoryViewIsGrid = val;
    notifyListeners();
  }

  void addItem({required String title, String? id}) {
    folderlastid++;
    final newFolder = CategoryItem(
      id: id ??
          folderlastid.toString(), // Use provided ID or generate a new one
      title: title,
      listletter: [],
    );
    folders.add(newFolder);
    notifyListeners();
  }

  void deleteItem(String id) {
    folders.removeWhere((item) => item.id == id);
    notifyListeners();
  }

  void insertItem(int index, CategoryItem item) {
    folders.insert(index, item);
    notifyListeners();
  }
}
