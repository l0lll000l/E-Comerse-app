import 'package:flutter/material.dart';
import 'package:flutter_application_1/Common/widgets/AppBar/appbar.dart';
import 'package:flutter_application_1/Common/widgets/AppBar/cart_counter_icon.dart';
import 'package:flutter_application_1/Common/widgets/AppBar/search_container.dart';
import 'package:flutter_application_1/Common/widgets/AppBar/section_heading.dart';
import 'package:flutter_application_1/Common/widgets/AppBar/tabbar.dart';
import 'package:flutter_application_1/Common/widgets/Gridview/gridview_layout.dart';
import 'package:flutter_application_1/Feature/Shop/Controller/category_controller.dart';
import 'package:flutter_application_1/Feature/Shop/Controller/productController/product_controller.dart';
import 'package:flutter_application_1/Feature/Shop/Screens/AllBrands/all_brands.dart';
import 'package:flutter_application_1/Feature/Shop/Screens/BrandProducts/brand_products.dart';
import 'package:flutter_application_1/Feature/Shop/Screens/Store/widgets/catogory_tab.dart';
import 'package:flutter_application_1/Feature/Shop/Screens/Store/widgets/featured_brands.dart';
import 'package:flutter_application_1/Utils/Helpers/helper_functions.dart';
import 'package:flutter_application_1/Utils/constants/colors.dart';
import 'package:flutter_application_1/Utils/constants/sizes.dart';
import 'package:get/get.dart';

class Store extends StatelessWidget {
  const Store({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final productController = Get.put(ProductController());
    final categories = CategoryController.instance.featuredCategories;
    final dark = THelperFunctions.isDarkMode(context);
    return DefaultTabController(
      length: categories.length,
      child: Scaffold(
        appBar: TAppBar(
          title: Text(
            'Store',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          actions: [
            TCartCounterIcon(
              iconColor: dark ? TColors.light : TColors.dark,
              onpressed: () {},
            )
          ],
        ),
        body: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  automaticallyImplyLeading: false,
                  floating: true,
                  backgroundColor: dark ? TColors.dark : TColors.light,
                  pinned: true,
                  expandedHeight: 440,
                  flexibleSpace: Padding(
                    padding: const EdgeInsets.all(TSizes.defaultSpace),
                    child: ListView(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        const SizedBox(height: TSizes.spaceBtwItems),

                        /// Search bar
                        const TSearchContainer(
                          padding: EdgeInsets.all(0),
                          showBorder: true,
                        ),
                        const SizedBox(height: TSizes.spaceBtwItems),

                        /// section heading
                        TsectionHeading(
                          onpressed: () {
                            Get.to(() => const AllBrands());
                          },
                          showActionButton: true,
                          title: 'Featured Brands',
                        ),

                        /// Featured Brands
                        TGridview(
                            itemcount: productController.featuredBrands.length,
                            mainAxisExtent: 75,
                            itemBuilder: (context, index) => FeaturedBrands(
                                  brand:
                                      productController.featuredBrands[index],
                                  onTap: () => Get.to(() => BrandedProducts(
                                        brand: productController
                                            .featuredBrands[index],
                                      )),
                                  showBorder: true,
                                ))
                      ],
                    ),
                  ),
                  bottom: TTabBar(
                    isScrollable: true,
                    labelColor: dark ? TColors.light : TColors.primary,
                    tabs: categories
                        .map((category) => Tab(
                              child: Text(category.name),
                            ))
                        .toList(),
                    indicatorColor: TColors.primary,
                  ),
                ),
              ];
            },
            body: TabBarView(
                children: categories
                    .map((Category) => Tcatogory(
                          category: Category,
                        ))
                    .toList())),
      ),
    );
  }
}
