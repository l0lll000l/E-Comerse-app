import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/Common/widgets/AppBar/appbar.dart';
import 'package:flutter_application_1/Common/widgets/Gridview/gridview_layout.dart';
import 'package:flutter_application_1/Common/widgets/Product/product_card_vertical.dart';
import 'package:flutter_application_1/Common/widgets/Shimmer/vertical_product_shimmer.dart';
import 'package:flutter_application_1/Feature/Shop/Controller/favourite_controller.dart';
import 'package:flutter_application_1/Feature/Shop/Controller/productController/product_controller.dart';
import 'package:flutter_application_1/Navigation_menu.dart';
import 'package:flutter_application_1/Utils/Helpers/cloud_helper_functions.dart';
import 'package:flutter_application_1/Utils/Helpers/helper_functions.dart';
import 'package:flutter_application_1/Utils/constants/colors.dart';
import 'package:flutter_application_1/Utils/constants/sizes.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:iconsax/iconsax.dart';

class WishList extends StatelessWidget {
  const WishList({super.key});

  @override
  Widget build(BuildContext context) {
    final favouriteController = Get.put(FavouritesController());
    final controller = Get.put(NavigationController());
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: TAppBar(
        actions: [
          IconButton(
              onPressed: () {
                controller.selectedIndex.value = 0;
              },
              icon: const Icon(Iconsax.add),
              color: dark ? TColors.light : TColors.dark)
        ],
        title: Text(
          'wishList',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              Obx(
                () => FutureBuilder(
                    future: favouriteController.favouriteProducts(),
                    builder: (context, snapshot) {
                      const loader = IVerticalProductShimmer();
                      final widget =
                          TCloudHelperFunctions.checkMultiRecordState(
                              snapshot: snapshot, loader: loader);
                      if (widget != null) {
                        return widget;
                      }
                      final products = snapshot.data;

                      return TGridview(
                        mainAxisExtent: 269,
                        itemcount: products!.length,
                        itemBuilder: (_, index) => TProductCardVertical(
                          product: products[index],
                        ),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
