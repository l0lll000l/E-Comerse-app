import 'package:flutter/material.dart';
import 'package:flutter_application_1/Feature/Authentication/controller/signUp/signup_controller.dart';
import 'package:flutter_application_1/Utils/Helpers/helper_functions.dart';
import 'package:flutter_application_1/Utils/constants/colors.dart';
import 'package:flutter_application_1/Utils/constants/sizes.dart';
import 'package:flutter_application_1/Utils/constants/textString.dart';
import 'package:flutter_application_1/Utils/validators/validator.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    final dark = THelperFunctions.isDarkMode(context);
    return Form(
        key: controller.signupFormKey,
        child: Column(
          children: [
            Row(
              children: [
                //----------------------------------------------------first name
                Expanded(
                  child: TextFormField(
                    controller: controller.firstName,
                    expands: false,
                    decoration: const InputDecoration(
                        labelText: TTexts.firstName,
                        prefixIcon: Icon(Iconsax.user)),
                    validator: (value) =>
                        TValidator.validateName(value, name: 'First Name'),
                  ),
                ),
                const SizedBox(width: TSizes.spaceBtwInputFields),
                //----------------------------------------------------last name
                Expanded(
                  child: TextFormField(
                    controller: controller.lastName,
                    validator: (value) =>
                        TValidator.validateName(value, name: 'Last Name'),
                    expands: false,
                    decoration: const InputDecoration(
                        labelText: TTexts.lastName,
                        prefixIcon: Icon(Iconsax.user)),
                  ),
                ),
              ],
            ),
            const SizedBox(height: TSizes.spaceBtwInputFields),
            //----------------------------------------------------user name
            TextFormField(
              controller: controller.userName,
              validator: (value) =>
                  TValidator.validateName(value, name: 'User Name'),
              expands: false,
              decoration: const InputDecoration(
                  labelText: TTexts.username,
                  prefixIcon: Icon(Iconsax.user_edit)),
            ),
            const SizedBox(height: TSizes.spaceBtwInputFields),
            //----------------------------------------------------email id
            TextFormField(
              controller: controller.email,
              validator: (value) => TValidator.validateEmail(value),
              expands: false,
              decoration: const InputDecoration(
                  labelText: TTexts.email, prefixIcon: Icon(Iconsax.direct)),
            ),
            const SizedBox(height: TSizes.spaceBtwInputFields),
            //---------------------------------------------------- phone number
            TextFormField(
              controller: controller.phone,
              validator: (value) => TValidator.validatePhoneNumber(value),
              expands: false,
              decoration: const InputDecoration(
                  labelText: TTexts.phoneNo, prefixIcon: Icon(Iconsax.call)),
            ),
            const SizedBox(height: TSizes.spaceBtwInputFields),
            //----------------------------------------------------password
            Obx(
              () => TextFormField(
                obscureText: controller.hidePassword.value,
                controller: controller.password,
                validator: (value) => TValidator.validatePassword(value),
                expands: false,
                decoration: InputDecoration(
                    labelText: TTexts.password,
                    suffixIcon: IconButton(
                        onPressed: () {
                          controller.hidePassword.value =
                              !controller.hidePassword.value;
                        },
                        icon: Icon(controller.hidePassword.value
                            ? Iconsax.eye
                            : Iconsax.eye_slash)),
                    prefixIcon: const Icon(Iconsax.password_check)),
              ),
            ),

            /// checkbox ,privacy,policy and terms of use
            Row(
              children: [
                SizedBox(
                  child: Obx(
                    () => Checkbox(
                      value: controller.checkBox.value,
                      onChanged: (value) {
                        controller.checkBox.value = value!;
                      },
                    ),
                  ),
                ),
                Text.rich(TextSpan(children: [
                  TextSpan(
                      text: TTexts.iAgreeTo,
                      style: Theme.of(context).textTheme.bodySmall),
                  TextSpan(
                      text: TTexts.privacyPolicy,
                      style: Theme.of(context).textTheme.bodyMedium!.apply(
                          decorationColor:
                              dark ? TColors.light : TColors.primary,
                          decoration: TextDecoration.underline,
                          color: dark ? TColors.light : TColors.primary)),
                  TextSpan(
                      text: TTexts.and,
                      style: Theme.of(context).textTheme.bodySmall),
                  TextSpan(
                      text: TTexts.termsOfUse,
                      style: Theme.of(context).textTheme.bodyMedium!.apply(
                          decorationColor:
                              dark ? TColors.light : TColors.primary,
                          decoration: TextDecoration.underline,
                          color: dark ? TColors.light : TColors.primary)),
                ]))
              ],
            )
          ],
        ));
  }
}
