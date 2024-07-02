import 'package:flutter/material.dart';
import 'package:flutter_application_1/Common/widgets/AppBar/section_heading.dart';
import 'package:flutter_application_1/Common/widgets/Gridview/gridview_layout.dart';
import 'package:flutter_application_1/Common/widgets/Product/product_card_vertical.dart';
import 'package:flutter_application_1/Feature/Personalization/Controller/user_controller.dart';
import 'package:flutter_application_1/Feature/Shop/Screens/searchProduct/all_products.dart';

import 'package:flutter_application_1/Feature/Shop/Screens/Home/Widgets/home_appbar.dart';
import 'package:flutter_application_1/Common/widgets/AppBar/search_container.dart';
import 'package:flutter_application_1/Common/widgets/customShapes/primary_header.dart';
import 'package:flutter_application_1/Feature/Shop/Screens/Home/Widgets/home_catogories.dart';
import 'package:flutter_application_1/Feature/Shop/Screens/Home/Widgets/promo.dart';
import 'package:flutter_application_1/Utils/constants/image_strings.dart';

import 'package:flutter_application_1/Utils/constants/sizes.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          UserController.instance.fetchUserRecord();
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
                    const TpromoSlider(
                      banners: [
                        TImages.banner1,
                        TImages.banner2,
                        TImages.banner3
                      ],
                    ),
                    const SizedBox(height: TSizes.spaceBtwItems),
                    TsectionHeading(
                      onpressed: () {
                        Get.to(() => const AllProducts());
                      },
                      showActionButton: true,
                    ),

                    /// Popular products
                    TGridview(
                      itemcount: 6,
                      itemBuilder: (BuildContext, int) =>
                          const TProductCardVertical(),
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
