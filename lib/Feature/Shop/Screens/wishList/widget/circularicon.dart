import 'package:flutter/material.dart';
import 'package:flutter_application_1/Utils/Helpers/helper_functions.dart';
import 'package:flutter_application_1/Utils/constants/colors.dart';
import 'package:iconsax/iconsax.dart';

class CircleIcon extends StatelessWidget {
  const CircleIcon({
    super.key,
    this.icon = Iconsax.heart5,
    this.height = 40,
    this.width = 40,
    this.lightmode = TColors.light,
    this.darkMode = TColors.dark,
    this.lightmodebackground = TColors.light,
    this.darkModebackground = TColors.dark,
    this.iconsize,
    this.iconColor = Colors.red,
    this.onPressed,
  });
  final IconData icon;
  final void Function()? onPressed;
  final double? height;
  final double? width;
  final Color lightmode;
  final Color darkMode, iconColor;
  final Color lightmodebackground;
  final Color darkModebackground;
  final double? iconsize;
  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          color: dark
              ? lightmodebackground.withOpacity(0.3)
              : darkModebackground.withOpacity(0.3),
          borderRadius: BorderRadius.circular(20)),
      child: Center(
        child: IconButton(
            onPressed: onPressed,
            icon: Icon(size: iconsize, icon, color: iconColor)),
      ),
    );
  }
}
