import 'package:flutter/material.dart';
import 'package:flutter_application_1/Common/widgets/Product/product_price.dart';
import 'package:flutter_application_1/Common/widgets/Product/product_title_text.dart';
import 'package:flutter_application_1/Common/widgets/Product/rounded_container.dart';
import 'package:flutter_application_1/Common/widgets/image%20container/rounded_image.dart';
import 'package:flutter_application_1/Feature/Personalization/Screens/Product%20details/productdetails.dart';
import 'package:flutter_application_1/Feature/Shop/Screens/wishList/widget/circularicon.dart';
import 'package:flutter_application_1/Utils/Helpers/helper_functions.dart';
import 'package:flutter_application_1/Utils/constants/colors.dart';
import 'package:flutter_application_1/Utils/constants/image_strings.dart';
import 'package:flutter_application_1/Utils/constants/shadow.dart';
import 'package:flutter_application_1/Utils/constants/sizes.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class TProductCardVertical extends StatelessWidget {
  const TProductCardVertical({super.key, this.product});
  final dynamic product;
  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return GestureDetector(
      /// on tap
      onTap: () {
        Get.to(() => const ProductDetails());
      },
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
                  TRoundedImage(
                      onPressed: () {
                        print(product['image']);
                      },
                      padding: EdgeInsets.all(0),
                      fit: BoxFit.contain,
                      isNetworkImage: true,
                      imageurl: product['image']),
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
                  const Positioned(top: 0, right: 0, child: CircleIcon())
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
                    ProductTitleText(
                      textColor: dark ? TColors.light : TColors.dark,
                      smallSize: true,
                      text: 'Green Nike Air Shoes',
                    ),
                    const SizedBox(height: TSizes.spaceBtwItems / 2),

                    /// brand
                    Row(
                      children: [
                        Text(
                          'Nike',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.labelMedium!.apply(
                              color: dark ? TColors.light : TColors.dark),
                        ),
                        const SizedBox(width: TSizes.xs),
                        const Icon(
                          Iconsax.verify,
                          color: TColors.primary,
                          size: TSizes.iconXs,
                        )
                      ],
                    ),

                    /// price
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ProductPrice(
                          textColor: dark ? TColors.light : TColors.dark,
                          price: '30',
                          islarge: true,
                        ),
                        Container(
                          decoration: const BoxDecoration(
                            color: TColors.black,
                            borderRadius: BorderRadius.only(
                                bottomRight:
                                    Radius.circular(TSizes.productImageRadius),
                                topLeft: Radius.circular(TSizes.cardRadiusMd)),
                          ),
                          child: const SizedBox(
                            height: TSizes.iconLg * 1.2,
                            width: TSizes.iconLg * 1.2,
                            child: Center(
                              child: Icon(
                                Iconsax.add,
                                color: TColors.light,
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
