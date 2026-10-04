import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mypost/Provider/car_provider.dart';
import 'package:mypost/Provider/language_provider.dart';
import 'package:mypost/Provider/location_provider.dart';
import 'package:mypost/Provider/user_provider.dart';

import 'package:mypost/firebase_options.dart';
import 'package:mypost/pages/Authentification/auth_gate.dart';
import 'package:mypost/pages/Authentification/connexion_page.dart';
import 'package:mypost/pages/Authentification/inscription_page.dart';
import 'package:mypost/pages/Authentification/acceuil_page.dart';

import 'package:mypost/pages/settings/setting_page.dart';
import 'package:provider/provider.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await dotenv.load(fileName: '.env');
  final prefs = await SharedPreferences.getInstance();
  final dejaVu = prefs.getBool('a_vu_onboarding') ?? false;
  runApp(
    
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => LocationProvider()),
        ChangeNotifierProvider(create: (_) => CarProvider()),
        ChangeNotifierProvider(create: (_) => Languageprovider()),
      ],
      child:  MyApp(
        dejaVuOnboarding: dejaVu
      ),
    ),
  );
}

final user = FirebaseAuth.instance.currentUser;

class MyApp extends StatelessWidget {
  final bool dejaVuOnboarding;
  const MyApp({super.key , required this.dejaVuOnboarding});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: Provider.of<Languageprovider>(context).locale,
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: Authgate(dejaVuOnboarding: dejaVuOnboarding)
    );
  }
}


