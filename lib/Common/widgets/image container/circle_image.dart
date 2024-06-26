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
  });
  final String imageurl;
  final Color? backgroundColor;
  final Color? overlayColor;
  final bool isNetworkImage;
  final BoxFit? fit;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 56,
      height: 56,
      padding: const EdgeInsets.all(TSizes.sm),
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
