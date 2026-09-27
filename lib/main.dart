import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mypost/Provider/CarProvider.dart';
import 'package:mypost/Provider/LocationProvider.dart';
import 'package:mypost/Provider/UserProvider.dart';
import 'package:mypost/firebase_options.dart';
import 'package:mypost/pages/Authentification/connexion.dart';
import 'package:mypost/pages/Authentification/inscription.dart';
import 'package:mypost/pages/acceuilPage.dart';
import 'package:mypost/pages/homme.dart';
import 'package:mypost/pages/loading.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => LocationProvider()),
        ChangeNotifierProvider(create: (_) => CarProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: Acceuilpage()
    );
  }
}