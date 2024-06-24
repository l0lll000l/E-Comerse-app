import 'package:flutter/material.dart';
import 'package:flutter_application_1/Feature/Authentication/Screens/Forgot_password/forget_password.dart';
import 'package:flutter_application_1/Feature/Authentication/Screens/SignUp/signUp.dart';
import 'package:flutter_application_1/Navigation_menu.dart';
import 'package:flutter_application_1/Utils/constants/sizes.dart';
import 'package:flutter_application_1/Utils/constants/textString.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Padding(
      padding: const EdgeInsets.symmetric(vertical: TSizes.spaceBtwSections),
      child: Column(
        children: [
          TextFormField(
            decoration: const InputDecoration(
              labelText: TTexts.email,
              prefixIcon: Icon(Iconsax.direct_right),
            ),
          ),
          const SizedBox(height: TSizes.spaceBtwInputFields),
          TextFormField(
            decoration: const InputDecoration(
              labelText: TTexts.password,
              suffixIcon: Icon(Iconsax.eye_slash),
              prefixIcon: Icon(Iconsax.lock),
            ),
          ),
          const SizedBox(height: TSizes.spaceBtwInputFields / 2),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              /// remember me

              Row(
                children: [
                  Checkbox(
                    value: true,
                    onChanged: (value) {},
                  ),
                  const Text(TTexts.rememberMe)
                ],
              ),

              /// forget password
              TextButton(
                  onPressed: () {
                    Get.to(() => const ForgetPassword());
                  },
                  child: const Text(TTexts.forgetPassword))
            ],
          ),
          const SizedBox(height: TSizes.spaceBtwItems),
          //sign in
          SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                  onPressed: () {
                    Get.to(() => const NavigationMenu());
                  },
                  child: const Text(TTexts.signin))),
          const SizedBox(height: TSizes.spaceBtwItems),
          //create account
          SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                  onPressed: () {
                    Get.to(() => const SignUpScreen());
                  },
                  child: const Text(TTexts.createAccount)))
        ],
      ),
    ));
  }
}