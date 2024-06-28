import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Common/widgets/image%20container/rounded_image.dart';
import 'package:flutter_application_1/Common/widgets/customShapes/circular_container.dart';
import 'package:flutter_application_1/Feature/Shop/Controller/home_controller.dart';
import 'package:flutter_application_1/Utils/constants/colors.dart';

import 'package:flutter_application_1/Utils/constants/sizes.dart';
import 'package:get/get.dart';

class TpromoSlider extends StatelessWidget {
  const TpromoSlider({
    super.key,
    required this.banners,
  });
  final List<String> banners;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Column(
      children: [
        CarouselSlider(
            items: banners
                .map((url) => TRoundedImage(
                      imageurl: url,
                    ))
                .toList(),
            options: CarouselOptions(
                onPageChanged: (index, reason) =>
                    controller.updatePageIndex(index),
                // autoPlay: true,
                // autoPlayInterval: const Duration(seconds: 5),
                viewportFraction: 1)),
        const SizedBox(height: TSizes.spaceBtwItems),
        Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              for (int i = 0; i < banners.length; i++)
                TCircularContainer(
                    width: 20,
                    height: 4,
                    margin: const EdgeInsets.only(right: 10),
                    backgroundColor: controller.carouselCurrentIndex.value == i
                        ? TColors.primary
                        : TColors.black),
            ],
          ),
        )
      ],
    );
  }
}
