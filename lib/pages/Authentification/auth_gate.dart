import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart';
import 'package:mypost/Provider/onboarding_provider.dart';
import 'package:mypost/Provider/user_provider.dart';
import 'package:mypost/pages/Authentification/connexion_page.dart';
import 'package:mypost/pages/Authentification/acceuil_page.dart';
import 'package:mypost/pages/home/homme_page.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Authgate extends StatelessWidget {
  const Authgate({super.key});

 

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        if (snapshot.hasData) {
          WidgetsBinding.instance.addPostFrameCallback((_) async {
            final user = FirebaseAuth.instance.currentUser;
            if (user == null) return;

            final docs = await FirebaseFirestore.instance
                .collection('users')
                .doc(user.uid)
                .get();

            if (!context.mounted) return;

            final nom = docs.data()?['nom'] ?? '';

            context.read<UserProvider>().setId(user.uid);
            context.read<UserProvider>().setEmail(user.email ?? '');
            context.read<UserProvider>().setNom(nom);

           
          });
          return const HommePage();
        }

        final dejaVu = context.watch<OnboardingProvider>().dejaVu;

      return  dejaVu ? const ConnexionPage() : const Acceuilpage();
      },
    );
  }
}
