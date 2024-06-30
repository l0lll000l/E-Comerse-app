import 'package:flutter/foundation.dart';
import 'package:flutter_application_1/Feature/Authentication/Screens/Login/login.dart';
import 'package:flutter_application_1/Feature/Authentication/Screens/onbording/onbording.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  ///variables
  final deviceStorage = GetStorage();

  /// called from main.dart on app launch

  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  ///function to show onbording screen . once user is logged in.it will never redirect to onbording screen
  screenRedirect() async {
    if (kDebugMode) {
      print('====================== GET STORAGE =====================');
      print(deviceStorage.read('IsFirstTime'));
    }
    deviceStorage.writeIfNull('IsFirstTime', true);
    deviceStorage.read('IsFirstTime') != true
        ? Get.offAll(() => const LoginScreen())
        : Get.offAll(() => const OnbordingScreen());
  }

  /*------------------------------- LOGIN with EMAIL AND PASSWORD  --------------------------------------------*/
}
