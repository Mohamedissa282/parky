import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mypost/pages/Authentification/connexion.dart';
import 'package:mypost/Widget/textFormField.dart';
import 'package:mypost/colors.dart';

class InscriptionPage extends StatefulWidget {
  const InscriptionPage({super.key});

  @override
  State<InscriptionPage> createState() => _InscriptionPageState();
}

class _InscriptionPageState extends State<InscriptionPage> {
  final TextEditingController nomController = new TextEditingController();
  final TextEditingController prenomController = new TextEditingController();
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();
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
                  const Text("Inscription",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 4),
                    const Text("Quelques infos et c'est parti",style: TextStyle(
                        color: ParkyColors.textGrey,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 20),

                     TextformfieldWideget(
                      controller: nomController,
                      hintText: "Entrer votre nom",

                      prefixIcon: Icon(Icons.person),
                    ),
                    const SizedBox(height: 14),

                      TextformfieldWideget(
                      controller: nomController,
                      hintText: "Entrer votre prenom",

                      prefixIcon: Icon(Icons.person_2),
                    ),
                    const SizedBox(height: 14),

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
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: ParkyColors.darkGreen,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(26),
                          ),
                        ),
                        child: Text(
                                'Crer compte',
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
    );
  }
}
