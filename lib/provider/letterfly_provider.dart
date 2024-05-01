import 'package:flutter/foundation.dart';

class LetterFlyProvider with ChangeNotifier {
  bool _CategoryViewIsGrid = false;

  bool get CategoryViewIsGrid => _CategoryViewIsGrid;

  set setCategoryViewGrid(val) {
    _CategoryViewIsGrid = val;
    notifyListeners();
  }
}
