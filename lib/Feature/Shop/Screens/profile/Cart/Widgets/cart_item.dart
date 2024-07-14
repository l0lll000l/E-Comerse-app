import 'package:flutter/material.dart';
import 'package:flutter_application_1/Common/widgets/Product/product_title_text.dart';
import 'package:flutter_application_1/Common/widgets/Text/branded_text.dart';
import 'package:flutter_application_1/Common/widgets/image%20container/rounded_image.dart';
import 'package:flutter_application_1/Feature/Shop/Model/cart_item_model.dart';
import 'package:flutter_application_1/Utils/Helpers/helper_functions.dart';
import 'package:flutter_application_1/Utils/constants/colors.dart';
import 'package:flutter_application_1/Utils/constants/enums.dart';
import 'package:flutter_application_1/Utils/constants/sizes.dart';

class TCartItem extends StatelessWidget {
  const TCartItem({
    super.key,
    required this.cartItem,
  });
  final CartItemModel cartItem;
  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Row(
      children: [
        /// image
        TRoundedImage(
            fit: BoxFit.contain,
            height: 60,
            width: 60,
            isNetworkImage: true,
            imageurl: cartItem.image!),
        const SizedBox(width: TSizes.spaceBtwItems),

        /// title,price,size
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ///brand name
              BrandedText(
                  text: cartItem.brandName!,
                  brandTextSize: TextSizes.large,
                  textcolor: TColors.black),

              ///title
              Flexible(
                child: ProductTitleText(
                  text: cartItem.title,
                  maxlines: 1,
                  textColor: dark ? TColors.light : TColors.dark,
                ),
              ),

              ///Attributes
              Text.rich(
                TextSpan(
                    children: (cartItem.selectedVariation ?? {})
                        .entries
                        .map((e) => TextSpan(children: [
                              TextSpan(
                                  text: '${e.key}',
                                  style: Theme.of(context).textTheme.bodySmall),
                              TextSpan(
                                  text: '${e.value}',
                                  style: Theme.of(context).textTheme.bodySmall),
                            ]))
                        .toList()),
              ),
            ],
          ),
        )
      ],
    );
  }
}
