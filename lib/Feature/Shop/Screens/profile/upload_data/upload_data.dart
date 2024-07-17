import 'package:flutter/material.dart';
import 'package:flutter_application_1/Common/widgets/AppBar/appbar.dart';
import 'package:flutter_application_1/Common/widgets/customShapes/primary_header.dart';
import 'package:flutter_application_1/Feature/Shop/Controller/category_controller.dart';
import 'package:flutter_application_1/Feature/Shop/Controller/homecontroller/banner_controller.dart';
import 'package:flutter_application_1/Feature/Shop/Screens/profile/upload_data/widgets/upload_banner.dart';
import 'package:flutter_application_1/Feature/Shop/Screens/profile/upload_data/widgets/upload_brand.dart';
import 'package:flutter_application_1/Feature/Shop/Screens/profile/upload_data/widgets/upload_category.dart';
import 'package:flutter_application_1/Feature/Shop/Screens/profile/upload_data/widgets/upload_screen.dart';
import 'package:flutter_application_1/Feature/Shop/Screens/profile/upload_data/widgets/upload_variation.dart';
import 'package:flutter_application_1/Feature/Shop/Screens/profile/widget/settingsmenu.dart';
import 'package:flutter_application_1/Utils/constants/colors.dart';
import 'package:flutter_application_1/Utils/constants/sizes.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class Uploaddata extends StatelessWidget {
  const Uploaddata({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            PrimaryHeader(
                child: Column(
              children: [
                TAppBar(
                  showBackArrow: true,
                  title: Text(
                    'Upload Data',
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .apply(color: TColors.light),
                  ),
                ),
                const SizedBox(height: TSizes.spaceBtwItems * 2),
              ],
            )),
            TsettingMenu(
              icon: Iconsax.safe_home,
              title: 'Upload products',
              subtitle: 'Upload your products',
              onPressed: () {
                Get.to(() => UploadProducts());
              },
            ),
            TsettingMenu(
              icon: Iconsax.safe_home,
              title: 'Upload Banner',
              subtitle: 'Upload your Banners',
              onPressed: () {
                BannerController.instance.isLoading.value = false;
                Get.to(() => const UploadBanner());
              },
            ),
            TsettingMenu(
              icon: Iconsax.safe_home,
              title: 'Upload Category',
              subtitle: 'Upload your categories',
              onPressed: () {
                CategoryController.instance.isLoading.value = false;
                Get.to(() => const UploadCategory());
              },
            ),
            TsettingMenu(
              icon: Iconsax.safe_home,
              title: 'Upload Variations',
              subtitle: 'Upload Product Variations',
              onPressed: () {
                Get.to(() => const UploadVariations());
              },
            ),
            TsettingMenu(
              icon: Iconsax.safe_home,
              title: 'Upload Brand',
              subtitle: 'Upload Brands',
              onPressed: () {
                Get.to(() => const UploadBrand());
              },
            ),
          ],
        ),
      ),
    );
  }
}
