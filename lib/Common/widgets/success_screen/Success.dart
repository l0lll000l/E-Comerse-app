import 'package:flutter/material.dart';
import 'package:flutter_application_1/Common/styles/spacing_styles.dart';
import 'package:flutter_application_1/Utils/Helpers/helper_functions.dart';
import 'package:flutter_application_1/Utils/constants/sizes.dart';
import 'package:flutter_application_1/Utils/constants/textString.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen(
      {super.key,
      required this.image,
      required this.title,
      required this.subtitle,
      this.onpressed});
  final String image, title, subtitle;
  final VoidCallback? onpressed;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight * 2,
          child: Column(
            children: [
              /// image
              Image(
                  width: THelperFunctions.screenWidth() * 0.6,
                  image: AssetImage(image)),
              const SizedBox(height: TSizes.spaceBtwItems),

              /// Titles and subtitle
              Text(title,
                  style: Theme.of(context).textTheme.headlineMedium,
                  textAlign: TextAlign.center),
              const SizedBox(height: TSizes.spaceBtwItems),

              /// conform email
              Text(subtitle,
                  style: Theme.of(context).textTheme.labelMedium,
                  textAlign: TextAlign.center),
              const SizedBox(height: TSizes.spaceBtwItems),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: onpressed, child: Text(TTexts.Continue)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
