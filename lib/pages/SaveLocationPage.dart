import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mypost/Provider/LocationProvider.dart';
import 'package:mypost/Widget/IconContainer.dart';
import 'package:mypost/Widget/containerPageSaveLocation.dart';
import 'package:mypost/Widget/myContainerWideget.dart';
import 'package:mypost/colors.dart';
import 'package:provider/provider.dart';

class Savelocationpage extends StatefulWidget {
  final double lat;
  final double long;
  final String date;
  const Savelocationpage({
    super.key,
    required this.lat,
    required this.long,
    required this.date,
  });

  @override
  State<Savelocationpage> createState() => _SavelocationpageState();
}

class _SavelocationpageState extends State<Savelocationpage> {
  double lat1 = 0.0;
  double lang1 = 0.0;

  double distanceKm = 0;
  double walkingMinutes = 0;
  double carMinutes = 0;
  double bikeMinutes = 0;

  GoogleMapController? mapController1;
  Set<Marker> markers = {};

   void initState() {
    super.initState();
    calculDistance();
  }

  // fonction pour calculer la distance
  void calculDistance() {
    final userLat = context.read<LocationProvider>().userLat;
    final userLong = context.read<LocationProvider>().userLang;

    final carLat = widget.lat;
    final carLong = widget.long;

    double metres = Geolocator.distanceBetween(
      userLat,
      userLong,

      carLat,
      carLong,
    );
    distanceKm = metres / 1000;
    walkingMinutes = (distanceKm / 5) * 60;
    carMinutes = (distanceKm / 40) * 60;
    bikeMinutes = (distanceKm / 15) * 60;

    setState(() {
      
    });
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
      body: Scaffold(
        body: Stack(
          children: [
            GoogleMap(
              initialCameraPosition: CameraPosition(
                target: LatLng(lat1, lang1),
              ),
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
                        Navigator.of(context).pop();
                      },
                      child: Iconcontainer(
                        color: ParkyColors.darkGreen,
                        icon: Icons.arrow_back,
                        iconColor: ParkyColors.limeGreen,
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
              child: Container(
                height: 240,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              color: ParkyColors.darkGreen,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Icon(
                              Icons.location_on,
                              color: ParkyColors.limeGreen,
                              size: 28,
                            ),
                          ),
                          SizedBox(width: 13),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Ma voiture",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                              Text(
                                "garée le ${widget.date}",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 25),

                      Text(
                        "La distance est ${distanceKm.toStringAsFixed(2)} km",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      SizedBox(height: 20),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Containerpagesavelocation(
                            color: ParkyColors.darkGreen,
                            colorIcon: ParkyColors.limeGreen,
                            icon: Icons.directions_car,
                            text: "${carMinutes.toStringAsFixed(2)} min",
                          ),
                          //SizedBox(width: 13,),
                          Containerpagesavelocation(
                            color: ParkyColors.background,
                            colorIcon: Colors.black,
                            icon: Icons.directions_bike,
                            text: "${bikeMinutes.toStringAsFixed(2)} min",
                          ),
                          // SizedBox(width: 13,),
                          Containerpagesavelocation(
                            color: ParkyColors.background,
                            colorIcon: Colors.black,
                            icon: Icons.directions_walk,
                            text: "${walkingMinutes.toStringAsFixed(2)} min",
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
