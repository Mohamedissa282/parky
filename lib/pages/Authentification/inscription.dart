import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mypost/Provider/UserProvider.dart';
import 'package:mypost/Widget/awsome_dialog.dart';
import 'package:mypost/Widget/myButton.dart';
import 'package:mypost/pages/Authentification/connexion.dart';
import 'package:mypost/Widget/textFormFieldWideget.dart';
import 'package:mypost/colors.dart';
import 'package:mypost/pages/historique_page.dart';
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
          "Cet email est déjà utilisé. Connecte-toi à la place.",
        );
      } else if (e.code == 'invalid-email') {
        ShowDialog(context, "L'adresse email n'est pas valide.");
      } else if (e.code == 'weak-password') {
        ShowDialog(context, "Mot de passe trop faible (6 caractères minimum).");
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

                const Text(
                  'Créer votre compte',
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 6),
                const Text(
                  "Votre voiture vous attend, on s'occupe du reste.",
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
                      const Text(
                        "Inscription",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        "Quelques infos et c'est parti",
                        style: TextStyle(
                          color: ParkyColors.textGrey,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 20),

                      TextformfieldWideget(
                        controller: nomController,
                        hintText: "Entrer votre nom",
                        obscureText: false,
                        prefixIcon: Icon(Icons.person),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Veuillez entrer votre nom";
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
                            return "Veuillez entrer votre email";
                          }
                          bool email = RegExp(
                            r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$",
                          ).hasMatch(value);
                          if (!email) {
                            return "Email not valide";
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
                            return "Veuillez entrer votre mot de passe";
                          }

                          if (value.length < 4) {
                            return "Le mot de passe doit contenir au moins 4 caractères";
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
                              : const Text(
                                  'Créer un compte',
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
                    const Text(
                      'Avez-vous déja compte ?',
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
                      child: const Text(
                        'Se connecter',
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
