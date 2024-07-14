import 'package:flutter/material.dart';
import 'package:flutter_application_1/Feature/Shop/Controller/cart_controller.dart';
import 'package:flutter_application_1/Feature/Shop/Model/product_model.dart';
import 'package:flutter_application_1/Feature/Shop/Screens/wishList/widget/circularicon.dart';
import 'package:flutter_application_1/Utils/Helpers/helper_functions.dart';
import 'package:flutter_application_1/Utils/constants/colors.dart';
import 'package:flutter_application_1/Utils/constants/sizes.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class AddToCart extends StatelessWidget {
  const AddToCart({super.key, required this.product});
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: TSizes.defaultSpace, vertical: TSizes.defaultSpace / 3),
      decoration: BoxDecoration(
          color: dark ? TColors.darkerGrey : TColors.light,
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(TSizes.cardRadiusLg),
              topRight: Radius.circular(TSizes.cardRadiusLg))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleIcon(
                onPressed: () {
                  if (product!.productType != null) {
                    final cartItem =
                        CartController.instance.convertToCartItem(product!, 1);

                    CartController.instance.removeOneFromCart(cartItem);
                  }
                },
                lightmodebackground: TColors.grey,
                darkModebackground: TColors.grey,
                height: 40,
                width: 40,
                icon: Iconsax.minus,
              ),
              const SizedBox(width: TSizes.spaceBtwItems),
              Obx(
                () => Text(
                    CartController.instance
                        .getProductQuantityInCart(product.id)
                        .toString(),
                    style: Theme.of(context).textTheme.titleSmall!.apply(
                          color: dark ? TColors.light : TColors.dark,
                        )),
              ),
              const SizedBox(width: TSizes.spaceBtwItems),
              CircleIcon(
                onPressed: () {
                  if (product!.productType != null) {
                    final cartItem =
                        CartController.instance.convertToCartItem(product!, 1);

                    CartController.instance.addOneToCart(cartItem);
                  }
                },
                lightmodebackground: TColors.grey,
                darkModebackground: TColors.grey,
                height: 40,
                width: 40,
                icon: Iconsax.add,
              ),
            ],
          ),
          SizedBox(
            width: 150,
            child: ElevatedButton(
                style:
                    ElevatedButton.styleFrom(backgroundColor: TColors.primary),
                onPressed: () {},
                child: Text('Add to Cart')),
          )
        ],
      ),
    );
  }
}
