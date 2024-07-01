import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/Data/Repository/Repository.Authentication/authentication_repository.dart';
import 'package:flutter_application_1/Feature/Personalization/Controller/user_controller.dart';
import 'package:flutter_application_1/Utils/Helpers/network_manager.dart';
import 'package:flutter_application_1/Utils/PopUp/fullscreen_loader.dart';
import 'package:flutter_application_1/Utils/constants/image_strings.dart';
import 'package:flutter_application_1/Utils/loaders/loaders.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  /// variables
  final localStorage = GetStorage();
  final hidePassword = true.obs;
  final rememberMe = false.obs;
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final usercontroller = Get.put(UserController());

  @override
  void onInit() {
    super.onInit();
    email.text = localStorage.read('REMEMBER_ME_EMAIL');
    password.text = localStorage.read('REMEMBER_ME_PASSWORD');
  }

  /// login with email and password
  Future<void> login() async {
    try {
      // start loading
      TfullScreenLoader.openLoadingDialog(
          'We are processing your information', TImages.loading);

      // check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();

      if (!isConnected) {
        TfullScreenLoader.stopLoading();
        Tloaders.warningSnackBar(title: 'No Internet Connection');
        return;
      }
      // form validation
      if (!loginFormKey.currentState!.validate()) {
        TfullScreenLoader.stopLoading();

        return;
      }
      // if remember me is checked then save email and password in local storage
      if (rememberMe.value) {
        localStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
        localStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
      }
      // login user in with email and password
      final userCredentials = await AuthenticationRepository.instance
          .signInWithEmailAndPassword(email.text.trim(), password.text.trim());

      // remove loader
      TfullScreenLoader.stopLoading();

      //redirect to navigation menu
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      TfullScreenLoader.stopLoading();
      Tloaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }

  Future<void> googleSignIn() async {
    try {
      // start loading
      TfullScreenLoader.openLoadingDialog(
          'We are processing your information', TImages.loading);
      // check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();

      if (!isConnected) {
        TfullScreenLoader.stopLoading();
        Tloaders.warningSnackBar(title: 'No Internet Connection');
        return;
      }
      // google sign in
      final userCredentials =
          await AuthenticationRepository.instance.signInWithGoogle();

      //save user record
      await usercontroller.saveUserRecords(userCredentials);
      // remove loader
      TfullScreenLoader.stopLoading();
      //redirect to navigation menu
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      TfullScreenLoader.stopLoading();
      Tloaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }
}
