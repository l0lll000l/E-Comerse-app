import 'package:flutter/material.dart';
import 'package:flutter_application_1/Utils/constants/colors.dart';
import 'package:flutter_application_1/Utils/constants/sizes.dart';
import 'package:iconsax/iconsax.dart';

class ProductPrice extends StatelessWidget {
  const ProductPrice({
    super.key,
    required this.price,
    this.currencySign = '\$',
    this.islarge = false,
    this.lineThrough = false,
  });
  final String price;
  final String currencySign;
  final bool islarge;
  final bool lineThrough;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        /// Price
        Text(currencySign + price,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: islarge
                ? Theme.of(context).textTheme.headlineMedium!.apply(
                    decoration: lineThrough ? TextDecoration.lineThrough : null)
                : Theme.of(context).textTheme.titleLarge!.apply(
                    decoration:
                        lineThrough ? TextDecoration.lineThrough : null)),

        Container(
          decoration: const BoxDecoration(
            color: TColors.black,
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(TSizes.productImageRadius),
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
    );
  }
}
