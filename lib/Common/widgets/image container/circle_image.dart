import 'package:flutter/material.dart';
import 'package:flutter_application_1/Utils/constants/sizes.dart';

class TCircleImage extends StatelessWidget {
  const TCircleImage({
    super.key,
    this.isNetworkImage = false,
    required this.imageurl,
    this.fit = BoxFit.cover,
    required this.backgroundColor,
    required this.overlayColor,
    this.width = 56,
    this.height = 56,
    this.padding = const EdgeInsets.all(TSizes.sm),
  });
  final String imageurl;
  final Color? backgroundColor;
  final Color? overlayColor;
  final bool isNetworkImage;
  final BoxFit? fit;
  final double? width;
  final double? height;
  final EdgeInsets? padding;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100), color: backgroundColor),
      child: Image(
          fit: fit,
          color: overlayColor,
          image: isNetworkImage
              ? NetworkImage(imageurl)
              : AssetImage(imageurl) as ImageProvider),
    );
  }
}
