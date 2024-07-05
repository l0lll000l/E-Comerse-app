import 'package:flutter/material.dart';
import 'package:flutter_application_1/Common/widgets/AppBar/appbar.dart';
import 'package:flutter_application_1/Common/widgets/customShapes/primary_header.dart';
import 'package:flutter_application_1/Feature/Shop/Screens/profile/upload_data/widgets/upload_screen.dart';
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
                  title: Text(
                    'Upload Data',
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .apply(color: TColors.light),
                  ),
                ),
                SizedBox(height: TSizes.spaceBtwItems * 2),
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
          ],
        ),
      ),
    );
  }
}
