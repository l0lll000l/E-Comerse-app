import 'package:flutter/material.dart';
import 'package:flutter_application_1/Feature/Authentication/controller/login/login_controller.dart';
import 'package:flutter_application_1/Utils/constants/colors.dart';
import 'package:flutter_application_1/Utils/constants/image_strings.dart';
import 'package:flutter_application_1/Utils/constants/sizes.dart';
import 'package:get/get.dart';

class GoogleFaceBookIcon extends StatelessWidget {
  const GoogleFaceBookIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: TColors.grey),
              borderRadius: BorderRadius.circular(100)),
          child: IconButton(
              onPressed: () {
                controller.googleSignIn();
              },
              icon: const Image(
                  width: TSizes.iconMd,
                  height: TSizes.iconMd,
                  image: AssetImage(TImages.googlePay))),
        ),
        const SizedBox(width: TSizes.spaceBtwItems),
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: TColors.grey),
              borderRadius: BorderRadius.circular(100)),
          child: IconButton(
              onPressed: () {},
              icon: const Image(
                  width: TSizes.iconMd,
                  height: TSizes.iconMd,
                  image: AssetImage(TImages.furnitureIcon))),
        )
      ],
    );
  }
}
