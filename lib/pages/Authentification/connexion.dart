import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:mypost/Provider/UserProvider.dart';
import 'package:mypost/Widget/awsome_dialog.dart';
import 'package:mypost/generated/l10n.dart';
import 'package:mypost/pages/Authentification/forgotPasswordPage.dart';
import 'package:mypost/pages/Authentification/inscription.dart';
import 'package:mypost/Widget/textFormFieldWideget.dart';
import 'package:mypost/colors.dart';
import 'package:mypost/pages/homme.dart';
import 'package:provider/provider.dart';

class ConnexionPage extends StatefulWidget {
  const ConnexionPage({super.key});

  @override
  State<ConnexionPage> createState() => _ConnexionPageState();
}

class _ConnexionPageState extends State<ConnexionPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool _obscurePassword = false;
  bool _isLoading = false;

  GlobalKey<FormState> key = new GlobalKey();

  void login() async {
    try {
      setState(() {
        _isLoading = true;
      });
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
            email: emailController.text.trim(),
            password: passwordController.text.trim(),
          );

      String uui = userCredential.user!.uid;

      context.read<UserProvider>().setId(uui);
      setState(() {
        _isLoading = false;
      });
      Navigator.of(
        context,
      ).push(MaterialPageRoute(builder: (context) => HommePage()));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-credential') {
        ShowDialog(context, S.of(context).PageConnexion12);
       
      } else if (e.code == 'invalid-email') {
        ShowDialog(context, S.of(context).PageConnexion13);
       
        print('Adresse email invalide.');
      } else if (e.code == 'user-disabled') {
         ShowDialog(context, S.of(context).PageConnexion14);
        
      } else {
        print('Erreur de connexion : ${e.code}');
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
                const SizedBox(height: 30),

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
                const SizedBox(height: 27),

                Text(S.of(context).PageConnexion1,
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 6),
                 Text(
                  S.of(context).PageConnexion2,
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
                        S.of(context).PageConnexion3,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        S.of(context).PageConnexion4,
                        style: TextStyle(
                          color: ParkyColors.textGrey,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 20),

                      TextformfieldWideget(
                        obscureText: false,
                        controller: emailController,
                        hintText: "med@gmail.com",

                        prefixIcon: Icon(Icons.email),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return S.of(context).PageConnexion5;
                          }
                          bool email = RegExp(
                            r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$",
                          ).hasMatch(value);
                          if (!email) {
                            return S.of(context).PageConnexion15;
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
                            return S.of(context).PageConnexion6;
                          }
                          if (value.length < 4) {
                            return S.of(context).PageConnexion7;
                          }
                        },
                      ),
                      Align(
                        alignment: AlignmentGeometry.topRight,
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => Forgotpasswordpage(),
                              ),
                            );
                          },
                          child: Text(S.of(context).PageConnexion8),
                        ),
                      ),

                      const SizedBox(height: 18),

                      // Bouton Se connecter
                      SizedBox(
                        width: double.infinity,
                        height: 52,
                        child: ElevatedButton(
                          onPressed: () {
                            if (key.currentState!.validate()) {
                              login();
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
                              : Text(
                                  S.of(context).PageConnexion9,
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
                      S.of(context).PageConnexion10,
                      style: TextStyle(color: ParkyColors.textGrey),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pushReplacement(
                          (MaterialPageRoute(
                            builder: (context) => InscriptionPage(),
                          )),
                        );
                      },
                      child: Text(
                       S.of(context).PageConnexion11,
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
