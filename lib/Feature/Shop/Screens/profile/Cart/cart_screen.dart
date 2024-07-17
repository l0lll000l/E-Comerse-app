import 'package:flutter/material.dart';
import 'package:flutter_application_1/Common/widgets/AppBar/appbar.dart';
import 'package:flutter_application_1/Feature/Shop/Controller/cart_controller.dart';
import 'package:flutter_application_1/Feature/Shop/Screens/profile/Cart/Widgets/cart_item_listview.dart';
import 'package:flutter_application_1/Feature/Shop/Screens/profile/Cart/checkout.dart';
import 'package:flutter_application_1/Navigation_menu.dart';
import 'package:flutter_application_1/Utils/constants/image_strings.dart';

import 'package:flutter_application_1/Utils/constants/sizes.dart';
import 'package:flutter_application_1/Utils/loaders/animation_loader.dart';
import 'package:flutter_application_1/Utils/loaders/loaders.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;
    return Scaffold(
      appBar: TAppBar(
          showBackArrow: true,
          title:
              Text('Cart', style: Theme.of(context).textTheme.headlineSmall)),
      body: Obx(() {
        final emptyWidget = TAnimationLoaderWidget(
          text: 'Whoops ! cart is empty',
          animation: TImages.empty,
          showactionButton: true,
          actionText: 'Let\'s fill it',
          onPressed: () {
            Get.off(() => const NavigationMenu());
          },
        );
        return controller.cartItems.isEmpty
            ? emptyWidget
            : const Padding(
                padding: EdgeInsets.all(TSizes.defaultSpace),
                child: TCartItemListView(),
              );
      }),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(
            bottom: TSizes.defaultSpace / 2,
            left: TSizes.defaultSpace,
            right: TSizes.defaultSpace),
        child: ElevatedButton(
            onPressed: () {
              controller.totalCartprice.value > 0
                  ? Get.to(() => const CheckOutPage())
                  : Tloaders.customToast(message: 'Add products to cart');
            },
            child:
                Obx(() => Text('Checkout ${controller.totalCartprice.value}'))),
      ),
    );
  }
}
