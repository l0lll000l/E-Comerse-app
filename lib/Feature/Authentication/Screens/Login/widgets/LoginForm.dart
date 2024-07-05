import 'package:flutter/material.dart';
import 'package:flutter_application_1/Feature/Authentication/Screens/Forgot_password/forget_password.dart';
import 'package:flutter_application_1/Feature/Authentication/Screens/SignUp/signUp.dart';
import 'package:flutter_application_1/Feature/Authentication/controller/login/login_controller.dart';
import 'package:flutter_application_1/Utils/constants/sizes.dart';
import 'package:flutter_application_1/Utils/constants/textString.dart';
import 'package:flutter_application_1/Utils/validators/validator.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Form(
        key: controller.loginFormKey,
        child: Padding(
          padding:
              const EdgeInsets.symmetric(vertical: TSizes.spaceBtwSections),
          child: Column(
            children: [
              /// email
              TextFormField(
                validator: (value) => TValidator.validateEmail(value),
                controller: controller.email,
                decoration: const InputDecoration(
                  labelText: TTexts.email,
                  prefixIcon: Icon(Iconsax.direct_right),
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwInputFields),

              ///password
              Obx(
                () => TextFormField(
                  validator: (value) =>
                      TValidator.validateName(value, name: 'Password'),
                  obscureText: controller.hidePassword.value,
                  controller: controller.password,
                  decoration: InputDecoration(
                    labelText: TTexts.password,
                    suffixIcon: IconButton(
                        onPressed: () {
                          controller.hidePassword.value =
                              !controller.hidePassword.value;
                        },
                        icon: controller.hidePassword.value
                            ? const Icon(Iconsax.eye_slash)
                            : const Icon(Iconsax.eye)),
                    prefixIcon: const Icon(Iconsax.lock),
                  ),
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwInputFields / 2),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  /// remember me

                  Row(
                    children: [
                      Obx(
                        () => Checkbox(
                          value: controller.rememberMe.value,
                          onChanged: (value) {
                            controller.rememberMe.value = value!;
                          },
                        ),
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
                        controller.login();
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
