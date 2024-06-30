import 'package:flutter/material.dart';
import 'package:flutter_application_1/Common/widgets/AppBar/appbar.dart';
import 'package:flutter_application_1/Feature/Shop/Screens/Store/widgets/featured_brands.dart';
import 'package:flutter_application_1/Feature/Shop/Screens/searchProduct/widgets/sortable_products.dart';
import 'package:flutter_application_1/Utils/constants/sizes.dart';

class BrandedProducts extends StatelessWidget {
  const BrandedProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: TAppBar(
        title: Text('Nike'),
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children: [
            /// Brand
            FeaturedBrands(
              showBorder: true,
            ),
            SizedBox(height: TSizes.spaceBtwItems),

            /// products
            TsortableProducts()
          ],
        ),
      )),
    );
  }
}
