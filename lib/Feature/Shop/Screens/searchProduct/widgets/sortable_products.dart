import 'package:flutter/material.dart';
import 'package:flutter_application_1/Common/widgets/Gridview/gridview_layout.dart';
import 'package:flutter_application_1/Common/widgets/Product/product_card_vertical.dart';
import 'package:flutter_application_1/Feature/Shop/Controller/allProducts_controller.dart';
import 'package:flutter_application_1/Feature/Shop/Model/product_model.dart';
import 'package:flutter_application_1/Utils/constants/sizes.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class TsortableProducts extends StatelessWidget {
  const TsortableProducts({
    super.key,
    required this.products,
  });
  final List<ProductModel> products;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AllProductsController());
    controller.assignProducts(products);
    return Column(
      children: [
        /// dropdown button
        DropdownButtonFormField(
          value: controller.selectedSortOption.value,
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
          onChanged: (value) {
            controller.sortProducts(value.toString());
          },
        ),
        const SizedBox(height: TSizes.spaceBtwSections / 2),

        /// grid view products
        Obx(
          () => TGridview(
              itemcount: controller.products.length,
              mainAxisExtent: 260,
              itemBuilder: (_, index) =>
                  TProductCardVertical(product: controller.products[index])),
        )
      ],
    );
  }
}
