import 'package:flutter/material.dart';
import 'package:flutter_application_1/Common/widgets/AppBar/section_heading.dart';
import 'package:flutter_application_1/Common/widgets/Product/product_price.dart';
import 'package:flutter_application_1/Common/widgets/Product/product_title_text.dart';
import 'package:flutter_application_1/Common/widgets/Product/rounded_container.dart';
import 'package:flutter_application_1/Feature/Personalization/Screens/Product%20details/widgets/choice_chip.dart';
import 'package:flutter_application_1/Feature/Shop/Controller/variation_controller.dart';
import 'package:flutter_application_1/Feature/Shop/Model/product_model.dart';
import 'package:flutter_application_1/Utils/Helpers/helper_functions.dart';
import 'package:flutter_application_1/Utils/constants/colors.dart';
import 'package:flutter_application_1/Utils/constants/sizes.dart';
import 'package:get/get.dart';

class ProductAttributes extends StatelessWidget {
  const ProductAttributes({super.key, required this.product});
  final ProductModel? product;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VariationController());

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
                          price: (product != null ? product!.price : '')
                              .toString(),
                          lineThrough: true,
                          textColor: dark ? TColors.light : TColors.black,
                        ),
                        const SizedBox(width: TSizes.spaceBtwItems),
                        ProductPrice(
                          price: (product != null ? product!.salePrice : '')
                              .toString(),
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
                          text: (product != null ? product!.stock : 0) > 0
                              ? 'In Stock '
                              : 'Out of Stock',
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
            ...product!.productAttributes!
                .map(
                  (attribute) => Column(
                    children: [
                      TsectionHeading(
                        title:
                            attribute != null ? attribute.name.toString() : '',
                        textcolor: dark ? TColors.light : TColors.black,
                      ),
                      const SizedBox(height: TSizes.spaceBtwItems / 2),
                      Material(
                        child: Obx(
                          () => Wrap(
                            spacing: 8,
                            children: [
                              ...attribute.values!.map((attributeValue) {
                                final available = controller
                                    .getAttributeAvailabilityInVariation(
                                        product != null
                                            ? product!.productVariations!
                                            : [],
                                        attribute.name!)
                                    .contains(attributeValue);
                                final isSelected = controller
                                        .selectedAttributes[attribute.name] ==
                                    attributeValue;
                                return TchoiceChip(
                                    text: attributeValue != null
                                        ? attributeValue
                                        : '',
                                    selected: isSelected,
                                    onselected: available
                                        ? (selected) {
                                            if (selected && available) {
                                              controller.onAttributeSelected(
                                                  product!,
                                                  attribute.name ?? '',
                                                  attributeValue);
                                            }
                                          }
                                        : null);
                              }).toList(),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )
                .toList(),
          ],
        ),
      ],
    );
  }
}
