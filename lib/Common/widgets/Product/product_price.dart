import 'package:flutter/material.dart';
import 'package:flutter_application_1/Utils/constants/colors.dart';

class ProductPrice extends StatelessWidget {
  const ProductPrice({
    super.key,
    required this.price,
    this.currencySign = '\$',
    this.islarge = false,
    this.lineThrough = false,
    this.textColor = TColors.light,
  });
  final String price;
  final String currencySign;
  final bool islarge;
  final bool lineThrough;
  final Color textColor;
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
                    color: textColor,
                    decoration: lineThrough ? TextDecoration.lineThrough : null)
                : Theme.of(context).textTheme.titleLarge!.apply(
                    color: textColor,
                    decoration:
                        lineThrough ? TextDecoration.lineThrough : null)),
      ],
    );
  }
}
