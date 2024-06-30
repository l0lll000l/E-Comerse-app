import 'package:flutter/material.dart';
import 'package:flutter_application_1/Feature/Shop/Screens/wishList/widget/circularicon.dart';
import 'package:flutter_application_1/Utils/Helpers/helper_functions.dart';
import 'package:flutter_application_1/Utils/constants/colors.dart';
import 'package:flutter_application_1/Utils/constants/sizes.dart';
import 'package:iconsax/iconsax.dart';

class ProductQuantityAddRemove extends StatelessWidget {
  const ProductQuantityAddRemove({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Row(
      children: [
        const SizedBox(width: 70),
        const CircleIcon(
          lightmodebackground: TColors.grey,
          darkModebackground: TColors.grey,
          height: 32,
          width: 32,
          iconsize: 16,
          icon: Iconsax.minus,
        ),
        const SizedBox(width: TSizes.spaceBtwItems),
        Text('2',
            style: Theme.of(context).textTheme.titleSmall!.apply(
                  color: dark ? TColors.light : TColors.dark,
                )),
        const SizedBox(width: TSizes.spaceBtwItems),
        const CircleIcon(
          lightmodebackground: TColors.grey,
          darkModebackground: TColors.grey,
          height: 32,
          iconsize: 16,
          width: 32,
          icon: Icons.add,
        ),
      ],
    );
  }
}
