import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter/material.dart';

class OnboardingProvider with ChangeNotifier {
  bool _dejaVu;
  OnboardingProvider(this._dejaVu);

  bool get dejaVu => _dejaVu;

  Future<void> marquerCommeVu() async {
    _dejaVu = true;
    notifyListeners();
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('a_vu_onboarding', true);
  }
}