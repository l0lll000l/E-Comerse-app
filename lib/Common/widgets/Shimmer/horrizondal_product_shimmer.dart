import 'package:flutter/material.dart';
import 'package:flutter_application_1/Utils/constants/sizes.dart';
import 'package:flutter_application_1/Utils/loaders/shimmer.dart';

class IHorrizondalProductShimmer extends StatelessWidget {
  const IHorrizondalProductShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: 3,
      separatorBuilder: (context, index) {
        return SizedBox(height: TSizes.spaceBtwItems);
      },
      itemBuilder: (_, index) {
        return const SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TShimmerEffect(width: double.infinity, height: 100),
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
