import 'package:dotlottie_loader/dotlottie_loader.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Common/widgets/success_screen/Success.dart';
import 'package:flutter_application_1/Feature/Authentication/Screens/Login/login.dart';
import 'package:flutter_application_1/Feature/Authentication/controller/signUp/verify_email_controller.dart';
import 'package:flutter_application_1/Utils/constants/image_strings.dart';
import 'package:flutter_application_1/Utils/constants/sizes.dart';
import 'package:flutter_application_1/Utils/constants/textString.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class VerifyEmail extends StatelessWidget {
  const VerifyEmail({super.key, required this.email});
  final String? email;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VerifyEmailController());
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () {
                Get.to(LoginScreen());
              },
              icon: const Icon(CupertinoIcons.clear))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// image

              DotLottieLoader.fromAsset(TImages.verifying,
                  frameBuilder: (BuildContext ctx, DotLottie? dotlottie) {
                if (dotlottie != null) {
                  return Lottie.memory(dotlottie.animations.values.single,
                      width: 150, height: 210);
                } else {
                  return Container();
                }
              }),

              const SizedBox(height: TSizes.spaceBtwItems),

              /// Titles and subtitle
              Text(TTexts.confirmEmail,
                  style: Theme.of(context).textTheme.headlineMedium,
                  textAlign: TextAlign.center),
              const SizedBox(height: TSizes.spaceBtwItems),

              Text(email!,
                  style: Theme.of(context).textTheme.labelLarge,
                  textAlign: TextAlign.center),
              const SizedBox(height: TSizes.spaceBtwItems),

              /// conform email
              Text(TTexts.confirmEmailSubTitle,
                  style: Theme.of(context).textTheme.labelMedium,
                  textAlign: TextAlign.center),
              const SizedBox(height: TSizes.spaceBtwItems),

              /// Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      Get.to(() => SuccessScreen(
                          image: TImages.success,
                          title: TTexts.yourAccountCreatedTitle,
                          subtitle: TTexts.yourAccountCreatedSubTitle,
                          onpressed: () {
                            controller.checkEmailVerificationStatus();
                          }));
                    },
                    child: const Text(TTexts.Continue)),
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                    onPressed: () {
                      controller.sendEmailVerification();
                    },
                    child: const Text(TTexts.resendEmail)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
