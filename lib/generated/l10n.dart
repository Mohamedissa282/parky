// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Log in to Parky`
  String get PageConnexion1 {
    return Intl.message(
      'Log in to Parky',
      name: 'PageConnexion1',
      desc: '',
      args: [],
    );
  }

  /// `Your car is waiting, we'll handle the rest.`
  String get PageConnexion2 {
    return Intl.message(
      'Your car is waiting, we\'ll handle the rest.',
      name: 'PageConnexion2',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get PageConnexion3 {
    return Intl.message('Login', name: 'PageConnexion3', desc: '', args: []);
  }

  /// `Log in to find your car.`
  String get PageConnexion4 {
    return Intl.message(
      'Log in to find your car.',
      name: 'PageConnexion4',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your email`
  String get PageConnexion5 {
    return Intl.message(
      'Please enter your email',
      name: 'PageConnexion5',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your password`
  String get PageConnexion6 {
    return Intl.message(
      'Please enter your password',
      name: 'PageConnexion6',
      desc: '',
      args: [],
    );
  }

  /// `Password must be at least 6 characters`
  String get PageConnexion7 {
    return Intl.message(
      'Password must be at least 6 characters',
      name: 'PageConnexion7',
      desc: '',
      args: [],
    );
  }

  /// `Forgot password?`
  String get PageConnexion8 {
    return Intl.message(
      'Forgot password?',
      name: 'PageConnexion8',
      desc: '',
      args: [],
    );
  }

  /// `Log in`
  String get PageConnexion9 {
    return Intl.message('Log in', name: 'PageConnexion9', desc: '', args: []);
  }

  /// `Don't have an account yet?`
  String get PageConnexion10 {
    return Intl.message(
      'Don\'t have an account yet?',
      name: 'PageConnexion10',
      desc: '',
      args: [],
    );
  }

  /// `Create an account`
  String get PageConnexion11 {
    return Intl.message(
      'Create an account',
      name: 'PageConnexion11',
      desc: '',
      args: [],
    );
  }

  /// `Incorrect email or password.`
  String get PageConnexion12 {
    return Intl.message(
      'Incorrect email or password.',
      name: 'PageConnexion12',
      desc: '',
      args: [],
    );
  }

  /// `Invalid email address.`
  String get PageConnexion13 {
    return Intl.message(
      'Invalid email address.',
      name: 'PageConnexion13',
      desc: '',
      args: [],
    );
  }

  /// `This account has been disabled.`
  String get PageConnexion14 {
    return Intl.message(
      'This account has been disabled.',
      name: 'PageConnexion14',
      desc: '',
      args: [],
    );
  }

  /// `Invalid email`
  String get PageConnexion15 {
    return Intl.message(
      'Invalid email',
      name: 'PageConnexion15',
      desc: '',
      args: [],
    );
  }

  /// `Invalid password`
  String get PageConnexion16 {
    return Intl.message(
      'Invalid password',
      name: 'PageConnexion16',
      desc: '',
      args: [],
    );
  }

  /// `Create your account`
  String get PageInscription1 {
    return Intl.message(
      'Create your account',
      name: 'PageInscription1',
      desc: '',
      args: [],
    );
  }

  /// `Your car is waiting, we'll handle the rest.`
  String get PageInscription2 {
    return Intl.message(
      'Your car is waiting, we\'ll handle the rest.',
      name: 'PageInscription2',
      desc: '',
      args: [],
    );
  }

  /// `Sign up`
  String get PageInscription3 {
    return Intl.message(
      'Sign up',
      name: 'PageInscription3',
      desc: '',
      args: [],
    );
  }

  /// `A few details and you're set`
  String get PageInscription4 {
    return Intl.message(
      'A few details and you\'re set',
      name: 'PageInscription4',
      desc: '',
      args: [],
    );
  }

  /// `Enter your name`
  String get PageInscription5 {
    return Intl.message(
      'Enter your name',
      name: 'PageInscription5',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your name`
  String get PageInscription6 {
    return Intl.message(
      'Please enter your name',
      name: 'PageInscription6',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your email`
  String get PageInscription7 {
    return Intl.message(
      'Please enter your email',
      name: 'PageInscription7',
      desc: '',
      args: [],
    );
  }

  /// `Invalid email`
  String get PageInscription8 {
    return Intl.message(
      'Invalid email',
      name: 'PageInscription8',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your password`
  String get PageInscription9 {
    return Intl.message(
      'Please enter your password',
      name: 'PageInscription9',
      desc: '',
      args: [],
    );
  }

  /// `Password must be at least 6 characters`
  String get PageInscription10 {
    return Intl.message(
      'Password must be at least 6 characters',
      name: 'PageInscription10',
      desc: '',
      args: [],
    );
  }

  /// `Create an account`
  String get PageInscription11 {
    return Intl.message(
      'Create an account',
      name: 'PageInscription11',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account?`
  String get PageInscription12 {
    return Intl.message(
      'Already have an account?',
      name: 'PageInscription12',
      desc: '',
      args: [],
    );
  }

  /// `Log in`
  String get PageInscription13 {
    return Intl.message(
      'Log in',
      name: 'PageInscription13',
      desc: '',
      args: [],
    );
  }

  /// `Your account was created successfully.`
  String get PageInscription14 {
    return Intl.message(
      'Your account was created successfully.',
      name: 'PageInscription14',
      desc: '',
      args: [],
    );
  }

  /// `This email is already in use. Log in instead.`
  String get PageInscription15 {
    return Intl.message(
      'This email is already in use. Log in instead.',
      name: 'PageInscription15',
      desc: '',
      args: [],
    );
  }

  /// `The email address is not valid.`
  String get PageInscription16 {
    return Intl.message(
      'The email address is not valid.',
      name: 'PageInscription16',
      desc: '',
      args: [],
    );
  }

  /// `Password too weak (6 characters minimum).`
  String get PageInscription17 {
    return Intl.message(
      'Password too weak (6 characters minimum).',
      name: 'PageInscription17',
      desc: '',
      args: [],
    );
  }

  /// `Forgot password`
  String get ChangePassword1 {
    return Intl.message(
      'Forgot password',
      name: 'ChangePassword1',
      desc: '',
      args: [],
    );
  }

  /// `Enter your email, then check your inbox.`
  String get ChangePassword2 {
    return Intl.message(
      'Enter your email, then check your inbox.',
      name: 'ChangePassword2',
      desc: '',
      args: [],
    );
  }

  /// `Reset password`
  String get ChangePassword3 {
    return Intl.message(
      'Reset password',
      name: 'ChangePassword3',
      desc: '',
      args: [],
    );
  }

  /// `Email sent! Check your inbox`
  String get ChangePassword4 {
    return Intl.message(
      'Email sent! Check your inbox',
      name: 'ChangePassword4',
      desc: '',
      args: [],
    );
  }

  /// `Tap here`
  String get HommePage1 {
    return Intl.message('Tap here', name: 'HommePage1', desc: '', args: []);
  }

  /// `Save location`
  String get HommePage2 {
    return Intl.message(
      'Save location',
      name: 'HommePage2',
      desc: '',
      args: [],
    );
  }

  /// `Do you want to save this position?`
  String get HommePage3 {
    return Intl.message(
      'Do you want to save this position?',
      name: 'HommePage3',
      desc: '',
      args: [],
    );
  }

  /// `No`
  String get HommePage4 {
    return Intl.message('No', name: 'HommePage4', desc: '', args: []);
  }

  /// `Success`
  String get HommePage5 {
    return Intl.message('Success', name: 'HommePage5', desc: '', args: []);
  }

  /// `Great! The position was saved successfully.`
  String get HommePage6 {
    return Intl.message(
      'Great! The position was saved successfully.',
      name: 'HommePage6',
      desc: '',
      args: [],
    );
  }

  /// `Yes`
  String get HommePage7 {
    return Intl.message('Yes', name: 'HommePage7', desc: '', args: []);
  }

  /// `Add a photo and a note if you'd like, then save.`
  String get HommePage8 {
    return Intl.message(
      'Add a photo and a note if you\'d like, then save.',
      name: 'HommePage8',
      desc: '',
      args: [],
    );
  }

  /// `e.g. Level 1, spot 34`
  String get HommePage9 {
    return Intl.message(
      'e.g. Level 1, spot 34',
      name: 'HommePage9',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get HommePage10 {
    return Intl.message('Save', name: 'HommePage10', desc: '', args: []);
  }

  /// `Add a photo (optional)`
  String get HommePage11 {
    return Intl.message(
      'Add a photo (optional)',
      name: 'HommePage11',
      desc: '',
      args: [],
    );
  }

  /// `Photo added`
  String get HommePage12 {
    return Intl.message('Photo added', name: 'HommePage12', desc: '', args: []);
  }

  /// `Remove`
  String get HommePage13 {
    return Intl.message('Remove', name: 'HommePage13', desc: '', args: []);
  }

  /// `Photo saved to gallery.`
  String get EnregisPage1 {
    return Intl.message(
      'Photo saved to gallery.',
      name: 'EnregisPage1',
      desc: '',
      args: [],
    );
  }

  /// `Saved location`
  String get EnregisPage2 {
    return Intl.message(
      'Saved location',
      name: 'EnregisPage2',
      desc: '',
      args: [],
    );
  }

  /// `No saved locations.`
  String get EnregisPage3 {
    return Intl.message(
      'No saved locations.',
      name: 'EnregisPage3',
      desc: '',
      args: [],
    );
  }

  /// `No note`
  String get EnregisPage4 {
    return Intl.message('No note', name: 'EnregisPage4', desc: '', args: []);
  }

  /// `Delete`
  String get EnregisPage5 {
    return Intl.message('Delete', name: 'EnregisPage5', desc: '', args: []);
  }

  /// `Are you sure you want to delete this?`
  String get EnregisPage6 {
    return Intl.message(
      'Are you sure you want to delete this?',
      name: 'EnregisPage6',
      desc: '',
      args: [],
    );
  }

  /// `View on map`
  String get EnregisPage7 {
    return Intl.message(
      'View on map',
      name: 'EnregisPage7',
      desc: '',
      args: [],
    );
  }

  /// `No image`
  String get EnregisPage8 {
    return Intl.message('No image', name: 'EnregisPage8', desc: '', args: []);
  }

  /// `Download photo`
  String get EnregisPage9 {
    return Intl.message(
      'Download photo',
      name: 'EnregisPage9',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get SettingPage1 {
    return Intl.message('Settings', name: 'SettingPage1', desc: '', args: []);
  }

  /// `LANGUAGE`
  String get SettingPage2 {
    return Intl.message('LANGUAGE', name: 'SettingPage2', desc: '', args: []);
  }

  /// `English`
  String get SettingPage3 {
    return Intl.message('English', name: 'SettingPage3', desc: '', args: []);
  }

  /// `Log out`
  String get SettingPage4 {
    return Intl.message('Log out', name: 'SettingPage4', desc: '', args: []);
  }

  /// `My car`
  String get LocationPage1 {
    return Intl.message('My car', name: 'LocationPage1', desc: '', args: []);
  }

  /// `parked on`
  String get LocationPage2 {
    return Intl.message('parked on', name: 'LocationPage2', desc: '', args: []);
  }

  /// `Distance is`
  String get LocationPage3 {
    return Intl.message(
      'Distance is',
      name: 'LocationPage3',
      desc: '',
      args: [],
    );
  }

  /// `Choose language`
  String get AccueilPage1 {
    return Intl.message(
      'Choose language',
      name: 'AccueilPage1',
      desc: '',
      args: [],
    );
  }

  /// `French`
  String get AccueilPage2 {
    return Intl.message('French', name: 'AccueilPage2', desc: '', args: []);
  }

  /// `English`
  String get AccueilPage3 {
    return Intl.message('English', name: 'AccueilPage3', desc: '', args: []);
  }

  /// `Never lose your car again`
  String get AccueilPage4 {
    return Intl.message(
      'Never lose your car again',
      name: 'AccueilPage4',
      desc: '',
      args: [],
    );
  }

  /// `One tap to save your spot, and find it again in an instant, wherever you are`
  String get AccueilPage5 {
    return Intl.message(
      'One tap to save your spot, and find it again in an instant, wherever you are',
      name: 'AccueilPage5',
      desc: '',
      args: [],
    );
  }

  /// `Get started`
  String get AccueilPage6 {
    return Intl.message(
      'Get started',
      name: 'AccueilPage6',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'fr'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
