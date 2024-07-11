import 'package:flutter/material.dart';
import 'package:flutter_application_1/Common/widgets/AppBar/section_heading.dart';
import 'package:flutter_application_1/Common/widgets/Product/product_price.dart';
import 'package:flutter_application_1/Common/widgets/Product/product_title_text.dart';
import 'package:flutter_application_1/Common/widgets/Product/rounded_container.dart';
import 'package:flutter_application_1/Common/widgets/Text/branded_text.dart';
import 'package:flutter_application_1/Common/widgets/image%20container/circle_image.dart';
import 'package:flutter_application_1/Feature/Personalization/Screens/Product%20details/widgets/add_to_card.dart';
import 'package:flutter_application_1/Feature/Personalization/Screens/Product%20details/widgets/product_attributes.dart';
import 'package:flutter_application_1/Feature/Personalization/Screens/Product%20details/widgets/rating_and_share.dart';
import 'package:flutter_application_1/Feature/Personalization/Screens/productReviews/productreview.dart';
import 'package:flutter_application_1/Feature/Shop/Model/product_model.dart';
import 'package:flutter_application_1/Utils/constants/colors.dart';
import 'package:flutter_application_1/Utils/constants/enums.dart';
import 'package:flutter_application_1/Utils/constants/image_strings.dart';
import 'package:flutter_application_1/Utils/constants/sizes.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';

import '../../../../Utils/Helpers/helper_functions.dart';
import 'widgets/product_image_slider.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({
    super.key,
    this.discountPercentage = '0',
    this.product,
  });
  final String discountPercentage;

  final ProductModel? product;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      bottomNavigationBar: const AddToCart(),
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: Container(
          // height: MediaQuery.of(context).size.height,
          color: dark ? TColors.darkerGrey : Colors.white,
          child: Column(
            children: [
              /// Product image
              ProductImage(
                product: product,
              ),
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

                    /// Product price
                    Row(
                      children: [
                        TRoundedContainer(
                          backgroundColor: TColors.secondary.withOpacity(0.8),
                          radius: TSizes.xs,
                          padding:
                              const EdgeInsets.symmetric(vertical: TSizes.xs),
                          child: Text(
                            '$discountPercentage% OFF',
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge!
                                .apply(color: TColors.black),
                          ),
                        ),
                        const SizedBox(width: TSizes.spaceBtwItems),
                        Text('\$${product != null ? product!.price : ''} ',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .apply(
                                    color: dark ? TColors.light : TColors.dark,
                                    decoration: TextDecoration.lineThrough)),
                        const SizedBox(
                          width: TSizes.spaceBtwItems,
                        ),
                        ProductPrice(
                          textColor: dark ? TColors.light : TColors.dark,
                          islarge: true,
                          price: (product != null ? product!.salePrice : '')
                              .toString(),
                        )
                      ],
                    ),
                    const SizedBox(height: TSizes.spaceBtwItems / 2),

                    /// Product name
                    ProductTitleText(
                      text: product != null ? product!.title : '',
                      textColor: dark ? TColors.light : TColors.dark,
                    ),
                    const SizedBox(height: TSizes.spaceBtwItems / 2),

                    /// stock status
                    Row(
                      children: [
                        Text('Status : ',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .apply(
                                    color:
                                        dark ? TColors.light : TColors.dark)),
                        Text(
                            (product != null ? product!.stock : 0) > 0
                                ? 'In Stock '
                                : 'Out of Stock',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .apply(
                                    color: dark ? TColors.light : TColors.dark))
                      ],
                    ),
                    const SizedBox(height: TSizes.spaceBtwItems / 2),

                    ///brand
                    Row(
                      children: [
                        TCircleImage(
                            padding: const EdgeInsets.all(0),
                            height: 32,
                            width: 32,
                            fit: BoxFit.contain,
                            imageurl: product != null
                                ? product!.brand!.image
                                : TImages.noImage,
                            isNetworkImage: true,
                            backgroundColor:
                                dark ? TColors.grey : TColors.light,
                            overlayColor: null),
                        const SizedBox(width: 5),
                        BrandedText(
                            brandTextSize: TextSizes.medium,
                            textcolor: TColors.primary,
                            text: product != null
                                ? product!.brand!.name
                                : 'No brand name',
                            iconcolor: TColors.primary),
                      ],
                    ),

                    const SizedBox(height: TSizes.spaceBtwItems / 2),

                    /// Product attributes
                    ProductAttributes(product: product),
                    const SizedBox(height: TSizes.spaceBtwItems / 2),

                    /// Add to cart button
                    SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                            onPressed: () {}, child: const Text('Checkout'))),
                    const SizedBox(height: TSizes.spaceBtwItems),

                    ///description
                    const TsectionHeading(
                      title: 'Description',
                    ),
                    const SizedBox(height: TSizes.spaceBtwItems),
                    Material(
                      child: ReadMoreText(
                          colorClickableText: Colors.black,
                          trimLines: 2,
                          trimMode: TrimMode.Line,
                          trimCollapsedText: ' Show more',
                          trimExpandedText: ' Show less',
                          moreStyle: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w800),
                          lessStyle: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w800),
                          (product != null ? product!.desctription : '')
                              .toString(),
                          style: const TextStyle(
                            fontSize: 15,
                            color: TColors.black,
                          )),
                    ),
                    const Divider(),

                    /// reviews
                    TsectionHeading(
                      onpressed: () {
                        Get.to(() => const ProductReviews());
                      },
                      title: 'Reviews(199)',
                      showActionButton: true,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
