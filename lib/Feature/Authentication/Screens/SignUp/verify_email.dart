import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Feature/Authentication/Screens/Login/login.dart';
import 'package:flutter_application_1/Utils/Helpers/helper_functions.dart';
import 'package:flutter_application_1/Utils/constants/image_strings.dart';
import 'package:flutter_application_1/Utils/constants/sizes.dart';
import 'package:flutter_application_1/Utils/constants/textString.dart';
import 'package:get/get.dart';

class VerifyEmail extends StatelessWidget {
  const VerifyEmail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () {
                Get.offAll(() => const LoginScreen());
              },
              icon: const Icon(CupertinoIcons.clear))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// image
              Image(
                  width: THelperFunctions.screenWidth() * 0.6,
                  image: const AssetImage(TImages.emailValidationimage)),
              const SizedBox(height: TSizes.spaceBtwItems),

              /// Titles and subtitle
              Text(TTexts.confirmEmail,
                  style: Theme.of(context).textTheme.headlineMedium,
                  textAlign: TextAlign.center),
              const SizedBox(height: TSizes.spaceBtwItems),

              Text("support@gmail.com",
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
                    onPressed: () {}, child: Text(TTexts.Continue)),
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                    onPressed: () {}, child: const Text(TTexts.resendEmail)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
