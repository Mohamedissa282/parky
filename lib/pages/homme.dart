import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mypost/Provider/LocationProvider.dart';
import 'package:mypost/Provider/UserProvider.dart';
import 'package:mypost/colors.dart';
import 'package:provider/provider.dart';

class HommePage extends StatefulWidget {
  const HommePage({super.key});

  @override
  State<HommePage> createState() => _HommePageState();
}

class _HommePageState extends State<HommePage> {
  double lat1 = 0.0;
  double lang1 = 0.0;

  GoogleMapController? mapController1;
  void initState() {
    context.read<LocationProvider>().getCurrentPosition();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    lat1 = context.read<LocationProvider>().userLat;
    lang1 = context.read<LocationProvider>().userLang;
    return Scaffold(

      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: CameraPosition(target: LatLng(lat1, lang1)),
           
          ),

          SafeArea(child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: ParkyColors.darkGreen,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Icon(
                    Icons.directions_car_filled,
                    color: ParkyColors.limeGreen,
                    size: 28,
                  ),
                ),
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Icon(
                    Icons.directions_car_filled,
                    color: ParkyColors.limeGreen,
                    size: 28,
                  ),
                ),
              ],
            ),
          )),

          Positioned(
            left: 20,
            right: 20,
            bottom: 20, 
            child: Container(
              height: 150,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18)
              ),
              child: Column(
                children: [
                  Text("Ou avez-vous garé votre voiture ?", style: TextStyle(
                    color: Colors.black , fontWeight: FontWeight.bold, fontSize: 17
                  ),),
                  Text("On enregistre ta position en un tap", style: TextStyle(
                    color: Colors.grey , fontWeight: FontWeight.bold, fontSize: 13
                  ),),

                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
