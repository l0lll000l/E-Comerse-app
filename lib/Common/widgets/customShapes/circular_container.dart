import 'package:flutter/material.dart';
import 'package:flutter_application_1/Utils/constants/colors.dart';

class TCircularContainer extends StatelessWidget {
  const TCircularContainer(
      {super.key,
      this.width = 400,
      this.height = 400,
      this.radius = 400,
      this.padding = 0,
      this.backgroundColor = TColors.light,
      this.child,
      this.margin});
  final double width;
  final double height;
  final double? radius;
  final double? padding;
  final Widget? child;
  final Color backgroundColor;
  final EdgeInsets? margin;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      width: width,
      height: height,
      padding: EdgeInsets.all(padding!),
      decoration: BoxDecoration(
          color: backgroundColor, borderRadius: BorderRadius.circular(radius!)),
      child: child,
    );
  }
}
