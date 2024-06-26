import 'package:flutter/material.dart';
import 'package:flutter_application_1/Utils/constants/colors.dart';
import 'package:flutter_application_1/Utils/constants/enums.dart';
import 'package:flutter_application_1/Utils/constants/sizes.dart';
import 'package:iconsax/iconsax.dart';

class BrandedText extends StatelessWidget {
  const BrandedText({
    super.key,
    this.text = 'Nike',
    this.maxlines = 1,
    this.iconcolor = TColors.primary,
    this.textAlign = TextAlign.start,
    required this.brandTextSize,
    required this.textcolor,
  });
  final String text;
  final int maxlines;
  final TextAlign textAlign;
  final Color iconcolor, textcolor;
  final TextSizes brandTextSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          text,
          overflow: TextOverflow.ellipsis,
          maxLines: maxlines,
          style: brandTextSize == TextSizes.small
              ? Theme.of(context).textTheme.labelMedium!.apply(color: textcolor)
              : brandTextSize == TextSizes.medium
                  ? Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .apply(color: textcolor)
                  : brandTextSize == TextSizes.large
                      ? Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .apply(color: textcolor)
                      : Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .apply(color: textcolor),
          textAlign: textAlign,
        ),
        const SizedBox(width: TSizes.xs),
        Icon(
          Iconsax.verify5,
          color: iconcolor,
          size: TSizes.iconSm,
        )
      ],
    );
  }
}
