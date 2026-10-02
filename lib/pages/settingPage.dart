import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mypost/Provider/languageProvider.dart';
import 'package:mypost/Widget/IconContainer.dart';
import 'package:mypost/colors.dart';
import 'package:mypost/generated/l10n.dart';
import 'package:mypost/pages/Authentification/connexion.dart';
import 'package:provider/provider.dart';

class Settingpage extends StatefulWidget {
  const Settingpage({super.key});

  @override
  State<Settingpage> createState() => _SettingpageState();
}

class _SettingpageState extends State<Settingpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ParkyColors.darkGreen,
      appBar: AppBar(
        backgroundColor: ParkyColors.darkGreen,
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
          S.of(context).SettingPage1,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 50),
            Column(
              children: [
                Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    color: ParkyColors.limeGreen,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Center(
                    child: Text(
                      "MI",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 8),
                Text(
                  "Mohamed Issa",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  "mohamed@gmail.com",
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            SizedBox(height: 25),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(17),
                    topRight: Radius.circular(17),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 18,
                    vertical: 24,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            S.of(context).SettingPage2,
                            style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                          SizedBox(height: 13),
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
                                ? Icon(Icons.check, color: Colors.green,)
                                : null,
                            onTap: () {
                              Provider.of<Languageprovider>(
                                context,
                                listen: false,
                              ).changeLangue('fr');
                              
                            },
                          ),
                          ListTile(
                            leading: Icon(Icons.language),
                            title: Text(
                              S.of(context).AccueilPage3,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            trailing:
                                Provider.of<Languageprovider>(
                                      context,
                                    ).locale.languageCode ==
                                    "en"
                                ? Icon(Icons.check, color :Colors.green)
                                : null,
                            onTap: () {
                              Provider.of<Languageprovider>(
                                context,
                                listen: false,
                              ).changeLangue('en');
                              
                            },
                          ),
                        ],
                      ),

                      SizedBox(height: 100),
                      InkWell(
                        onTap: () {
                          FirebaseAuth.instance.signOut();
                          Navigator.of(context).pushReplacement(
                            (MaterialPageRoute(
                              builder: (context) => ConnexionPage(),
                            )),
                          );
                        },
                        child: Container(
                          height: 60,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(11),
                          ),
                          //  margin: EdgeInsets.only(left: 40),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.logout, color: Colors.red[800]),
                              SizedBox(width: 8),
                              Text(
                                S.of(context).SettingPage4,
                                style: TextStyle(
                                  color: Colors.red[800],
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
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
          ],
        ),
      ),
    );
  }
}
