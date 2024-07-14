import 'package:flutter/material.dart';
import 'package:flutter_application_1/Utils/constants/image_strings.dart';
import 'package:flutter_application_1/Utils/constants/sizes.dart';
import 'package:flutter_application_1/Utils/constants/textString.dart';

class Logo extends StatelessWidget {
  const Logo({
    super.key,
    required this.dark,
  });

  final bool dark;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(
            height: 150,
            image: AssetImage(dark ? TImages.applogo : TImages.applogo)),
        Text(TTexts.loginTitle, style: Theme.of(context).textTheme.bodyMedium),
        const SizedBox(height: TSizes.sm),
        Text(TTexts.LoginSubTitle,
            style: Theme.of(context).textTheme.bodyMedium)
      ],
    );
  }
}
