import 'dart:async';
import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart' hide SafeArea;
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mypost/Provider/location_provider.dart';
import 'package:mypost/Provider/user_provider.dart';
import 'package:mypost/Widget/Icon_container.dart';
import 'package:mypost/Widget/my_container_wideget.dart';
import 'package:mypost/colors.dart';
import 'package:mypost/generated/l10n.dart';
import 'package:mypost/pages/Authentification/connexion_page.dart';
import 'package:mypost/pages/historique/historique_page.dart';

import 'package:mypost/pages/settings/setting_page.dart';
import 'package:provider/provider.dart';

class HommePage extends StatefulWidget {
  const HommePage({super.key});

  @override
  State<HommePage> createState() => _HommePageState();
}

class _HommePageState extends State<HommePage> {
  // gerer l'ajoutation d'une photo
  File? _image;
  bool hasPhoto = false;
  final picker = ImagePicker();

  // fonction pour l'ajoute d'une photo
  Future<void> _pickPhoto() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
        hasPhoto = true;
        print(
          "################################################################"
          "Photo sélectionnée : ${_image!.path}",
        );
      });
    }
  }

  // fonction pour ajouter la photo dans firebase storage
  Future<String?> uploadPhoto(File? image) async {
    if (image == null) return null;

    try {
      final storageRef = FirebaseStorage.instance.ref().child(
        "car_photos/${DateTime.now().millisecondsSinceEpoch}.jpg",
      );

      await storageRef.putFile(image);

      return await storageRef.getDownloadURL();
    } catch (e) {
      print("Erreur upload photo: $e");
      return null;
    }
  }

  // fonction pour suppression d'une photos
  void _removePhoto() {
    setState(() {
      _image = null;
      hasPhoto = false;
    });
  }

  // ajouter les donnees dans firestore
  Future<void> addPositionCar(
    BuildContext context,
    String note,
    File? image,
  ) async {
    try {
      final uid = context.read<UserProvider>().uid;
      final lat = context.read<LocationProvider>().userLat;
      final long = context.read<LocationProvider>().userLang;

      if (uid == null || lat == null || long == null) {
        print("les donnes sont vide");
      }
      final imageUrl = await uploadPhoto(image);

      final docs = await FirebaseFirestore.instance
          .collection("users")
          .doc(uid)
          .collection("car_spots")
          .add({
            "lat": lat,
            "long": long,
            "note": note,
            "date": DateTime.now().toIso8601String(),
            "imageUrl": imageUrl,
          });

      print("Voiture enregistrée avec ID : ${docs.id}");
      print("Image reçue dans addPositionCar: $image");
    } catch (e) {
      print(e);
    }
  }

  double lat1 = 0.0;
  double lang1 = 0.0;
  String? nom;
  String? email;
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
    nom = context.watch<UserProvider>().UserName;
    email = context.watch<UserProvider>().UserEmail;
    markers = {
      Marker(
        markerId: MarkerId("user_position"),
        position: LatLng(lat1, lang1),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
      ),
    };
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: CameraPosition(
              target: LatLng(lat1, lang1),
            zoom: 15,
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => Settingpage(),
                            ),
                          );
                        },
                        child: Iconcontainer(
                          color: Colors.white,
                          icon: Icons.person,
                          iconColor: Colors.black,
                        ),
                      ),
                    ],
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
                           S.of(context).HommePage1,
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

          AnimatedPositioned(
            duration: const Duration(milliseconds: 150),
            curve: Curves.easeOut,
            left: 10,
            right: 10,
            bottom: 20 + MediaQuery.of(context).viewInsets.bottom,
            child: Mycontainerwideget(
              hasPhoto: hasPhoto,
              onPickPhoto: _pickPhoto,
              onRemovePhoto: _removePhoto,
              controller: noteController,
              onPressed: () {
                AwesomeDialog(
                  context: context,
                  dialogType: DialogType.info,
                  animType: AnimType.rightSlide,
                  title:  S.of(context).HommePage2,
                  desc: S.of(context).HommePage3,
                  btnCancelText: S.of(context).HommePage4,
                  btnCancelOnPress: () {},
                  btnOkOnPress: () {
                    addPositionCar(context, noteController.text.trim(), _image);
                    noteController.clear();
                    hasPhoto = false;
                    AwesomeDialog(
                      context: context,
                      dialogType: DialogType.success,
                      animType: AnimType.rightSlide,
                      title: S.of(context).HommePage5,
                      desc:
                          S.of(context).HommePage6,

                      btnOkOnPress: () {},
                    )..show();
                  },
                  btnOkText: S.of(context).HommePage7,
                )..show();
              },
            ),
          ),
        ],
      ),
    );
  }
}
