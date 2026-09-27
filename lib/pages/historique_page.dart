import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mypost/Provider/UserProvider.dart';
import 'package:mypost/Widget/IconContainer.dart';
import 'package:mypost/colors.dart';
import 'package:mypost/pages/Authentification/inscription.dart';
import 'package:provider/provider.dart';

class HistoriquePage extends StatefulWidget {
  const HistoriquePage({super.key});

  @override
  State<HistoriquePage> createState() => _HistoriquePageState();
}

class _HistoriquePageState extends State<HistoriquePage> {
  Stream<QuerySnapshot> getCarSpots(String uui) {
    return FirebaseFirestore.instance
        .collection("users")
        .doc(uui)
        .collection("car_spots")
        .orderBy("Date", descending: true)
        .snapshots();
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
            return Center(child: Text("Aucun enregistrement"));
          }

          return ListView.builder(
            itemCount: docs.length,
            itemBuilder: (context, index) {
              final doc = docs[index];
              final data = doc.data() as Map<String, dynamic>;

              final lat = data['lat'];
              final long = data['long'];
              final note = data['note'];
              final date = DateTime.parse(data['Date']);

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
                                    FirebaseFirestore.instance
                                        .collection("users")
                                        .doc(uui)
                                        .collection("car_spots")
                                        .doc(doc.id)
                                        .delete();
                                  },
                                  icon: Icon(Icons.delete),
                                ),
                              ],
                            ),
                            SizedBox(height: 12),
                            InkWell(
                              onTap: () {
                                print("######################################");
                                print("latitude est : ${lat}");
                                print("longtude est : ${long}");
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
