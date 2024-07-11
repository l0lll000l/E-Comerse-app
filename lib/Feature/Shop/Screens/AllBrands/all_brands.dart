import 'package:flutter/material.dart';
import 'package:flutter_application_1/Common/widgets/AppBar/appbar.dart';
import 'package:flutter_application_1/Common/widgets/AppBar/section_heading.dart';
import 'package:flutter_application_1/Common/widgets/Gridview/gridview_layout.dart';
import 'package:flutter_application_1/Feature/Shop/Controller/productController/product_controller.dart';
import 'package:flutter_application_1/Feature/Shop/Model/brand_model.dart';
import 'package:flutter_application_1/Feature/Shop/Screens/searchProduct/all_products.dart';
import 'package:flutter_application_1/Feature/Shop/Screens/Store/widgets/featured_brands.dart';
import 'package:flutter_application_1/Utils/constants/sizes.dart';
import 'package:get/get.dart';

class AllBrands extends StatelessWidget {
  const AllBrands({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final productController = ProductController.instance;
    return Scaffold(
      appBar: const TAppBar(
        showBackArrow: true,
        title: Text('Brands'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(children: [
            ///header
            const TsectionHeading(title: 'Brands'),
            const SizedBox(height: TSizes.spaceBtwItems),
            TGridview(
                itemcount: productController.featuredBrands.length,
                mainAxisExtent: 75,
                itemBuilder: (context, index) => FeaturedBrands(
                    brand: productController.featuredBrands[index],
                    showBorder: true,
                    onTap: () => Get.to(() => const AllProducts(
                          title: '',
                        ))))
          ]),
        ),
      ),
    );
  }
}
