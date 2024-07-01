import 'package:flutter/material.dart';
import 'package:flutter_application_1/Common/widgets/Login_signup/divider.dart';
import 'package:flutter_application_1/Common/widgets/Login_signup/social_mediaIcon.dart';
import 'package:flutter_application_1/Feature/Authentication/Screens/SignUp/verify_email.dart';
import 'package:flutter_application_1/Feature/Authentication/Screens/SignUp/widgets/sign_upform.dart';
import 'package:flutter_application_1/Feature/Authentication/controller/signUp/signup_controller.dart';
import 'package:flutter_application_1/Utils/constants/sizes.dart';
import 'package:flutter_application_1/Utils/constants/textString.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// title

              Text(TTexts.signupTitle,
                  style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: TSizes.spaceBtwSections),

              /// Signup form
              const SignUpForm(),
              const SizedBox(height: TSizes.spaceBtwInputFields),

              /// signup button
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {
                        controller.signUp();
                      },
                      child: const Text(TTexts.createAccount))),
              const SizedBox(height: TSizes.spaceBtwInputFields),

              /// divider
              const SignInDivider(),
              const SizedBox(height: TSizes.spaceBtwInputFields),

              /// social buttons

              const GoogleFaceBookIcon()
            ],
          ),
        ),
      ),
    );
  }
}
