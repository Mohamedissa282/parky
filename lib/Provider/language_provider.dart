import 'package:flutter/material.dart';

class Languageprovider with ChangeNotifier {
  Locale _locale = Locale('fr');

  Locale get locale => _locale;

  void changeLangue(String codeLng) {
    _locale = Locale(codeLng);
    notifyListeners();
  }
}
