import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mypost/Provider/LocationProvider.dart';
import 'package:mypost/Provider/UserProvider.dart';
import 'package:mypost/Widget/IconContainer.dart';
import 'package:mypost/Widget/myButton.dart';
import 'package:mypost/Widget/myContainerWideget.dart';
import 'package:mypost/colors.dart';
import 'package:mypost/pages/historique_page.dart';
import 'package:provider/provider.dart';

class HommePage extends StatefulWidget {
  const HommePage({super.key});

  @override
  State<HommePage> createState() => _HommePageState();
}

class _HommePageState extends State<HommePage> {
  Future<void> addPositionCar(BuildContext context, String note) async {
    try {
      final uid = context.read<UserProvider>().uid;
      final lat = context.read<LocationProvider>().userLat;
      final long = context.read<LocationProvider>().userLang;

      if (uid == null || lat == null || long == Null) {
        print("les donnes sont vide");
      }

      final docs = await FirebaseFirestore.instance
          .collection("users")
          .doc(uid)
          .collection("car_spots")
          .add({
            "lat": lat,
            "long": long,
            "note": note,
            "Date": DateTime.now().toIso8601String(),
          });

      print("Voiture enregistrée avec ID : ${docs.id}");
    } catch (e) {
      print(e);
    }
  }

  double lat1 = 0.0;
  double lang1 = 0.0;

  Set<Marker> markers = {};
  TextEditingController noteController = TextEditingController();

  GoogleMapController? mapController1;

  bool intialise = false;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if (!intialise) {
      context.read<LocationProvider>().getCurrentPosition();
      intialise = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    lat1 = context.watch<LocationProvider>().userLat;
    lang1 = context.watch<LocationProvider>().userLang;

    markers = {
      Marker(
        markerId: MarkerId("user_position"),
        position: LatLng(lat1, lang1),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
      ),
    };
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: CameraPosition(target: LatLng(lat1, lang1)),
            onMapCreated: (controller) => {mapController1 = controller},

            markers: markers,
            myLocationEnabled: true,
          ),

          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(9.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => HistoriquePage(),
                        ),
                      );
                    },
                    child: Iconcontainer(
                      color: ParkyColors.darkGreen,
                      icon: Icons.directions_car_filled,
                      iconColor: ParkyColors.limeGreen,
                    ),
                  ),
                  SizedBox(height: 6),
                  Container(
                    height: 30,
                    width: 115,
                    decoration: BoxDecoration(
                      color: ParkyColors.darkGreen,
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.keyboard_arrow_up,
                          color: ParkyColors.limeGreen,
                        ),
                        SizedBox(width: 5),
                        Text(
                          "Clique Ici",
                          style: TextStyle(
                            color: ParkyColors.limeGreen,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          Positioned(
            left: 10,
            right: 10,
            bottom: 20,
            child: Mycontainerwideget(
              controller: noteController,
              onPressed: () {
                addPositionCar(context, noteController.text.trim());
                noteController.clear();
              },
            ),
          ),
        ],
      ),
    );
  }
}
