import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mypost/Provider/UserProvider.dart';
import 'package:mypost/pages/Authentification/inscription.dart';
import 'package:mypost/Widget/textFormField.dart';
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
  bool _obscurePassword = true;
  bool _isLoading = false;

  void login() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
            email: emailController.text.trim(),
            password: passwordController.text.trim(),
          );

      String uui = userCredential.user!.uid;
      context.read<UserProvider>().setId(uui);

      Navigator.of(
        context,
      ).push(MaterialPageRoute(builder: (context) => HommePage()));
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ParkyColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
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

              const Text(
                'Connectez-vous à Parky',
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
                      'Connexion',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'Connectez-vous pour retrouver votre voiture.',
                      style: TextStyle(
                        color: ParkyColors.textGrey,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 20),

                    TextformfieldWideget(
                      controller: emailController,
                      hintText: "med@gmail.com",

                      prefixIcon: Icon(Icons.email),
                    ),
                    const SizedBox(height: 14),
                    TextformfieldWideget(
                      controller: passwordController,

                      hintText: "••••••••",
                      prefixIcon: Icon(Icons.lock_outline),
                    ),

                    const SizedBox(height: 18),

                    // Bouton Se connecter
                    SizedBox(
                      width: double.infinity,
                      height: 52,
                      child: ElevatedButton(
                        onPressed: () {
                          login();
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
                                'Se connecter',
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
                    'Pas encore de compte ?',
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
                    child: const Text(
                      'Créer un compte',
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
    );
  }
}
