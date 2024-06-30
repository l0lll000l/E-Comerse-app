import 'package:flutter/material.dart';
import 'package:flutter_application_1/Common/widgets/AppBar/appbar.dart';
import 'package:flutter_application_1/Feature/Shop/Screens/profile/Cart/Widgets/cart_item_listview.dart';
import 'package:flutter_application_1/Feature/Shop/Screens/profile/Cart/checkout.dart';

import 'package:flutter_application_1/Utils/constants/sizes.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
          showBackArrow: true,
          title:
              Text('Cart', style: Theme.of(context).textTheme.headlineSmall)),
      body: const Padding(
        padding: EdgeInsets.all(TSizes.defaultSpace),
        child: TCartItemListView(),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(
            bottom: TSizes.defaultSpace / 2,
            left: TSizes.defaultSpace,
            right: TSizes.defaultSpace),
        child: ElevatedButton(
            onPressed: () {
              Get.to(() => const CheckOutPage());
            },
            child: const Text('Checkout \$270')),
      ),
    );
  }
}
