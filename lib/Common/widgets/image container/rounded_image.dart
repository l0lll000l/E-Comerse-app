import 'package:flutter/material.dart';
import 'package:flutter_application_1/Utils/constants/colors.dart';
import 'package:flutter_application_1/Utils/constants/sizes.dart';

class TRoundedImage extends StatelessWidget {
  const TRoundedImage({
    super.key,
    this.width = double.infinity,
    this.height = double.infinity,
    required this.imageurl,
    this.applyImageRadius = false,
    this.border,
    this.fit = BoxFit.cover,
    this.padding,
    this.isNetworkImage = false,
    this.onPressed,
    this.backGroundColor = TColors.light,
    this.borderRadius = TSizes.md,
    this.imageradius = TSizes.md,
  });
  final double? width, height;
  final String imageurl;
  final bool applyImageRadius;
  final Color backGroundColor;
  final BoxBorder? border;
  final BoxFit? fit;
  final EdgeInsetsGeometry? padding;
  final bool isNetworkImage;
  final VoidCallback? onPressed;
  final double borderRadius;
  final double imageradius;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: height,
        width: width,
        padding: padding,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius),
            border: border,
            color: backGroundColor),
        child: ClipRRect(
            borderRadius: applyImageRadius
                ? BorderRadius.circular(imageradius)
                : BorderRadius.zero,
            child: Image(
              fit: fit,
              // clip: Clip.hardEdge,
              image: isNetworkImage
                  ? NetworkImage(imageurl)
                  : AssetImage(imageurl) as ImageProvider,
            )),
      ),
    );
  }
}
