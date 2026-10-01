import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gal/gal.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:mypost/Provider/UserProvider.dart';
import 'package:mypost/Widget/IconContainer.dart';
import 'package:mypost/colors.dart';
import 'package:mypost/pages/Authentification/inscription.dart';
import 'package:mypost/pages/SaveLocationPage.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class HistoriquePage extends StatefulWidget {
  const HistoriquePage({super.key});

  @override
  State<HistoriquePage> createState() => _HistoriquePageState();
}

class _HistoriquePageState extends State<HistoriquePage> {
  bool estLoading = false;
  Stream<QuerySnapshot> getCarSpots(String uui) {
    return FirebaseFirestore.instance
        .collection("users")
        .doc(uui)
        .collection("car_spots")
        .orderBy("date", descending: true)
        .snapshots();
  }

  Future<void> downloadImage(String url) async {
    try {
      setState(() {
        estLoading = true;
      });
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final bytes = response.bodyBytes;
        await Gal.putImageBytes(bytes, album: "MonSpot");

        setState(() {
          estLoading = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.green,
            content: Text(
              "Photo enregistrée dans la galerie",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
      } else {
        print("Erreur téléchargement : ${response.statusCode}");
      }
    } on GalException catch (e) {
      print("Erreur Gal : ${e.type}");
    } catch (e) {
      print("Erreur : $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    final uui = context.read<UserProvider>().uid;
    return Scaffold(
      backgroundColor: ParkyColors.background,
      appBar: AppBar(
        backgroundColor: ParkyColors.background,
        leading: Padding(
          padding: const EdgeInsets.all(11.0),
          child: InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Iconcontainer(
              color: ParkyColors.darkGreen,
              icon: Icons.arrow_back,
              iconColor: ParkyColors.limeGreen,
            ),
          ),
        ),
        title: Text(
          "Enregistrement",
          style: TextStyle(
            color: Colors.black,
            fontSize: 23,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: getCarSpots(uui!),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }

          final docs = snapshot.data!.docs;
          if (docs.isEmpty) {
            return Center(
              child: Text(
                "Aucun enregistrement",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            );
          }

          return ListView.builder(
            itemCount: docs.length,
            itemBuilder: (context, index) {
              final doc = docs[index];
              final data = doc.data() as Map<String, dynamic>;

              final lat = data['lat'];
              final long = data['long'];
              final note = data['note'];
              final date = DateTime.parse(data['date']);
              final image = data['imageUrl'];

              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 7),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10),
                    Container(
                      height: 110,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 13,
                          vertical: 11,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 40,
                                      height: 40,
                                      decoration: BoxDecoration(
                                        color: ParkyColors.darkGreen,
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                      child: const Icon(
                                        Icons.location_on,
                                        color: ParkyColors.limeGreen,
                                        size: 28,
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "${date.day}/${date.month}/${date.year} à ${date.hour}:${date.minute}",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          note.toString().isNotEmpty
                                              ? note
                                              : "Sans note",
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),

                                IconButton(
                                  onPressed: () {
                                    AwesomeDialog(
                                      context: context,
                                      dialogType: DialogType.info,
                                      animType: AnimType.rightSlide,
                                      title: 'Suppression',
                                      desc:
                                          'mohamed vous avez sur pour la suppression ?',
                                      btnCancelOnPress: () {},
                                      btnOkOnPress: () {
                                        FirebaseFirestore.instance
                                            .collection("users")
                                            .doc(uui)
                                            .collection("car_spots")
                                            .doc(doc.id)
                                            .delete();
                                      },
                                      btnOkText: "Oui",
                                      btnCancelText: "Non",
                                    )..show();
                                  },
                                  icon: Icon(Icons.delete),
                                ),
                              ],
                            ),
                            SizedBox(height: 12),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) => Savelocationpage(
                                          lat: lat,
                                          long: long,
                                          date:
                                              "${date.day}/${date.month}/${date.year} à ${date.hour}:${date.minute}",
                                        ),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    margin: EdgeInsets.only(left: 48),
                                    child: Text(
                                      "Voir sur la carte",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                        decoration: TextDecoration.underline,
                                      ),
                                    ),
                                  ),
                                ),

                                (image == null || image.isEmpty)
                                    ? Text(
                                        "Aucune image",
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                        ),
                                      )
                                    : InkWell(
                                        onTap: () {
                                          downloadImage(image);
                                        },
                                        child: estLoading
                                            ? const SizedBox(
                                                width: 20,
                                                height: 20,
                                                child:
                                                    CircularProgressIndicator(
                                                      strokeWidth: 2,
                                                      color:
                                                          ParkyColors.limeGreen,
                                                    ),
                                              )
                                            : Text(
                                                "Télécharger la photo",
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 14,
                                                  decoration:
                                                      TextDecoration.underline,
                                                ),
                                              ),
                                      ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
