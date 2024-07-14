import 'package:flutter/material.dart';
import 'package:flutter_application_1/Common/widgets/AppBar/appbar.dart';
import 'package:flutter_application_1/Common/widgets/Product/rounded_container.dart';
import 'package:flutter_application_1/Common/widgets/success_screen/Success.dart';
import 'package:flutter_application_1/Feature/Shop/Controller/cart_controller.dart';
import 'package:flutter_application_1/Feature/Shop/Controller/order_controller.dart';
import 'package:flutter_application_1/Feature/Shop/Screens/profile/Cart/Widgets/cart_item_listview.dart';
import 'package:flutter_application_1/Feature/Shop/Screens/profile/Cart/billing/billing_address.dart';
import 'package:flutter_application_1/Feature/Shop/Screens/profile/Cart/billing/billing_amount_section.dart';
import 'package:flutter_application_1/Feature/Shop/Screens/profile/Cart/billing/billing_payment_section.dart';
import 'package:flutter_application_1/Navigation_menu.dart';
import 'package:flutter_application_1/Utils/Helpers/helper_functions.dart';
import 'package:flutter_application_1/Utils/constants/colors.dart';
import 'package:flutter_application_1/Utils/constants/image_strings.dart';
import 'package:flutter_application_1/Utils/constants/sizes.dart';
import 'package:get/get.dart';

import 'Widgets/coupen_code.dart';

class CheckOutPage extends StatelessWidget {
  const CheckOutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;
    final orderController = Get.put(OrderController());
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text('Order Review',
            style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: const AlwaysScrollableScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// cart item
              const TCartItemListView(showaddremoveButton: false),
              const SizedBox(height: TSizes.spaceBtwItems),

              ///Coupen textfield
              const TCoupenCode(),
              const SizedBox(height: TSizes.spaceBtwItems),

              ///Billing section
              TRoundedContainer(
                padding: const EdgeInsets.all(TSizes.defaultSpace),
                showBorder: true,
                backgroundColor: dark ? TColors.dark : TColors.light,
                child: const Column(
                  children: [
                    ///price details
                    TbillingAmountSection(),

                    ///divider
                    Divider(),
                    SizedBox(height: TSizes.spaceBtwItems / 2),

                    ///payment method
                    BillingPaymentSection(),
                    SizedBox(height: TSizes.spaceBtwItems / 2),

                    ///address
                    TBillingAddressSection(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),

      ///checkout button
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(

            ///success screen
            onPressed: () {
              orderController.processOrders(
                  cartController.totalCartprice.value +
                      40 +
                      cartController.totalCartprice.value * 3 / 100);
            },
            child: Text(
                'checkout  ${cartController.totalCartprice.value + 40 + cartController.totalCartprice.value * 3 / 100}')),
      ),
    );
  }
}
