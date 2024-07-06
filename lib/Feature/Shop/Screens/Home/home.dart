import 'package:flutter/material.dart';
import 'package:flutter_application_1/Common/widgets/AppBar/search_container.dart';
import 'package:flutter_application_1/Common/widgets/AppBar/section_heading.dart';
import 'package:flutter_application_1/Common/widgets/Gridview/gridview_layout.dart';
import 'package:flutter_application_1/Common/widgets/Product/product_card_vertical.dart';
import 'package:flutter_application_1/Common/widgets/Shimmer/vertical_product_shimmer.dart';
import 'package:flutter_application_1/Common/widgets/customShapes/primary_header.dart';
import 'package:flutter_application_1/Feature/Shop/Controller/category_controller.dart';
import 'package:flutter_application_1/Feature/Shop/Controller/homecontroller/banner_controller.dart';
import 'package:flutter_application_1/Feature/Shop/Controller/productController/product_controller.dart';
import 'package:flutter_application_1/Feature/Shop/Screens/Home/Widgets/home_appbar.dart';
import 'package:flutter_application_1/Feature/Shop/Screens/Home/Widgets/home_catogories.dart';
import 'package:flutter_application_1/Feature/Shop/Screens/Home/Widgets/promo.dart';
import 'package:flutter_application_1/Feature/Shop/Screens/searchProduct/all_products.dart';
import 'package:flutter_application_1/Utils/constants/sizes.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductController());
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          BannerController.instance.fetchBanners();
          CategoryController.instance.fetchCategory();
          ProductController.instance.fetchFeaturedProducts();
        },
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const PrimaryHeader(
              child: Column(
                children: [
                  /// AppBar
                  ThomeAppBar(),
                  SizedBox(height: TSizes.spaceBtwItems / 2),

                  /// Search bar
                  TSearchContainer(),
                  SizedBox(height: TSizes.spaceBtwItems / 2),

                  ///  catogories
                  HomeCategories(), SizedBox(height: TSizes.spaceBtwSections),
                ],
              ),
            ),

            /// body
            Padding(
                padding: const EdgeInsets.all(TSizes.defaultSpace),
                child: Column(
                  children: [
                    /// Promo slider
                    const TpromoSlider(),
                    const SizedBox(height: TSizes.spaceBtwItems),
                    TsectionHeading(
                      onpressed: () {
                        Get.to(() => const AllProducts());
                      },
                      showActionButton: true,
                    ),

                    /// Popular products
                    Obx(
                      () {
                        if (controller.isLoading.value) {
                          return IVerticalProductShimmer();
                        }
                        if (controller.featuredProducts.isEmpty) {
                          return Center(
                            child: Text(
                              'No data found',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          );
                        }
                        return TGridview(
                            mainAxisExtent: 269,
                            itemcount: controller.featuredProducts.length,
                            itemBuilder: (_, index) {
                              final product =
                                  controller.featuredProducts[index];

                              return TProductCardVertical(
                                product: product,
                                sliderImageList: product.images ?? [],
                              );
                            });
                      },
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
