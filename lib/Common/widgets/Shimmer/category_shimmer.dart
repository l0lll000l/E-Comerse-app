import 'package:flutter/material.dart';
import 'package:flutter_application_1/Utils/constants/sizes.dart';
import 'package:flutter_application_1/Utils/loaders/shimmer.dart';

class ICategoryShimmer extends StatelessWidget {
  const ICategoryShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.separated(
        separatorBuilder: (context, index) {
          return SizedBox(width: 10);
        },
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return Column(
            children: [
              TShimmerEffect(width: 55, height: 55, radius: 55),
              SizedBox(height: TSizes.spaceBtwItems / 2),
              TShimmerEffect(width: 55, height: 8)
            ],
          );
        },
      ),
    );
  }
}
