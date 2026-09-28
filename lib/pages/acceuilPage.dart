import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mypost/Widget/myButton.dart';
import 'package:mypost/pages/Authentification/connexion.dart';

class Acceuilpage extends StatefulWidget {
  const Acceuilpage({super.key});

  @override
  State<Acceuilpage> createState() => _AcceuilpageState();
}

class _AcceuilpageState extends State<Acceuilpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 8),
        child: Column(
          children: [
            SizedBox(height: 33),
            Lottie.asset('images/animation.json'),
            SizedBox(height: 70),
            Center(
              child: Text(
                "Ne perds plus jamias ta voiture",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 23,
                ),
              ),
            ),
            SizedBox(height: 11),
            Text(
              "Un tap pour enregistrer ta place, et retrouve-la en un instant, ou que tu sois",
              style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 80),
            Mybutton(
              text: "Commencer",
              onPressed: () {
             Navigator.of(context).pushReplacement(
                  (MaterialPageRoute(builder: (context) => ConnexionPage())),
                );
                
              },
            ),
          ],
        ),
      ),
    );
  }
}
