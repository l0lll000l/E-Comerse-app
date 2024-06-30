import 'package:flutter/material.dart';
import 'package:flutter_application_1/Utils/constants/sizes.dart';

class TbillingAmountSection extends StatelessWidget {
  const TbillingAmountSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
                child: Text('Subtotal',
                    style: Theme.of(context).textTheme.bodyMedium)),
            Text('\$256', style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        SizedBox(height: TSizes.spaceBtwItems / 2),
        Row(
          children: [
            Expanded(
                child: Text('Shipping Fee',
                    style: Theme.of(context).textTheme.bodyMedium)),
            Text('\$40', style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        SizedBox(height: TSizes.spaceBtwItems / 2),
        Row(
          children: [
            Expanded(
                child: Text('Tax Fee',
                    style: Theme.of(context).textTheme.bodyMedium)),
            Text('\$2', style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        Row(
          children: [
            Expanded(
                child: Text('Order Total',
                    style: Theme.of(context).textTheme.bodyMedium)),
            Text('\$305', style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
      ],
    );
  }
}
