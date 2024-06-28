import 'package:flutter/material.dart';
import 'package:flutter_application_1/Feature/Shop/Screens/Home/home.dart';
import 'package:flutter_application_1/Feature/Shop/Screens/Store/store.dart';
import 'package:flutter_application_1/Feature/Shop/Screens/profile/profile.dart';
import 'package:flutter_application_1/Feature/Shop/Screens/wishList/wishlist.dart';
import 'package:flutter_application_1/Utils/Helpers/helper_functions.dart';
import 'package:flutter_application_1/Utils/constants/colors.dart';
import 'package:flutter_application_1/Utils/constants/image_strings.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
        bottomNavigationBar: Obx(
          () => NavigationBar(
              indicatorColor: dark
                  ? TColors.light.withOpacity(0.1)
                  : TColors.dark.withOpacity(0.1),
              backgroundColor: dark ? TColors.dark : TColors.light,
              onDestinationSelected: (value) =>
                  controller.selectedIndex.value = value,
              selectedIndex: controller.selectedIndex.value,
              elevation: 0,
              height: 80,
              destinations: const [
                NavigationDestination(icon: Icon(Iconsax.home), label: 'Home'),
                NavigationDestination(icon: Icon(Iconsax.shop), label: 'Store'),
                NavigationDestination(
                    icon: Icon(Iconsax.heart), label: 'WishList'),
                NavigationDestination(
                    icon: Icon(Iconsax.user), label: 'Profile'),
              ]),
        ),
        body: Obx(() => controller.screens[controller.selectedIndex.value]));
  }
}

class NavigationController extends GetxController {
  final RxInt selectedIndex = 0.obs;

  final screens = [
    const HomeScreen(),
    const Store(
      images: [TImages.testImage, TImages.testImage, TImages.testImage],
    ),
    const WishList(),
    const Profile(),
  ];
}
