import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/Common/widgets/success_screen/Success.dart';
import 'package:flutter_application_1/Data/Repository/Authentication/authentication_repository.dart';
import 'package:flutter_application_1/Utils/constants/image_strings.dart';
import 'package:flutter_application_1/Utils/constants/textString.dart';
import 'package:flutter_application_1/Utils/loaders/loaders.dart';
import 'package:get/get.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();

  /// send email verification
  @override
  void onInit() {
    sendEmailVerification();
    setAutomaticRedirect();
    super.onInit();
  }

  /// send email verification link
  sendEmailVerification() async {
    try {
      await AuthenticationRepository.instance.sendEmailVerification();

      Tloaders.successSnackBar(
          title: 'Email Verification Sent', message: 'Check your email');
    } catch (e) {
      Tloaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  ///timer to automatically redirect on email verification
  setAutomaticRedirect() {
    Timer.periodic(Duration(seconds: 1), (timer) async {
      if (FirebaseAuth.instance.currentUser != null)
        await FirebaseAuth.instance.currentUser!.reload();
      final user = FirebaseAuth.instance.currentUser;

      if (user?.emailVerified ?? false) {
        timer.cancel();
        Get.offAll(() => SuccessScreen(
              image: TImages.success,
              title: TTexts.yourAccountCreatedTitle,
              subtitle: TTexts.yourAccountCreatedSubTitle,
              onpressed: () =>
                  AuthenticationRepository.instance.screenRedirect(),
            ));
      }
    });
  }

  /// Manually check if email verified
  checkEmailVerificationStatus() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null && currentUser.emailVerified) {
      Get.off(() => SuccessScreen(
            image: TImages.loading,
            title: TTexts.yourAccountCreatedTitle,
            subtitle: TTexts.yourAccountCreatedSubTitle,
            onpressed: () => AuthenticationRepository.instance.screenRedirect(),
          ));
    }
  }
}
