import 'package:flutter/material.dart';
import 'package:flutter_application_1/Utils/constants/colors.dart';
import 'package:flutter_application_1/Utils/constants/sizes.dart';
import 'package:flutter_application_1/Utils/device/device_utility.dart';

class RatingProgressIndicator extends StatelessWidget {
  const RatingProgressIndicator({
    super.key,
    this.star = '5',
    this.value = 0.3,
  });
  final String star;
  final double value;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          star,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        const SizedBox(width: TSizes.spaceBtwItems / 4),
        SizedBox(
          width: TDeviceUtils.getScreenWidth(context) * 0.5,
          child: LinearProgressIndicator(
            value: value,
            backgroundColor: TColors.grey,
            minHeight: 11,
            valueColor: const AlwaysStoppedAnimation(TColors.primary),
            borderRadius: BorderRadius.circular(7),
          ),
        )
      ],
    );
  }
}
