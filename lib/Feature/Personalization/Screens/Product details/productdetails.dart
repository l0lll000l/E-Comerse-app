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
import 'package:flutter_application_1/Utils/constants/colors.dart';
import 'package:flutter_application_1/Utils/constants/enums.dart';
import 'package:flutter_application_1/Utils/constants/image_strings.dart';
import 'package:flutter_application_1/Utils/constants/sizes.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';
import '../../../../Utils/Helpers/helper_functions.dart';
import 'widgets/product_image_slider.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

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
              const ProductImage(
                  sliderImage: TImages.productImage1,
                  productImages: TImages.productImage10),
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
                            '25%',
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge!
                                .apply(color: TColors.black),
                          ),
                        ),
                        const SizedBox(width: TSizes.spaceBtwItems),
                        Text('\$250',
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
                          price: '170',
                        )
                      ],
                    ),
                    const SizedBox(height: TSizes.spaceBtwItems / 2),

                    /// Product name
                    ProductTitleText(
                      text: 'Apple iphone 13',
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
                        Text('In Stock',
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
                            imageurl: TImages.nikeLogo,
                            backgroundColor:
                                dark ? TColors.grey : TColors.light,
                            overlayColor: null),
                        const SizedBox(width: 5),
                        const BrandedText(
                            brandTextSize: TextSizes.medium,
                            textcolor: TColors.primary,
                            text: 'Apple',
                            iconcolor: TColors.primary),
                      ],
                    ),

                    const SizedBox(height: TSizes.spaceBtwItems / 2),

                    /// Product attributes
                    const ProductAttributes(),
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
                    const Material(
                      child: ReadMoreText(
                          colorClickableText: Colors.black,
                          trimLines: 2,
                          trimMode: TrimMode.Line,
                          trimCollapsedText: ' Show more',
                          trimExpandedText: ' Show less',
                          moreStyle: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w800),
                          lessStyle: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w800),
                          'this is iphonw 13 description,and this iphone is one of the best product by apple ,design is best and everythin gis best but cant do thing we do on android ',
                          style: TextStyle(
                            fontSize: 15,
                            color: TColors.black,
                          )),
                    ),
                    Divider(),

                    /// reviews
                    TsectionHeading(
                      onpressed: () {
                        Get.to(() => ProductReviews());
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
