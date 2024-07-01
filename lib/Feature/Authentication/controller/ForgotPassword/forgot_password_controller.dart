import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/Data/Repository/Repository.Authentication/authentication_repository.dart';
import 'package:flutter_application_1/Feature/Authentication/Screens/Forgot_password/resetPassword.dart';
import 'package:flutter_application_1/Utils/PopUp/fullscreen_loader.dart';
import 'package:flutter_application_1/Utils/constants/image_strings.dart';
import 'package:get/get.dart';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/Utils/Helpers/network_manager.dart';
import 'package:flutter_application_1/Utils/loaders/loaders.dart';

class ForgotPasswordController extends GetxController {
  static ForgotPasswordController get instance => Get.find();

  final email = TextEditingController();
  GlobalKey<FormState> forgotPasswordFormKey = GlobalKey<FormState>();

  /// send reset password email
  sendPasswordResetEmail() async {
    try {
      TfullScreenLoader.openLoadingDialog(
          'We are processing your information', TImages.loading);

      // check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();

      if (!isConnected) {
        TfullScreenLoader.stopLoading();
        Tloaders.warningSnackBar(title: 'No Internet Connection');
        return;
      } // form validation
      if (!forgotPasswordFormKey.currentState!.validate()) {
        TfullScreenLoader.stopLoading();

        return;
      }
      // send reset password email
      await AuthenticationRepository.instance
          .sendPasswordResetEmail(email.text.trim());
      // stop loading
      TfullScreenLoader.stopLoading();
      // show success snackbar
      Tloaders.successSnackBar(
          title: 'Email Sent',
          message: 'Check your email for resetting your password');
      Get.to(() => const ResetPassword());
    } catch (e) {
      TfullScreenLoader.stopLoading();
      Tloaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  /// resend reset password email
  resendPasswordResetEmail(String email) async {
    try {
      TfullScreenLoader.openLoadingDialog(
          'We are processing your information', TImages.loading);

      // check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();

      if (!isConnected) {
        TfullScreenLoader.stopLoading();
        Tloaders.warningSnackBar(title: 'No Internet Connection');
        return;
      } // send reset password email
      await AuthenticationRepository.instance.sendPasswordResetEmail(email);
      // remove loader
      TfullScreenLoader.stopLoading();
      // show success snackbar
      Tloaders.successSnackBar(
          title: 'Email Sent',
          message: 'Check your email for resetting your password');
    } catch (e) {
      TfullScreenLoader.stopLoading();
      Tloaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
