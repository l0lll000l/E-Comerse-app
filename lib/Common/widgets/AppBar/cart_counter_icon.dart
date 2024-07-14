import 'package:flutter/material.dart';
import 'package:flutter_application_1/Feature/Shop/Controller/cart_controller.dart';
import 'package:flutter_application_1/Utils/constants/colors.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class TCartCounterIcon extends StatelessWidget {
  const TCartCounterIcon({
    super.key,
    required this.iconColor,
    required this.onpressed,
  });
  final Color iconColor;
  final VoidCallback onpressed;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CartController());
    return Stack(
      children: [
        IconButton(
            onPressed: onpressed,
            icon: Icon(
              Iconsax.shopping_bag,
              color: iconColor,
            )),
        Positioned(
          right: 0,
          child: Container(
            width: 18,
            height: 18,
            decoration: BoxDecoration(
                color: TColors.black, borderRadius: BorderRadius.circular(9)),
            child: Center(
              child: Obx(
                () => Text(
                  controller.noOfVariables.value.toString(),
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .apply(color: TColors.light, fontSizeFactor: 0.8),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
