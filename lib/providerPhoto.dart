import 'package:flutter/material.dart';

class ProviderPage extends ChangeNotifier {
  List<String> TempPhoto = [];

  void addPhoto(String value) {
    TempPhoto.add(value);
    notifyListeners();
  }

  String? TempSignature;

  void addSignature(String value) {
    TempSignature = value;
    notifyListeners();
  }
}
