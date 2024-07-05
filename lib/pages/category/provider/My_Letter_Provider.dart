import 'package:Letterfly/components/categoryItem.dart';
import 'package:Letterfly/components/letteritem.dart';
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

  List<Letter> getAllLetters() {
    return folders.expand((folder) => folder.listletter).toList();
  }

  void removeLetterFromAllFolders(String letterId) {
    for (var folder in folders) {
      folder.listletter.removeWhere((letter) => letter.id == letterId);
    }
    notifyListeners();
  }

  void deleteItem(String id) {
    final folderIndex = folders.indexWhere((item) => item.id == id);
    if (folderIndex != -1) {
      folders.removeAt(folderIndex);
      notifyListeners();
    }
  }

  void insertItem(int index, CategoryItem item) {
    folders.insert(index, item);
    notifyListeners();
  }

  void moveLetterToCategory(
      {required String fromCategoryId,
      required String toCategoryId,
      required Letter letter}) {
    final fromCategoryIndex =
        folders.indexWhere((category) => category.id == fromCategoryId);
    final toCategoryIndex =
        folders.indexWhere((category) => category.id == toCategoryId);

    if (fromCategoryIndex != -1 && toCategoryIndex != -1) {
      folders[fromCategoryIndex]
          .listletter
          .removeWhere((l) => l.id == letter.id);
      folders[toCategoryIndex].listletter.add(letter);
      notifyListeners();
    }
  }

  void addLetterToCategory(
      {required String categoryId, required Letter letter}) {
    final categoryIndex =
        folders.indexWhere((category) => category.id == categoryId);
    if (categoryIndex != -1) {
      folders[categoryIndex].listletter.add(letter);
      notifyListeners();
    }
  }

  void addLetterToCategoryByTitle(
      {required String categoryTitle, required Letter letter}) {
    final categoryIndex =
        folders.indexWhere((category) => category.title == categoryTitle);
    if (categoryIndex != -1) {
      folders[categoryIndex].listletter.add(letter);
      notifyListeners();
    } else {
      print('Category with title "$categoryTitle" not found.');
    }
  }
}
