import 'package:flutter/material.dart';
import 'package:flutter_application_1/Common/widgets/Product/favourite_icon.dart';
import 'package:flutter_application_1/Common/widgets/Product/product_price.dart';
import 'package:flutter_application_1/Common/widgets/Product/product_title_text.dart';
import 'package:flutter_application_1/Common/widgets/Product/rounded_container.dart';
import 'package:flutter_application_1/Common/widgets/image%20container/rounded_image.dart';
import 'package:flutter_application_1/Feature/Personalization/Screens/Product%20details/productdetails.dart';
import 'package:flutter_application_1/Feature/Shop/Controller/cart_controller.dart';
import 'package:flutter_application_1/Feature/Shop/Model/product_model.dart';
import 'package:flutter_application_1/Utils/Helpers/helper_functions.dart';
import 'package:flutter_application_1/Utils/constants/colors.dart';
import 'package:flutter_application_1/Utils/constants/enums.dart';
import 'package:flutter_application_1/Utils/constants/image_strings.dart';
import 'package:flutter_application_1/Utils/constants/shadow.dart';
import 'package:flutter_application_1/Utils/constants/sizes.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class TProductCardVertical extends StatelessWidget {
  const TProductCardVertical({
    this.sliderImageList = const [],
    super.key,
    this.product,
  });
  final ProductModel? product;
  final List<String> sliderImageList;

  @override
  Widget build(BuildContext context) {
    double dis = 0.0;
    if (product?.price != null && product!.salePrice != null) {
      dis = ((product!.price - product!.salePrice) / product!.price) * 100;
    }

    String discountPercentage = dis.toString().substring(0, 2);
    final dark = THelperFunctions.isDarkMode(context);
    return GestureDetector(
      /// on tap
      onTap: () {
        Get.to(() => ProductDetails(
              product: product,
              discountPercentage: discountPercentage,
            ));
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
                    onPressed: () {},
                    padding: EdgeInsets.all(0),
                    fit: BoxFit.contain,
                    isNetworkImage: true,
                    imageurl: product?.thumbnail ?? TImages.noImage,
                  ),
                  Positioned(
                    left: 0,
                    top: 12,
                    child: TRoundedContainer(
                      backgroundColor: TColors.secondary.withOpacity(0.8),
                      radius: TSizes.xs,
                      padding: const EdgeInsets.symmetric(
                          horizontal: TSizes.sm, vertical: TSizes.xs),
                      child: Text(
                        '$discountPercentage% OFF',
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge!
                            .apply(color: TColors.black),
                      ),
                    ),
                  ),

                  /// favorite icon
                  Positioned(
                      top: 0,
                      right: 0,
                      child: FavouriteIcon(
                        productId: product != null
                            ? product!.id
                            : '0000000000000000000',
                      ))
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
                      text: product != null ? product!.title : '',
                    ),
                    const SizedBox(height: TSizes.spaceBtwItems / 2),

                    /// brand
                    Row(
                      children: [
                        Text(
                          (product != null ? product!.brand?.name : '')
                              .toString(),
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
                          price: (product != null ? product!.salePrice : '')
                              .toString(),
                          islarge: true,
                        ),
                        InkWell(
                          onTap: () {
                            print(1);
                            print(product!.productType);
                            if (product!.productType != null) {
                              final cartItem = CartController.instance
                                  .convertToCartItem(product!, 1);
                              print(cartItem.toJson());

                              CartController.instance.addOneToCart(cartItem);
                              print(cartItem.toJson());
                            }
                          },
                          child: Obx(() {
                            final productQuantity = CartController.instance
                                .getProductQuantityInCart(product!.id);
                            return Container(
                              decoration: BoxDecoration(
                                color: productQuantity > 0
                                    ? TColors.primary
                                    : TColors.black,
                                borderRadius: const BorderRadius.only(
                                    bottomRight: Radius.circular(
                                        TSizes.productImageRadius),
                                    topLeft:
                                        Radius.circular(TSizes.cardRadiusMd)),
                              ),

                              /// add to cart button
                              child: SizedBox(
                                height: TSizes.iconLg * 1.2,
                                width: TSizes.iconLg * 1.2,
                                child: Center(
                                  child: productQuantity > 0
                                      ? Text(productQuantity.toString())
                                      : const Icon(
                                          Iconsax.add,
                                          color: TColors.light,
                                        ),
                                ),
                              ),
                            );
                          }),
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
