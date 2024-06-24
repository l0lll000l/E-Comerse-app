import 'package:flutter/material.dart';
import 'package:flutter_application_1/Utils/Helpers/helper_functions.dart';

import 'package:flutter_application_1/Utils/constants/colors.dart';
import 'package:flutter_application_1/Utils/constants/image_strings.dart';
import 'package:flutter_application_1/Utils/constants/sizes.dart';

class TverticalImageText extends StatelessWidget {
  const TverticalImageText({
    super.key,
    this.image = TImages.testImage,
    this.text = 'item',
    this.onTap,
    this.textcolor = TColors.light,
    this.backgroundColor,
  });
  final String image, text;
  final void Function()? onTap;
  final Color textcolor;
  final Color? backgroundColor;
  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: TSizes.spaceBtwItems / 2),
        child: Column(
          children: [
            Container(
              width: 56,
              height: 56,
              padding: const EdgeInsets.all(TSizes.xs),
              decoration: BoxDecoration(
                  color:
                      backgroundColor ?? (dark ? TColors.dark : TColors.light),
                  borderRadius: BorderRadius.circular(28)),
              child: Image(image: AssetImage(image)),
            ),
            const SizedBox(height: TSizes.spaceBtwItems / 2),
            SizedBox(
              child: Text(
                text,
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .copyWith(color: textcolor),
                overflow: TextOverflow.ellipsis,
              ),
            )
          ],
        ),
      ),
    );
  }
}
