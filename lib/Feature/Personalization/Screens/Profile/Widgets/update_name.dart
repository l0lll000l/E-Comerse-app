import 'package:flutter/material.dart';
import 'package:flutter_application_1/Feature/Personalization/Controller/update_neme_controller.dart';
import 'package:flutter_application_1/Utils/constants/sizes.dart';
import 'package:flutter_application_1/Utils/constants/textString.dart';
import 'package:flutter_application_1/Utils/validators/validator.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class UpdateName extends StatelessWidget {
  const UpdateName({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdateNameController());
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Heading
            Text(
              'Change Name',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: TSizes.spaceBtwItems),
            Text(
              TTexts.changeNameSubtitle,
              style: Theme.of(context).textTheme.labelMedium,
            ),
            const SizedBox(height: TSizes.spaceBtwItems),

            /// TextField
            Form(
              key: controller.updateUserNamesFormKey,
              child: Column(
                children: [
                  TextFormField(
                    validator: (value) =>
                        TValidator.validateName(value, name: 'first name'),
                    controller: controller.firstName,
                    decoration: const InputDecoration(
                      labelText: TTexts.firstName,
                      prefixIcon: Icon(Iconsax.direct_right),
                    ),
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  TextFormField(
                    validator: (value) =>
                        TValidator.validateName(value, name: 'first name'),
                    controller: controller.lastName,
                    decoration: const InputDecoration(
                      labelText: TTexts.lastName,
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
                      controller.updateUserNames();
                    },
                    child: const Text(TTexts.submit))),
          ],
        ),
      ),
    );
  }
}
