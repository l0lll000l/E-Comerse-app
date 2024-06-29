import 'package:flutter/material.dart';
import 'package:flutter_application_1/Common/widgets/Product/product_price.dart';
import 'package:flutter_application_1/Feature/Shop/Screens/Cart/Widgets/cart_item.dart';
import 'package:flutter_application_1/Feature/Shop/Screens/Cart/Widgets/product_quantity_add_remove.dart';
import 'package:flutter_application_1/Utils/Helpers/helper_functions.dart';
import 'package:flutter_application_1/Utils/constants/colors.dart';
import 'package:flutter_application_1/Utils/constants/sizes.dart';

class TCartItemListView extends StatelessWidget {
  const TCartItemListView({
    super.key,
    this.showaddremoveButton = true,
  });
  final bool showaddremoveButton;
  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return ListView.separated(
        scrollDirection: Axis.vertical,
        physics: const AlwaysScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Column(
            children: [
              /// image, brand,product title,color,size
              const TCartItem(),
              const SizedBox(height: TSizes.spaceBtwItems / 2),
              if (showaddremoveButton)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    /// product quantity add remove
                    const ProductQuantityAddRemove(),

                    /// price

                    ProductPrice(
                        islarge: true,
                        price: '270',
                        textColor: dark ? TColors.light : TColors.dark),
                  ],
                )
            ],
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(height: TSizes.spaceBtwItems);
        },
        itemCount: 2);
  }
}
