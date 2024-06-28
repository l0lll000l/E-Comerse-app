import 'package:flutter/material.dart';
import 'package:flutter_application_1/Utils/constants/colors.dart';

class ProductTitleText extends StatelessWidget {
  const ProductTitleText({
    super.key,
    required this.text,
    this.smallSize = false,
    this.maxlines = 2,
    this.textAlign = TextAlign.center,
    this.textColor = TColors.light,
  });
  final String text;
  final bool smallSize;
  final int maxlines;
  final TextAlign textAlign;
  final Color textColor;
  @override
  Widget build(BuildContext context) {
    return Text(
      maxLines: maxlines,
      text,
      style: smallSize
          ? Theme.of(context).textTheme.labelLarge!.apply(color: textColor)
          : Theme.of(context).textTheme.titleSmall!.apply(color: textColor),
      overflow: TextOverflow.ellipsis,
      textAlign: textAlign,
    );
  }
}
