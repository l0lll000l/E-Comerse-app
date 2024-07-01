import 'package:flutter/material.dart';
import 'package:flutter_application_1/Utils/Helpers/network_manager.dart';
import 'package:flutter_application_1/Utils/PopUp/fullscreen_loader.dart';
import 'package:flutter_application_1/Utils/constants/image_strings.dart';
import 'package:flutter_application_1/Utils/loaders/loaders.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  /// variables
  final hidePassword = true.obs;
  final checkBox = true.obs;
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final userName = TextEditingController();
  final phone = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();

  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  /// signup with email and password
  Future<void> signUp() async {
    try {
      // ----------------------------------------------------------------------start loading
      TfullScreenLoader.openLoadingDialog(
          'We are processing your information', TImages.loading);

      // ----------------------------------------------------------------------check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      print(isConnected);
      if (!isConnected) {
        // TfullScreenLoader.stopLoading();
        return;
      }
      // ----------------------------------------------------------------------form validation
      if (signupFormKey.currentState!.validate()) {
        // TfullScreenLoader.stopLoading();
        return;
      }

      // privacy policy checks
      if (!checkBox.value) {
        Tloaders.warningSnackBar(
            title: 'Please Accept Privacy Policy',
            message:
                'In order to create an account,you must have to accept Terms of use and Privacy Policy');
        return;
      }
      // Register user in firebase and save user data in firestore

      // save authenticated user in firebase firestore

      // Show success message

      // move to verify email screen
    } catch (e) {
      // show some error message
      Tloaders.errorSnackBar(message: e.toString(), title: 'oh snap!');
    } finally {
      //remove error
      TfullScreenLoader.stopLoading();
    }
  }
}
