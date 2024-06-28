import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/Common/widgets/Product/product_price.dart';
import 'package:flutter_application_1/Common/widgets/Product/product_title_text.dart';
import 'package:flutter_application_1/Common/widgets/Product/rounded_container.dart';
import 'package:flutter_application_1/Common/widgets/Text/branded_text.dart';
import 'package:flutter_application_1/Common/widgets/image%20container/circle_image.dart';
import 'package:flutter_application_1/Feature/Shop/Screens/Product%20details/widgets/product_attributes.dart';
import 'package:flutter_application_1/Feature/Shop/Screens/Product%20details/widgets/rating_and_share.dart';
import 'package:flutter_application_1/Utils/constants/colors.dart';
import 'package:flutter_application_1/Utils/constants/enums.dart';
import 'package:flutter_application_1/Utils/constants/image_strings.dart';
import 'package:flutter_application_1/Utils/constants/sizes.dart';

import 'widgets/product_image_slider.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    // final dark = THelperFunctions.isDarkMode(context);
    return SingleChildScrollView(
      child: Column(
        children: [
          /// Product image
          const ProductImage(
              sliderImage: TImages.product1, productImages: TImages.product1),
          Padding(
            padding: const EdgeInsets.only(
              right: TSizes.defaultSpace,
              left: TSizes.defaultSpace,
              bottom: TSizes.defaultSpace,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ///rating and share button
                const RatingAndShare(),
                SizedBox(height: TSizes.spaceBtwItems / 2),

                /// Product price
                Row(
                  children: [
                    TRoundedContainer(
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
                    const SizedBox(width: TSizes.spaceBtwItems),
                    Text('\$250',
                        style: Theme.of(context).textTheme.titleSmall!.apply(
                            color: TColors.light,
                            decoration: TextDecoration.lineThrough)),
                    const SizedBox(
                      width: TSizes.spaceBtwItems,
                    ),
                    const ProductPrice(
                      islarge: true,
                      price: '170',
                    )
                  ],
                ),
                SizedBox(height: TSizes.spaceBtwItems / 2),

                /// Product name
                ProductTitleText(
                  text: 'Apple iphone 13',
                ),
                SizedBox(height: TSizes.spaceBtwItems / 2),

                /// stock status
                Row(
                  children: [
                    Text('Status : ',
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .apply(color: TColors.light)),
                    Text('In Stock',
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .apply(color: TColors.light))
                  ],
                ),
                SizedBox(height: TSizes.spaceBtwItems / 2),

                ///brand
                const Row(
                  children: [
                    TCircleImage(
                        padding: EdgeInsets.all(0),
                        height: 32,
                        width: 32,
                        fit: BoxFit.contain,
                        imageurl: TImages.testImage,
                        backgroundColor: TColors.light,
                        overlayColor: null),
                    SizedBox(width: 5),
                    BrandedText(
                        brandTextSize: TextSizes.medium,
                        textcolor: TColors.primary,
                        text: 'Apple',
                        iconcolor: TColors.primary),
                  ],
                ),

                /// Product attributes
                const SizedBox(height: TSizes.spaceBtwItems / 2),
                const ProductAttributes()

                /// Add to cart button
              ],
            ),
          ),
        ],
      ),
    );
  }
}
