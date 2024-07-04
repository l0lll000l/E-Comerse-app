import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Feature/Authentication/Screens/Login/login.dart';
import 'package:flutter_application_1/Feature/Authentication/controller/ForgotPassword/forgot_password_controller.dart';
import 'package:flutter_application_1/Utils/Helpers/helper_functions.dart';
import 'package:flutter_application_1/Utils/constants/image_strings.dart';
import 'package:flutter_application_1/Utils/constants/sizes.dart';
import 'package:flutter_application_1/Utils/constants/textString.dart';
import 'package:get/get.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgotPasswordController());
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Get.offAll(() => const LoginScreen());
              },
              icon: const Icon(CupertinoIcons.clear))
        ],
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(
            TSizes.defaultSpace,
          ),
          child: Column(
            children: [
              /// Image width 60% of screen width
              Image(
                  width: THelperFunctions.screenWidth() * 0.6,
                  image: const AssetImage(TImages.googlePay)),
              const SizedBox(height: TSizes.spaceBtwItems),

              /// title
              Text(
                TTexts.changeYourPasswordTitle,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: TSizes.spaceBtwItems),

              /// Subtitle
              Text(
                TTexts.changeYourPasswordSubTitle,
                style: Theme.of(context).textTheme.labelMedium,
              ),
              const SizedBox(height: TSizes.spaceBtwItems),

              /// Button
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {
                        Get.offAll(() => const LoginScreen());
                      },
                      child: const Text(TTexts.done))),
              SizedBox(
                  width: double.infinity,
                  child: TextButton(
                      onPressed: () {
                        controller.resendPasswordResetEmail(
                            controller.email.text.trim());
                      },
                      child: const Text(TTexts.resendEmail))),
            ],
          ),
        ),
      ),
    );
  }
}
