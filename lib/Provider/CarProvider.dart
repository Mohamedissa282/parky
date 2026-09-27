import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class CarProvider extends ChangeNotifier {
  double? latCard;
  double? longCard;
  String? Carnote;
  String? Carid;

  setPosition({
    required double lat,
    required double long,
    String? note,
    String? id,
  }) {
    latCard = lat;
    longCard = long;
    Carnote = note;
    Carid = id;

    notifyListeners();
  }
}
