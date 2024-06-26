import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/app.dart';
import 'package:flutter_application_1/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  //Todo: add widgets binding
  //Todo: add widgets storage
  //Todo: add widgets splash
  //Todo: add widgets firebase
  //Todo: add widgets authentication

  runApp(const MyApp());
}
