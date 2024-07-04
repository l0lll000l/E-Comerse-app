import 'package:flutter/material.dart';
import 'package:flutter_application_1/Data/Repository/Authentication/authentication_repository.dart';
import 'package:flutter_application_1/Feature/Personalization/Controller/user_controller.dart';
import 'package:flutter_application_1/Utils/constants/sizes.dart';
import 'package:flutter_application_1/Utils/constants/textString.dart';
import 'package:flutter_application_1/Utils/validators/validator.dart';
import 'package:iconsax/iconsax.dart';

class ReAuthenticateUser extends StatelessWidget {
  const ReAuthenticateUser({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Heading
            Text(
              'Delete Account',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: TSizes.spaceBtwItems),
            Text(
              'Enter your email and password to re-authenticate your account',
              style: Theme.of(context).textTheme.labelMedium,
            ),
            const SizedBox(height: TSizes.spaceBtwItems),

            /// TextField
            Form(
              key: controller.reAuthFormKey,
              child: Column(
                children: [
                  TextFormField(
                    validator: (value) => TValidator.validateEmail(value),
                    controller: controller.verifyEmail,
                    decoration: const InputDecoration(
                      labelText: TTexts.email,
                      prefixIcon: Icon(Iconsax.direct_right),
                    ),
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  TextFormField(
                    validator: (value) =>
                        TValidator.validateName(value, name: 'Password'),
                    controller: controller.verifyPassword,
                    decoration: const InputDecoration(
                      labelText: TTexts.password,
                      prefixIcon: Icon(Iconsax.direct_right),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwItems),

            /// Submit buttton
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      controller.reAuthEmailAndPassword();
                    },
                    child: const Text(TTexts.submit))),
          ],
        ),
      ),
    );
  }
}
