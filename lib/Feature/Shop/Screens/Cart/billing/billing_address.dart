import 'package:flutter/material.dart';
import 'package:flutter_application_1/Common/widgets/AppBar/section_heading.dart';
import 'package:flutter_application_1/Utils/constants/colors.dart';
import 'package:flutter_application_1/Utils/constants/sizes.dart';

class TBillingAddressSection extends StatelessWidget {
  const TBillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const TsectionHeading(
          title: 'Shipping Address',
          showActionButton: true,
          buttonTitle: 'Change',
        ),
        const SizedBox(height: TSizes.spaceBtwItems / 2),
        Text('Athul m p', style: Theme.of(context).textTheme.bodyMedium),
        const SizedBox(height: TSizes.spaceBtwItems / 2),
        Row(
          children: [
            const Icon(
              Icons.phone,
              color: TColors.grey,
              size: 16,
            ),
            const SizedBox(width: TSizes.spaceBtwItems / 2),
            Text('+91 987456321', style: Theme.of(context).textTheme.bodyMedium)
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems / 2),
        Row(
          children: [
            const Icon(
              Icons.location_on,
              color: TColors.grey,
              size: 16,
            ),
            const SizedBox(width: TSizes.spaceBtwItems / 2),
            Text('south lantina,marine 87456,usa',
                style: Theme.of(context).textTheme.bodyMedium)
          ],
        ),
      ],
    );
  }
}
