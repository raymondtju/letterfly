import 'package:Letterfly/components/letteritem.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class LetterFlyProvider with ChangeNotifier {
  String _Username = '';
  String get Username => _Username;

  set setUsername(val) {
    _Username = val;
    notifyListeners();
  }

  String _Email = '';
  String get Email => _Email;

  set setEmail(val) {
    _Email = val;
    notifyListeners();
  }

  String _Password = '';
  String get Password => _Password;

  set setPassword(val) {
    _Password = val;
    notifyListeners();
  }

  bool _CategoryViewIsGrid = false;
  bool get CategoryViewIsGrid => _CategoryViewIsGrid;

  set setCategoryViewGrid(val) {
    _CategoryViewIsGrid = val;
    notifyListeners();
  }

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
  List get Letters => _letters;
  int get LetterCounts => _letters.length;

  void setLetters(Letter letter) {
    _letters.add(letter);
    notifyListeners();
  }

  void clearTempPhoto() {
    TempPhoto.clear();
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
