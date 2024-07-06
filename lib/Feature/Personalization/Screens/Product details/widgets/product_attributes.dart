import 'package:flutter/material.dart';
import 'package:flutter_application_1/Common/widgets/AppBar/section_heading.dart';
import 'package:flutter_application_1/Common/widgets/Product/product_price.dart';
import 'package:flutter_application_1/Common/widgets/Product/product_title_text.dart';
import 'package:flutter_application_1/Common/widgets/Product/rounded_container.dart';
import 'package:flutter_application_1/Feature/Personalization/Screens/Product%20details/widgets/choice_chip.dart';
import 'package:flutter_application_1/Feature/Shop/Model/product_model.dart';
import 'package:flutter_application_1/Utils/Helpers/helper_functions.dart';
import 'package:flutter_application_1/Utils/constants/colors.dart';
import 'package:flutter_application_1/Utils/constants/sizes.dart';

class ProductAttributes extends StatelessWidget {
  const ProductAttributes({super.key, required this.product});
  final ProductModel? product;
  @override
  Widget build(BuildContext context) {
    bool value3 = false;
    bool value = false;
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// selected attributes pricing and description
        TRoundedContainer(
          padding: const EdgeInsets.all(TSizes.md),
          backgroundColor: dark
              ? TColors.darkerGrey
              : const Color.fromARGB(139, 158, 158, 158),
          child: Column(
            children: [
              TsectionHeading(
                textcolor: dark ? TColors.light : TColors.black,
                showActionButton: false,
                title: 'Variations',
                addChild: true,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        ProductTitleText(
                          text: 'Price :',
                          textColor: dark ? TColors.light : TColors.black,
                          smallSize: true,
                        ),
                        const SizedBox(width: TSizes.spaceBtwItems),
                        ProductPrice(
                          price: product!.price.toString() ?? '',
                          lineThrough: true,
                          textColor: dark ? TColors.light : TColors.black,
                        ),
                        const SizedBox(width: TSizes.spaceBtwItems),
                        ProductPrice(
                          price: product!.salePrice.toString() ?? '',
                          textColor: dark ? TColors.light : TColors.black,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        ProductTitleText(
                          smallSize: true,
                          text: 'Stock :',
                          textColor: dark ? TColors.light : TColors.black,
                        ),
                        const SizedBox(width: TSizes.spaceBtwItems),
                        ProductTitleText(
                          smallSize: true,
                          text:
                              product!.stock > 0 ? 'In Stock ' : 'Out of Stock',
                          textColor: dark ? TColors.light : TColors.black,
                        )
                      ],
                    )
                  ],
                ),
              ),
              ProductTitleText(
                textAlign: TextAlign.start,
                smallSize: true,
                maxlines: 4,
                text:
                    'this is the description of the product, it can go upto 4 lines of description',
                textColor: dark ? TColors.light : TColors.black,
              )
            ],
          ),
        ),
        const SizedBox(height: TSizes.spaceBtwItems / 2),

        ///attributes
        /// colors
        Column(
          children: [
            TsectionHeading(
              title: 'Colors',
              textcolor: dark ? TColors.light : TColors.black,
            ),
            const SizedBox(height: TSizes.spaceBtwItems / 2),
            Material(
              child: Wrap(
                spacing: 8,
                children: [
                  TchoiceChip(
                    text: product!.productAttributes![0].values![0] ?? '',
                    selected: true,
                    onselected: (selected) {
                      value = selected;
                    },
                  ),
                  TchoiceChip(
                    text: product!.productAttributes![0].values![1] ?? '',
                    selected: true,
                    onselected: (selected) {
                      value = selected;
                    },
                  ),
                  TchoiceChip(
                    text: product!.productAttributes![0].values![2] ?? '',
                    selected: value3,
                    onselected: (value) {
                      print('selected');
                      value3 = !value;
                    },
                  ),
                  TchoiceChip(
                    text: product!.productAttributes![0].values![3] ?? '',
                    selected: value,
                    onselected: (selected) {
                      value = !selected;
                    },
                  ),
                ],
              ),
            ),

            /// size
            TsectionHeading(
              title: 'Size',
              textcolor: dark ? TColors.light : TColors.black,
            ),
            Material(
              child: Wrap(
                spacing: 8,
                children: [
                  TchoiceChip(
                    text: 'Eu 34',
                    selected: false,
                    onselected: (selected) {
                      value = selected;
                    },
                  ),
                  TchoiceChip(
                    text: 'Eu 36',
                    selected: true,
                    onselected: (selected) {
                      value = selected;
                    },
                  ),
                  TchoiceChip(
                    text: 'Eu 38',
                    selected: value3,
                    onselected: (selected) {
                      value3 = selected;
                    },
                  ),
                  TchoiceChip(
                    text: 'Eu 40',
                    selected: false,
                    onselected: (selected) {
                      value = selected;
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
