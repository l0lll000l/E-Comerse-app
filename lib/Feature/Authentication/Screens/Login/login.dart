import 'package:flutter/material.dart';
import 'package:flutter_application_1/Common/styles/spacing_styles.dart';
import 'package:flutter_application_1/Common/widgets/Login_signup/social_mediaIcon.dart';
import 'package:flutter_application_1/Feature/Authentication/Screens/Login/widgets/loginForm.dart';
import 'package:flutter_application_1/Common/widgets/Login_signup/divider.dart';
import 'package:flutter_application_1/Feature/Authentication/Screens/Login/widgets/logo.dart';
import 'package:flutter_application_1/Utils/Helpers/helper_functions.dart';
import 'package:flutter_application_1/Utils/constants/sizes.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: TSpacingStyle.paddingWithAppBarHeight,
        child: Column(
          children: [
            /// Logo ,title & subttle
            Logo(dark: dark),
            const LoginForm(),

            /// Divider
            const SignInDivider(),
            const SizedBox(height: TSizes.spaceBtwSections),
            const GoogleFaceBookIcon()
          ],
        ),
      ),
    ));
  }
}
