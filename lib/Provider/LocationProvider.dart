import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LocationProvider with ChangeNotifier {
  double userLat = 0.0;
  double userLang = 0.0;

  StreamSubscription<Position>? positionStream;

  Future<void> getCurrentPosition() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      print("Service de localisation désactivé");
      return;
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        print("Permission refusée");
        return;
      }
    }
  
    positionStream = Geolocator.getPositionStream().listen((Position? position) {
      userLat = position!.latitude;
      userLang = position.longitude;
      notifyListeners();
    });
  }

  @override
  void dispose() {
    positionStream?.cancel();
    super.dispose();
  }
}

