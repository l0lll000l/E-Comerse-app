import 'package:flutter/material.dart';
import 'package:flutter_application_1/Utils/constants/sizes.dart';

class TGridview extends StatelessWidget {
  const TGridview({
    super.key,
    this.itemcount = 6,
    required this.itemBuilder,
    this.mainAxisExtent = 270,
  });
  final int itemcount;
  final Widget? Function(BuildContext, int) itemBuilder;
  final double mainAxisExtent;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(0),
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: itemcount,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisExtent: mainAxisExtent,
          mainAxisSpacing: TSizes.gridViewSpacing,
          crossAxisSpacing: TSizes.gridViewSpacing,
          crossAxisCount: 2),
      itemBuilder: itemBuilder,
    );
  }
}
