import 'package:flutter/material.dart';
import 'package:mypost/colors.dart';
import 'package:mypost/pages/Authentification/inscription.dart';

class HistoriquePage extends StatefulWidget {
  const HistoriquePage({super.key});

  @override
  State<HistoriquePage> createState() => _HistoriquePageState();
}

class _HistoriquePageState extends State<HistoriquePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ParkyColors.background,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsGeometry.symmetric(vertical: 14, horizontal: 10),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Historique",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 17),
                Container(
                  height: 120,
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
                                SizedBox(width: 8),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "26/09 à 18:42",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "Niveau -2, place 34",
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
                              onPressed: () {},
                              icon: Icon(Icons.delete),
                            ),
                          ],
                        ),
                        SizedBox(height: 12),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).pushReplacement(
                              (MaterialPageRoute(
                                builder: (context) => InscriptionPage(),
                              )),
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
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
