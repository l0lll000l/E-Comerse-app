import 'package:flutter/material.dart';
import 'package:flutter_application_1/Feature/Authentication/Controller.onbording/onbordingController.dart';
import 'package:flutter_application_1/Utils/Helpers/helper_functions.dart';
import 'package:flutter_application_1/Utils/constants/colors.dart';
import 'package:flutter_application_1/Utils/constants/sizes.dart';
import 'package:flutter_application_1/Utils/device/device_utility.dart';
import 'package:iconsax/iconsax.dart';

class OnBordingNextButton extends StatelessWidget {
  const OnBordingNextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Positioned(
        right: TSizes.defaultSpace,
        bottom: TDeviceUtils.getBottomNavigationBarHeight(),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: dark ? TColors.primary : Colors.black,
              shape: const CircleBorder(),
            ),
            onPressed: () {
              OnbordingController.instance.nextPage();
            },
            child: const Icon(Iconsax.arrow_right_3)));
  }
}
