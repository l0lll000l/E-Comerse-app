import 'package:flutter/material.dart';
import 'package:flutter_application_1/Feature/Shop/Controller/search_product_controller.dart';
import 'package:flutter_application_1/Feature/Shop/Screens/Home/Widgets/search_page.dart';
import 'package:flutter_application_1/Utils/Helpers/helper_functions.dart';
import 'package:flutter_application_1/Utils/constants/colors.dart';
import 'package:flutter_application_1/Utils/constants/sizes.dart';
import 'package:flutter_application_1/Utils/device/device_utility.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class TSearchContainer extends StatelessWidget {
  const TSearchContainer({
    super.key,
    this.text = 'Search in Store',
    this.icon = Iconsax.search_normal,
    this.showBackground = true,
    this.showBorder = true,
    this.padding = const EdgeInsets.all(TSizes.defaultSpace),
  });
  final String text;
  final IconData? icon;
  final bool showBackground, showBorder;
  final EdgeInsetsGeometry padding;
  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Padding(
      padding: padding,
      child: GestureDetector(
        onTap: () {
          SearchProductController.instance.searchProduct();
          Get.to(() => const SearchPage(title: 'Search Products'));
        },
        child: Container(
          width: TDeviceUtils.getScreenWidth(context),
          padding: const EdgeInsets.all(TSizes.md),
          decoration: BoxDecoration(
              border: showBorder
                  ? dark
                      ? Border.all(color: TColors.light)
                      : Border.all(color: TColors.dark)
                  : null,
              borderRadius: BorderRadius.circular(TSizes.cardRadiusLg),
              color: showBackground
                  ? dark
                      ? TColors.black
                      : TColors.light
                  : Colors.transparent),
          child: Row(
            children: [
              Icon(
                icon,
                color: TColors.darkerGrey,
              ),
              // TextField(),
              const SizedBox(width: TSizes.spaceBtwItems),
              Text(text, style: Theme.of(context).textTheme.bodyMedium)
            ],
          ),
        ),
      ),
    );
  }
}
