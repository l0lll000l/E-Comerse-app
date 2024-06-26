import 'package:flutter/material.dart';

class ProductTitleText extends StatelessWidget {
  const ProductTitleText({
    super.key,
    required this.text,
    this.smallSize = false,
    this.maxlines = 2,
    this.textAlign = TextAlign.center,
  });
  final String text;
  final bool smallSize;
  final int maxlines;
  final TextAlign textAlign;
  @override
  Widget build(BuildContext context) {
    return Text(
      maxLines: maxlines,
      text,
      style: smallSize
          ? Theme.of(context).textTheme.labelLarge
          : Theme.of(context).textTheme.titleSmall,
      overflow: TextOverflow.ellipsis,
      textAlign: textAlign,
    );
  }
}
