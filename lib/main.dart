import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Data/Repository/Repository.Authentication/authentication_repository.dart';
import 'package:flutter_application_1/app.dart';
import 'package:flutter_application_1/firebase_options.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  //Todo: add widgets binding
  final WidgetsBinding widgetbinding =
      WidgetsFlutterBinding.ensureInitialized();
  //Todo: add widgets storage
  await GetStorage.init();
  //Todo: add widgets splash
  FlutterNativeSplash.preserve(widgetsBinding: widgetbinding);

  /// --initialize firebase and authentication repository
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then((FirebaseApp value) => Get.put(AuthenticationRepository()));

  runApp(const MyApp());
}
