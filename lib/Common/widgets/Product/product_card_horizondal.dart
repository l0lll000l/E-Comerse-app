import 'package:flutter/material.dart';
import 'package:flutter_application_1/Common/widgets/Product/favourite_icon.dart';
import 'package:flutter_application_1/Common/widgets/Product/product_price.dart';
import 'package:flutter_application_1/Common/widgets/Product/product_title_text.dart';
import 'package:flutter_application_1/Common/widgets/Product/rounded_container.dart';
import 'package:flutter_application_1/Common/widgets/Text/branded_text.dart';
import 'package:flutter_application_1/Common/widgets/image%20container/rounded_image.dart';
import 'package:flutter_application_1/Feature/Personalization/Screens/Product%20details/productdetails.dart';
import 'package:flutter_application_1/Feature/Shop/Model/product_model.dart';
import 'package:flutter_application_1/Utils/Helpers/helper_functions.dart';
import 'package:flutter_application_1/Utils/constants/colors.dart';
import 'package:flutter_application_1/Utils/constants/enums.dart';
import 'package:flutter_application_1/Utils/constants/sizes.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:iconsax/iconsax.dart';

class TProductCardHorrizondal extends StatelessWidget {
  const TProductCardHorrizondal({super.key, required this.product});
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: () {
        Get.to(() => ProductDetails(
              product: product,
            ));
      },
      child: Container(
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
                      isNetworkImage: true,
                      backGroundColor:
                          dark ? TColors.grey : HexColor('#F4F1F8'),
                      imageurl: product.thumbnail,
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
                    Positioned(
                        top: 0,
                        right: 0,
                        child: FavouriteIcon(
                          productId: product.id,
                        ))
                  ],
                ),
              ),

              /// details
              SizedBox(
                width: 172,
                child: Padding(
                  padding:
                      const EdgeInsets.only(top: TSizes.sm, left: TSizes.sm),
                  child: Column(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ///title
                          ProductTitleText(
                            text: product.title,
                            maxlines: 1,
                            textAlign: TextAlign.start,
                            textColor: dark ? TColors.light : TColors.dark,
                            smallSize: false,
                          ),
                          SizedBox(height: TSizes.spaceBtwItems / 2),

                          ///brand
                          BrandedText(
                              text: product.brand!.name,
                              brandTextSize: TextSizes.medium,
                              textcolor: dark ? TColors.light : TColors.dark),
                        ],
                      ),
                      SizedBox(height: TSizes.spaceBtwItems / 2),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ProductPrice(
                              price: product.salePrice.toString(),
                              islarge: true,
                              textColor: dark ? TColors.light : TColors.dark),
                          Container(
                            decoration: const BoxDecoration(
                              color: TColors.black,
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(
                                      TSizes.productImageRadius),
                                  topLeft:
                                      Radius.circular(TSizes.cardRadiusMd)),
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
          )),
    );
  }
}
