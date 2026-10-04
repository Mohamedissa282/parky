import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class UserProvider with ChangeNotifier {
  String? uid;
  String? UserName;
  String? UserEmail;
  setId(String id) {
    uid = id;
    notifyListeners();
  }

  setNom(String nom) {
    UserName = nom;
    notifyListeners();
  }

  setEmail(String email) {
    UserEmail = email;
    notifyListeners();
  }
}
