import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mypost/Provider/user_provider.dart';
import 'package:mypost/Widget/awsome_dialog.dart';
import 'package:mypost/Widget/text_form_field_wideget.dart';

import 'package:mypost/generated/l10n.dart';
import 'package:mypost/pages/Authentification/connexion_page.dart';

import 'package:mypost/colors.dart';
import 'package:provider/provider.dart';

class InscriptionPage extends StatefulWidget {
  const InscriptionPage({super.key});

  @override
  State<InscriptionPage> createState() => _InscriptionPageState();
}

class _InscriptionPageState extends State<InscriptionPage> {
  GlobalKey<FormState> key = new GlobalKey();
  final TextEditingController nomController = new TextEditingController();
  final TextEditingController prenomController = new TextEditingController();
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();

  bool _isLoading = false;
  bool _obscurePassword = false;
  void Registre() async {
    try {
      setState(() {
        _isLoading = true;
      });
      UserCredential cred = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: emailController.text.trim(),
            password: passwordController.text.trim(),
          );

      String uid = cred.user!.uid;

      await FirebaseFirestore.instance.collection("users").doc(uid).set({
        "nom": nomController.text.trim(),
        "prenom": prenomController.text.trim(),
        "createdAt": FieldValue.serverTimestamp(),
      });

      context.read<UserProvider>().setNom(nomController.text.trim());
      context.read<UserProvider>().setEmail(emailController.text.trim());

      setState(() {
        _isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.green,
          content: Text(
            "Votre compte à été créer avec sucées",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
      );
      await Future.delayed(Duration(seconds: 2));
      Navigator.of(context).pushReplacement(
        (MaterialPageRoute(builder: (context) => ConnexionPage())),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        ShowDialog(
          context,
          S.of(context).PageInscription15,
        );
      } else if (e.code == 'invalid-email') {
        ShowDialog(context, S.of(context).PageInscription16);
      } else if (e.code == 'weak-password') {
        ShowDialog(context, S.of(context).PageInscription17);
      } else {
        print("Erreur : ${e.code}");
      }
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ParkyColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Form(
            key: key,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 15),

                Container(
                  width: 56,
                  height: 56,
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
                const SizedBox(height: 18),

                Text(
                  S.of(context).PageInscription1,
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 6),
                Text(
                 S.of(context).PageInscription2,
                  style: TextStyle(color: ParkyColors.textGrey, fontSize: 15),
                ),
                const SizedBox(height: 24),

                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                       Text(
                       S.of(context).PageInscription3,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                       S.of(context).PageInscription4,
                        style: TextStyle(
                          color: ParkyColors.textGrey,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 20),

                      TextformfieldWideget(
                        controller: nomController,
                        hintText: S.of(context).PageInscription5,
                        obscureText: false,
                        prefixIcon: Icon(Icons.person),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return S.of(context).PageInscription6;
                          }
                        },
                      ),
                      const SizedBox(height: 14),

                      TextformfieldWideget(
                        controller: emailController,
                        hintText: "med@gmail.com",
                        obscureText: false,
                        prefixIcon: Icon(Icons.email),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return S.of(context).PageInscription7;
                          }
                          bool email = RegExp(
                            r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$",
                          ).hasMatch(value);
                          if (!email) {
                            return S.of(context).PageInscription8;
                          }
                        },
                      ),
                      const SizedBox(height: 14),
                      TextformfieldWideget(
                        controller: passwordController,
                        obscureText: !_obscurePassword,
                        hintText: "mot de passe",
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscurePassword
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed: () {
                            setState(() {
                              _obscurePassword = !_obscurePassword;
                            });
                          },
                        ),
                        prefixIcon: Icon(Icons.lock_outline),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return S.of(context).PageInscription9;
                          }

                          if (value.length < 4) {
                            return S.of(context).PageInscription10;
                          }
                        },
                      ),

                      const SizedBox(height: 18),

                      // Bouton Se connecter
                      SizedBox(
                        width: double.infinity,
                        height: 52,
                        child: ElevatedButton(
                          onPressed: () {
                            if (key.currentState!.validate()) {
                              Registre();
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: ParkyColors.darkGreen,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(26),
                            ),
                          ),
                          child: _isLoading
                              ? const SizedBox(
                                  width: 20,
                                  height: 20,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                    color: ParkyColors.limeGreen,
                                  ),
                                )
                              :  Text(
                                 S.of(context).PageInscription11,
                                  style: TextStyle(
                                    color: ParkyColors.limeGreen,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                        ),
                      ),
                      const SizedBox(height: 12),
                    ],
                  ),
                ),
                const SizedBox(height: 35),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      S.of(context).PageInscription12,
                      style: TextStyle(color: ParkyColors.textGrey),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pushReplacement(
                          (MaterialPageRoute(
                            builder: (context) => ConnexionPage(),
                          )),
                        );
                      },
                      child: Text(
                        S.of(context).PageInscription13,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
