import 'package:flutter/material.dart';
import 'package:flutter_application_1/Utils/Helpers/helper_functions.dart';
import 'package:flutter_application_1/Utils/constants/colors.dart';
import 'package:iconsax/iconsax.dart';

class CircleIcon extends StatelessWidget {
  const CircleIcon({
    super.key,
    this.icon = Iconsax.heart5,
    this.top = 0,
    this.right = 0,
    this.bottom,
    this.left,
    this.height = 40,
    this.width = 40,
  });
  final IconData icon;
  final double? top;
  final double? right;
  final double? bottom;
  final double? left;
  final double? height;
  final double? width;
  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Positioned(
      right: right,
      top: top,
      left: left,
      bottom: bottom,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            color: dark
                ? TColors.dark.withOpacity(0.9)
                : TColors.light.withOpacity(0.9),
            borderRadius: BorderRadius.circular(20)),
        child: IconButton(
            onPressed: () {},
            icon: Icon(icon, color: dark ? TColors.light : TColors.dark)),
      ),
    );
  }
}
