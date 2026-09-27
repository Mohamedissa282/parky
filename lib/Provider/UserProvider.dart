import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class UserProvider with ChangeNotifier {
  String? uid;
  String? UserName;
  setId(String id) {
    uid = id;
    notifyListeners();
  }

  setNom(String nom) {
    UserName = nom;
  }
}
