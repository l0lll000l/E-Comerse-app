import 'package:flutter/material.dart';
import 'package:flutter_application_1/Common/widgets/image%20container/rounded_image.dart';
import 'package:flutter_application_1/Common/widgets/Product/product_title_text.dart';
import 'package:flutter_application_1/Common/widgets/Product/rounded_container.dart';
import 'package:flutter_application_1/Common/widgets/Product/product_price.dart';
import 'package:flutter_application_1/Utils/Helpers/helper_functions.dart';
import 'package:flutter_application_1/Utils/constants/colors.dart';
import 'package:flutter_application_1/Utils/constants/image_strings.dart';
import 'package:flutter_application_1/Utils/constants/shadow.dart';
import 'package:flutter_application_1/Utils/constants/sizes.dart';
import 'package:iconsax/iconsax.dart';

class TProductCardVertical extends StatelessWidget {
  const TProductCardVertical({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 180,
        decoration: BoxDecoration(
            // border: Border.all(color: TColors.grey),
            boxShadow: [TShadowStyle.verticalProductShadow],
            color: dark ? TColors.darkerGrey : TColors.light,
            borderRadius: BorderRadius.circular(TSizes.productImageRadius)),
        child: Column(
          children: [
            /// image ,discount, add to wishlist
            TRoundedContainer(
              padding: const EdgeInsets.all(TSizes.sm),
              backgroundColor: dark ? TColors.grey : TColors.light,
              borderColor: dark ? TColors.darkerGrey : TColors.grey,
              height: 180,
              child: Stack(
                children: [
                  ///thumbnail
                  const TRoundedImage(
                      padding: EdgeInsets.all(0),
                      fit: BoxFit.contain,
                      imageurl: TImages.product1),
                  Positioned(
                    left: 0,
                    top: 12,
                    child: TRoundedContainer(
                      backgroundColor: TColors.secondary.withOpacity(0.8),
                      radius: TSizes.xs,
                      padding: const EdgeInsets.symmetric(
                          horizontal: TSizes.sm, vertical: TSizes.xs),
                      child: Text(
                        '25%',
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge!
                            .apply(color: TColors.black),
                      ),
                    ),
                  ),

                  /// favorite icon
                  Positioned(
                    right: 0,
                    top: 0,
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          color: dark
                              ? TColors.dark.withOpacity(0.9)
                              : TColors.light.withOpacity(0.9),
                          borderRadius: BorderRadius.circular(20)),
                      child: IconButton(
                          onPressed: () {},
                          icon: Icon(Iconsax.heart5,
                              color: dark ? TColors.light : TColors.dark)),
                    ),
                  )
                ],
              ),
            ),

            /// details
            Padding(
                padding: const EdgeInsets.only(
                  left: TSizes.sm,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const ProductTitleText(
                      smallSize: true,
                      text: 'Green Nike Air Shoes',
                    ),
                    const SizedBox(height: TSizes.spaceBtwItems / 2),
                    Row(
                      children: [
                        Text(
                          'Nike',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                        const SizedBox(width: TSizes.xs),
                        const Icon(
                          Iconsax.verify,
                          color: TColors.primary,
                          size: TSizes.iconXs,
                        )
                      ],
                    ),
                    const ProductPrice(
                      price: '30',
                      islarge: true,
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
