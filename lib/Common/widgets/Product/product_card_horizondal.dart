import 'package:flutter/material.dart';
import 'package:flutter_application_1/Common/widgets/Product/product_price.dart';
import 'package:flutter_application_1/Common/widgets/Product/product_title_text.dart';
import 'package:flutter_application_1/Common/widgets/Product/rounded_container.dart';
import 'package:flutter_application_1/Common/widgets/Text/branded_text.dart';
import 'package:flutter_application_1/Common/widgets/image%20container/rounded_image.dart';
import 'package:flutter_application_1/Feature/Shop/Screens/wishList/widget/circularicon.dart';
import 'package:flutter_application_1/Utils/Helpers/helper_functions.dart';
import 'package:flutter_application_1/Utils/constants/colors.dart';
import 'package:flutter_application_1/Utils/constants/enums.dart';
import 'package:flutter_application_1/Utils/constants/image_strings.dart';
import 'package:flutter_application_1/Utils/constants/sizes.dart';
import 'package:iconsax/iconsax.dart';
import 'package:hexcolor/hexcolor.dart';

class TProductCardHorrizondal extends StatelessWidget {
  const TProductCardHorrizondal({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Container(
        width: 310,
        decoration: BoxDecoration(
            // border: Border.all(color: TColors.grey),
            // boxShadow: [TShadowStyle.verticalProductShadow],
            color: dark ? TColors.darkerGrey : HexColor('#F2F8FC'),
            borderRadius: BorderRadius.circular(TSizes.productImageRadius)),
        child: Row(
          children: [
            ///thumbnail

            TRoundedContainer(
              height: 120,
              padding: const EdgeInsets.all(TSizes.sm),
              backgroundColor: dark ? TColors.grey : HexColor('#F4F1F8'),
              child: Stack(
                children: [
                  ///thumbnail
                  TRoundedImage(
                    fit: BoxFit.contain,
                    height: 120,
                    width: 120,
                    backGroundColor: dark ? TColors.grey : HexColor('#F4F1F8'),
                    imageurl: TImages.product5,
                    applyImageRadius: true,
                  ),

                  ///discount
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

                  ///wishlist
                  const Positioned(top: 0, right: 0, child: CircleIcon())
                ],
              ),
            ),

            /// details
            SizedBox(
              width: 172,
              child: Padding(
                padding: const EdgeInsets.only(top: TSizes.sm, left: TSizes.sm),
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ///title
                        ProductTitleText(
                          text: 'Green Nike half sleeve shirt',
                          maxlines: 1,
                          textAlign: TextAlign.start,
                          textColor: dark ? TColors.light : TColors.dark,
                          smallSize: false,
                        ),
                        SizedBox(height: TSizes.spaceBtwItems / 2),

                        ///brand
                        BrandedText(
                            brandTextSize: TextSizes.medium,
                            textcolor: dark ? TColors.light : TColors.dark),
                      ],
                    ),
                    SizedBox(height: TSizes.spaceBtwItems / 2),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ProductPrice(
                            price: '200',
                            islarge: true,
                            textColor: dark ? TColors.light : TColors.dark),
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
                    ),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
