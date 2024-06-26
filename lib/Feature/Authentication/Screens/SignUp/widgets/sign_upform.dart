import 'package:flutter/material.dart';
import 'package:flutter_application_1/Utils/Helpers/helper_functions.dart';
import 'package:flutter_application_1/Utils/constants/colors.dart';
import 'package:flutter_application_1/Utils/constants/sizes.dart';
import 'package:flutter_application_1/Utils/constants/textString.dart';
import 'package:iconsax/iconsax.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Form(
        child: Column(
      children: [
        Row(
          children: [
            //----------------------------------------------------first name
            Expanded(
              child: TextFormField(
                expands: false,
                decoration: const InputDecoration(
                    labelText: TTexts.firstName,
                    prefixIcon: Icon(Iconsax.user)),
              ),
            ),
            const SizedBox(width: TSizes.spaceBtwInputFields),
            //----------------------------------------------------lat name
            Expanded(
              child: TextFormField(
                expands: false,
                decoration: const InputDecoration(
                    labelText: TTexts.lastName, prefixIcon: Icon(Iconsax.user)),
              ),
            ),
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwInputFields),
        //----------------------------------------------------user name
        TextFormField(
          expands: false,
          decoration: const InputDecoration(
              labelText: TTexts.username, prefixIcon: Icon(Iconsax.user_edit)),
        ),
        const SizedBox(height: TSizes.spaceBtwInputFields),
        //----------------------------------------------------email name
        TextFormField(
          expands: false,
          decoration: const InputDecoration(
              labelText: TTexts.email, prefixIcon: Icon(Iconsax.direct)),
        ),
        const SizedBox(height: TSizes.spaceBtwInputFields),
        //---------------------------------------------------- phone number
        TextFormField(
          expands: false,
          decoration: const InputDecoration(
              labelText: TTexts.phoneNo, prefixIcon: Icon(Iconsax.call)),
        ),
        const SizedBox(height: TSizes.spaceBtwInputFields),
        //----------------------------------------------------password
        TextFormField(
          expands: false,
          decoration: const InputDecoration(
              labelText: TTexts.password,
              suffixIcon: Icon(Iconsax.eye_slash),
              prefixIcon: Icon(Iconsax.password_check)),
        ),
        Row(
          children: [
            SizedBox(
              child: Checkbox(
                value: true,
                onChanged: (value) {},
              ),
            ),
            Text.rich(TextSpan(children: [
              TextSpan(
                  text: '${TTexts.iAgreeTo}',
                  style: Theme.of(context).textTheme.bodySmall),
              TextSpan(
                  text: '${TTexts.privacyPolicy}',
                  style: Theme.of(context).textTheme.bodyMedium!.apply(
                      decorationColor: dark ? TColors.light : TColors.primary,
                      decoration: TextDecoration.underline,
                      color: dark ? TColors.light : TColors.primary)),
              TextSpan(
                  text: '${TTexts.and}',
                  style: Theme.of(context).textTheme.bodySmall),
              TextSpan(
                  text: '${TTexts.termsOfUse}',
                  style: Theme.of(context).textTheme.bodyMedium!.apply(
                      decorationColor: dark ? TColors.light : TColors.primary,
                      decoration: TextDecoration.underline,
                      color: dark ? TColors.light : TColors.primary)),
            ]))
          ],
        )
      ],
    ));
  }
}
