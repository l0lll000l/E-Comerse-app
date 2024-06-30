import 'package:flutter/material.dart';
import 'package:flutter_application_1/Common/widgets/Gridview/gridview_layout.dart';
import 'package:flutter_application_1/Common/widgets/Product/product_card_vertical.dart';
import 'package:flutter_application_1/Utils/constants/sizes.dart';
import 'package:iconsax/iconsax.dart';

class TsortableProducts extends StatelessWidget {
  const TsortableProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// dropdown button
        DropdownButtonFormField(
          decoration: const InputDecoration(prefixIcon: Icon(Iconsax.sort)),
          items: const [
            'Name',
            'Brand',
            'Higher Price',
            'Lower Price',
            'sale',
            'newest',
            'popular',
          ]
              .map((option) => DropdownMenuItem(
                    value: option,
                    child: Text(option),
                  ))
              .toList(),
          onChanged: (value) {},
        ),
        const SizedBox(height: TSizes.spaceBtwSections / 2),

        /// grid view products
        TGridview(
            mainAxisExtent: 260,
            itemBuilder: (_, __) => const TProductCardVertical())
      ],
    );
  }
}
