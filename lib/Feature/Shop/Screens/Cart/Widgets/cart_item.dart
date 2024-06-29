import 'package:flutter/material.dart';
import 'package:flutter_application_1/Common/widgets/Product/product_title_text.dart';
import 'package:flutter_application_1/Common/widgets/Text/branded_text.dart';
import 'package:flutter_application_1/Common/widgets/image%20container/rounded_image.dart';
import 'package:flutter_application_1/Utils/Helpers/helper_functions.dart';
import 'package:flutter_application_1/Utils/constants/colors.dart';
import 'package:flutter_application_1/Utils/constants/enums.dart';
import 'package:flutter_application_1/Utils/constants/image_strings.dart';
import 'package:flutter_application_1/Utils/constants/sizes.dart';

class TCartItem extends StatelessWidget {
  const TCartItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Row(
      children: [
        /// image
        const TRoundedImage(height: 60, width: 60, imageurl: TImages.banner1),
        const SizedBox(width: TSizes.spaceBtwItems),

        /// title,price,size
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ///brand name
              const BrandedText(
                  brandTextSize: TextSizes.large, textcolor: TColors.black),

              ///title
              Flexible(
                child: ProductTitleText(
                  text: 'Black Sports shoes',
                  maxlines: 1,
                  textColor: dark ? TColors.light : TColors.dark,
                ),
              ),

              ///Attributes
              Text.rich(TextSpan(children: [
                TextSpan(
                    text: 'color : ',
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .apply(color: dark ? TColors.light : TColors.dark)),
                TextSpan(
                    text: 'Green',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .apply(color: dark ? TColors.light : TColors.dark)),
                TextSpan(
                    text: '  size : ',
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .apply(color: dark ? TColors.light : TColors.dark)),
                TextSpan(
                    text: 'Ez45',
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .apply(color: dark ? TColors.light : TColors.dark))
              ]))
            ],
          ),
        )
      ],
    );
  }
}
