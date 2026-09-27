import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class UserProvider with ChangeNotifier {
  String? uid;

  setId(String id) {
    uid = id;
    notifyListeners();
  }
}
