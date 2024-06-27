import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/Common/widgets/AppBar/appbar.dart';
import 'package:flutter_application_1/Common/widgets/AppBar/cart_counter_icon.dart';
import 'package:flutter_application_1/Common/widgets/AppBar/search_container.dart';
import 'package:flutter_application_1/Common/widgets/AppBar/section_heading.dart';
import 'package:flutter_application_1/Common/widgets/AppBar/tabbar.dart';
import 'package:flutter_application_1/Common/widgets/Gridview/gridview_layout.dart';
import 'package:flutter_application_1/Common/widgets/Product/product_card_vertical.dart';
import 'package:flutter_application_1/Common/widgets/Product/rounded_container.dart';
import 'package:flutter_application_1/Feature/Shop/Screens/Store/widgets/catogory_tab.dart';

import 'package:flutter_application_1/Feature/Shop/Screens/Store/widgets/featured_brands.dart';
import 'package:flutter_application_1/Utils/Helpers/helper_functions.dart';
import 'package:flutter_application_1/Utils/constants/colors.dart';
import 'package:flutter_application_1/Utils/constants/image_strings.dart';
import 'package:flutter_application_1/Utils/constants/sizes.dart';

class Store extends StatelessWidget {
  const Store({super.key, required this.images});
  final List<String> images;
  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return DefaultTabController(
      length: 5,
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
                        const TsectionHeading(
                          showActionButton: true,
                          title: 'Featured Brands',
                        ),

                        /// Featured Brands
                        TGridview(
                            itemcount: 4,
                            mainAxisExtent: 75,
                            itemBuilder: (BuildContext, int) =>
                                const FeaturedBrands(
                                  showBorder: true,
                                ))
                      ],
                    ),
                  ),
                  bottom: TTabBar(
                    isScrollable: true,
                    labelColor: dark ? TColors.light : TColors.primary,
                    tabs: const [
                      Tab(child: Text('Sports')),
                      Tab(child: Text('Furnitures')),
                      Tab(child: Text('Electronic')),
                      Tab(child: Text('cloths')),
                      Tab(child: Text('Cosmetics')),
                    ],
                    indicatorColor: TColors.primary,
                  ),
                ),
              ];
            },
            body: TabBarView(children: [
              Tcatogory(images: images),
              Tcatogory(images: images),
              Tcatogory(images: images),
              Tcatogory(images: images),
              Tcatogory(images: images),
            ])),
      ),
    );
  }
}
