import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mypost/Provider/language_provider.dart';
import 'package:mypost/Widget/my_button.dart';
import 'package:mypost/generated/l10n.dart';
import 'package:mypost/pages/Authentification/connexion_page.dart';
import 'package:provider/provider.dart';

class Acceuilpage extends StatefulWidget {
  const Acceuilpage({super.key});

  @override
  State<Acceuilpage> createState() => _AcceuilpageState();
}

class _AcceuilpageState extends State<Acceuilpage> {
  void afficherChoixLangue() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (ctx) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                S.of(context).AccueilPage1,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 8),
              ListTile(
                leading: Icon(Icons.language),
                title: Text(
                  S.of(context).AccueilPage2,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                trailing:
                    Provider.of<Languageprovider>(
                          context,
                        ).locale.languageCode ==
                        "fr"
                    ? Icon(Icons.check,color :Colors.green)
                    : null,
                onTap: () {
                  Provider.of<Languageprovider>(context, listen: false).changeLangue('fr');
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading:  Icon(Icons.language),
                title: Text(
                  S.of(context).AccueilPage3,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                trailing:
                    Provider.of<Languageprovider>(
                          context,
                        ).locale.languageCode ==
                        "en"
                    ? Icon(Icons.check,color :Colors.green)
                    : null,
                onTap: () {
                  Provider.of<Languageprovider>(
                    context,
                    listen: false,
                  ).changeLangue('en');
                   Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 8),
          child: Stack(
            children: [
              Column(
                children: [
                  const SizedBox(height: 33),
                  Lottie.asset('images/animation.json'),
                   SizedBox(height: 70),
                   Center(
                    child: Text(
                      S.of(context).AccueilPage4,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 23,
                      ),
                    ),
                  ),
                   SizedBox(height: 11),
                   Text(
                    S.of(context).AccueilPage5,
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 80),
                  Mybutton(
                    text: S.of(context).AccueilPage6,
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => ConnexionPage(),
                        ),
                      );
                    },
                  ),
                ],
              ),

              // icône de langue, en haut à droite
              Positioned(
                top: 0,
                right: 0,
                child: IconButton(
                  icon: const Icon(Icons.language, color: Colors.black),
                  onPressed: afficherChoixLangue,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
