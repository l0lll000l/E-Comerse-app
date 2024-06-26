import 'package:flutter/material.dart';
import 'package:flutter_application_1/Utils/constants/colors.dart';

class TShadowStyle {
  static final verticalProductShadow = BoxShadow(
      color: TColors.darkerGrey.withOpacity(0.1),
      blurRadius: 50,
      spreadRadius: 7,
      offset: const Offset(0, 2));
  static final horrizondalProductShadow = BoxShadow(
      color: TColors.darkerGrey.withOpacity(0.1),
      blurRadius: 50,
      spreadRadius: 7,
      offset: const Offset(0, 2));
}
