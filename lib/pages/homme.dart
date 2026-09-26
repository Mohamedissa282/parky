import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mypost/colors.dart';

class HommePage extends StatefulWidget {
  const HommePage({super.key});

  @override
  State<HommePage> createState() => _HommePageState();
}

class _HommePageState extends State<HommePage> {
  double lat1 = 0.0;
  double lang1 = 0.0;
  GoogleMapController? mapController1;
  StreamSubscription<Position>? positionStream;
  Future<void> getCurrentPosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      print("Not enable");
      return;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Erreur!');
      }
    }
    if (permission == LocationPermission.whileInUse) {
      positionStream = Geolocator.getPositionStream().listen((
        Position? position,
      ) {
        setState(() {
          lat1 = position!.latitude;
          lang1 = position.longitude;
        });
      });
    }
  }

  void initState() {
    getCurrentPosition();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HommePage"),
        backgroundColor: ParkyColors.limeGreen,
      ),

      body: Container(
        child: Column(
          children: [
            Expanded(
              child: GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: LatLng(lat1, lang1),
                ),
                onMapCreated: (mapController) {
                  mapController1 = mapController;
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
