import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mypost/Provider/CarProvider.dart';
import 'package:mypost/Provider/LocationProvider.dart';
import 'package:mypost/Provider/UserProvider.dart';
import 'package:mypost/Provider/languageProvider.dart';
import 'package:mypost/firebase_options.dart';
import 'package:mypost/pages/Authentification/connexion.dart';
import 'package:mypost/pages/Authentification/inscription.dart';
import 'package:mypost/pages/acceuilPage.dart';
import 'package:mypost/pages/homme.dart';
import 'package:mypost/pages/loading.dart';
import 'package:mypost/pages/settingPage.dart';
import 'package:provider/provider.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'generated/l10n.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
 
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
   await dotenv.load(fileName: '.env');
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => LocationProvider()),
        ChangeNotifierProvider(create: (_) => CarProvider()),
        ChangeNotifierProvider(create: (_)=> Languageprovider())
      ],
      child: const MyApp(),
    ),
  );
}

final user = FirebaseAuth.instance.currentUser;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
      home: Acceuilpage());
  }
}


/* StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
           builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
          }

         if (snapshot.hasData) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
                final user = FirebaseAuth.instance.currentUser;
                  if (user != null) {
                  context.read<UserProvider>().setId(user.uid);
                }
        });

      return HommePage();
    }

     return ConnexionPage();
  },
    ));*/