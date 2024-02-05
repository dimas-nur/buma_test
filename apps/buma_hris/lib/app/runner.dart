import 'package:core/di/locator.dart';
import 'package:core/flavor/flavor_config.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:intl/intl.dart';

import 'buma_hris_app.dart';

import '../config/firebase/firebase_options_dev.dart' as firebase_dev;
import '../config/firebase/firebase_options_prod.dart' as firebase_prod;
import '../config/firebase/firebase_options_stg.dart' as firebase_staging;

/// Runs the application with the given environment.
Future<void> run(String env) async {
  WidgetsFlutterBinding.ensureInitialized();

  await _initFirebase(env);
  await configureDependencies(env);

  _initLocale();

  runApp(const BumaHrisApp());
}

Future<void> _initFirebase(String env) async {
  final firebaseOptions = env == Flavor.production.name
      ? firebase_prod.DefaultFirebaseOptions.currentPlatform
      : env == Flavor.staging.name
          ? firebase_staging.DefaultFirebaseOptions.currentPlatform
          : firebase_dev.DefaultFirebaseOptions.currentPlatform;

  await Firebase.initializeApp(options: firebaseOptions);
}

void _initLocale() {
  Intl.defaultLocale = 'id';
  ValidationBuilder.setLocale('id');
}
