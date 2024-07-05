import 'dart:io';

import 'package:Letterfly/components/letteritem.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class LetterFlyProvider with ChangeNotifier {
  String _username = '';
  String get username => _username;

  set setUsername(val) {
    _username = val;
    notifyListeners();
  }

  String _email = '';
  String get email => _email;

  set setEmail(val) {
    _email = val;
    notifyListeners();
  }

  String _password = '';
  String get password => _password;

  set setPassword(val) {
    _password = val;
    notifyListeners();
  }

  File? _imageProfile;
  File? get imageProfile => _imageProfile;

  set setImageProfile(File? value) {
    _imageProfile = value;
    notifyListeners();
  }

  bool _categoryViewIsGrid = false;
  bool get categoryViewIsGrid => _categoryViewIsGrid;

  set setCategoryViewGrid(val) {
    _categoryViewIsGrid = val;
    notifyListeners();
  }

  List<String> tempPhoto = [];

  void addPhoto(String value) {
    tempPhoto.add(value);
    notifyListeners();
  }

  String? tempSignature;

  void addSignature(String value) {
    tempSignature = value;
    notifyListeners();
  }

  String? _otp;
  String? get otp => _otp;

  set setOTP(String? value) {
    _otp = value;
    notifyListeners();
  }

  bool _switchThemeto = false;
  bool get switchThemeto => _switchThemeto;
  set setSwitchThemeto(bool val) {
    _switchThemeto = val;
    notifyListeners();
  }

  List<Letter> _letters = [];
  List get letters => _letters;
  int get letterCounts => _letters.length;

  void setLetters(Letter letter) {
    _letters.add(letter);
    notifyListeners();
  }

  void clearTempPhoto() {
    tempPhoto.clear();
    notifyListeners();
  }

  bool _selectedChipSuratKuasa = false;
  bool get selectedChipSuratKuasa => _selectedChipSuratKuasa;
  set setSelectedChipSuratKuasa(bool val) {
    _selectedChipSuratKuasa = val;
    notifyListeners();
  }

  bool _selectedChipSuratAjaib = false;
  bool get selectedChipSuratAjaib => _selectedChipSuratAjaib;
  set setSelectedChipSuratAjaib(bool val) {
    _selectedChipSuratAjaib = val;
    notifyListeners();
  }

  void editLetter(Letter updatedLetter) {
    final index =
        _letters.indexWhere((letter) => letter.id == updatedLetter.id);
    if (index != -1) {
      _letters[index] = updatedLetter;
      notifyListeners();
    }
  }

  void removeLetter(Letter letter) {
    _letters.remove(letter);
    notifyListeners();
  }
}
