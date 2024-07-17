import 'package:flutter/material.dart';
import 'package:flutter_application_1/Common/widgets/AppBar/appbar.dart';
import 'package:flutter_application_1/Common/widgets/Shimmer/vertical_product_shimmer.dart';
import 'package:flutter_application_1/Feature/Shop/Controller/productController/product_controller.dart';
import 'package:flutter_application_1/Feature/Shop/Model/brand_model.dart';
import 'package:flutter_application_1/Feature/Shop/Screens/Store/widgets/featured_brands.dart';
import 'package:flutter_application_1/Feature/Shop/Screens/searchProduct/widgets/sortable_products.dart';
import 'package:flutter_application_1/Utils/Helpers/cloud_helper_functions.dart';
import 'package:flutter_application_1/Utils/constants/sizes.dart';

class BrandedProducts extends StatelessWidget {
  const BrandedProducts({super.key, this.brand});
  final BrandModel? brand;

  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;
    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text(brand != null ? brand!.name : ''),
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children: [
            /// Brand
            FeaturedBrands(
              brand: brand,
              showBorder: true,
            ),
            const SizedBox(height: TSizes.spaceBtwItems),

            /// products
            FutureBuilder(
              future: controller.getBrandProducts(brandId: brand!.id),
              builder: (context, snapshot) {
                const loader = IVerticalProductShimmer();
                final widget = TCloudHelperFunctions.checkMultiRecordState(
                    snapshot: snapshot, loader: loader);
                if (widget != null) {
                  return widget;
                }
                final brandProducts = snapshot.data;
                return TsortableProducts(
                  products: brandProducts!,
                );
              },
            )
          ],
        ),
      )),
    );
  }
}
