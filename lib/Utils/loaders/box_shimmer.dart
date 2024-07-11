import 'package:flutter/material.dart';
import 'package:flutter_application_1/Utils/constants/sizes.dart';
import 'package:flutter_application_1/Utils/loaders/shimmer.dart';

class IboxesShimmer extends StatelessWidget {
  const IboxesShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          children: [
            Expanded(child: TShimmerEffect(width: 150, height: 110)),
            SizedBox(width: TSizes.spaceBtwItems),
            Expanded(child: TShimmerEffect(width: 150, height: 110)),
            SizedBox(width: TSizes.spaceBtwItems),
            Expanded(child: TShimmerEffect(width: 150, height: 110)),
          ],
        )
      ],
    );
  }
}
