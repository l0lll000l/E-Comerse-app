import 'package:flutter/material.dart';
import 'package:flutter_application_1/Feature/Shop/Controller/favourite_controller.dart';
import 'package:flutter_application_1/Feature/Shop/Screens/wishList/widget/circularicon.dart';
import 'package:flutter_application_1/Utils/constants/colors.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class FavouriteIcon extends StatelessWidget {
  const FavouriteIcon({super.key, required this.productId});
  final String productId;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FavouritesController());

    return Obx(
      () {
        return CircleIcon(
          onPressed: () {
            controller.toogleFavouriteProduct(productId: productId);
          },
          iconColor: controller.isFavourite(productId: productId)
              ? const Color.fromARGB(255, 255, 17, 0)
              : TColors.light,
          icon: controller.isFavourite(productId: productId)
              ? Iconsax.heart5
              : Iconsax.heart,
        );
      },
    );
  }
}
