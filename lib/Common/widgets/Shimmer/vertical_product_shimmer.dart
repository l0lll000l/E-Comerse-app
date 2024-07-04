import 'package:flutter/material.dart';
import 'package:flutter_application_1/Common/widgets/Gridview/gridview_layout.dart';
import 'package:flutter_application_1/Utils/constants/sizes.dart';
import 'package:flutter_application_1/Utils/loaders/shimmer.dart';

class IVerticalProductShimmer extends StatelessWidget {
  const IVerticalProductShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return TGridview(
      itemBuilder: (_, __) {
        return const SizedBox(
          width: 180,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TShimmerEffect(width: 180, height: 180),
              SizedBox(height: TSizes.spaceBtwItems),
              //text
              TShimmerEffect(width: 160, height: 15),
              SizedBox(height: TSizes.spaceBtwItems),
              TShimmerEffect(width: 110, height: 15),
            ],
          ),
        );
      },
    );
  }
}
