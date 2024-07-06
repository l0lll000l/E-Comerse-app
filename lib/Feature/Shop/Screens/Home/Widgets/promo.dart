import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Common/widgets/customShapes/circular_container.dart';
import 'package:flutter_application_1/Common/widgets/image%20container/rounded_image.dart';
import 'package:flutter_application_1/Feature/Shop/Controller/homecontroller/banner_controller.dart';
import 'package:flutter_application_1/Utils/constants/colors.dart';
import 'package:flutter_application_1/Utils/constants/sizes.dart';
import 'package:flutter_application_1/Utils/loaders/shimmer.dart';
import 'package:get/get.dart';

class TpromoSlider extends StatelessWidget {
  const TpromoSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BannerController());
    return Obx(
      () {
        if (controller.isLoading.value) {
          return const TShimmerEffect(
            width: double.infinity,
            height: 190,
            radius: 15,
          );
        }
        if (controller.banners.isEmpty) {
          return const Center(
            child: Text('No data found'),
          );
        } else {
          return Column(
            children: [
              CarouselSlider(
                  items: controller.banners
                      .map((banner) => Padding(
                            padding: const EdgeInsets.all(3),
                            child: TRoundedImage(
                              width: 340,
                              onPressed: () {
                                Get.toNamed(banner.targetScreen);
                              },
                              padding: const EdgeInsets.all(0),
                              applyImageRadius: true,
                              isNetworkImage: true,
                              backGroundColor: Colors.black12,
                              borderRadius: 15,
                              imageradius: 15,
                              fit: BoxFit.cover,
                              nocacheNetworkImage: false,
                              imageurl: banner.imageUrl,
                            ),
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
                    for (int i = 0; i < controller.banners.length; i++)
                      TCircularContainer(
                          width: 20,
                          height: 4,
                          margin: const EdgeInsets.only(right: 10),
                          backgroundColor:
                              controller.carouselCurrentIndex.value == i
                                  ? TColors.primary
                                  : TColors.black),
                  ],
                ),
              )
            ],
          );
        }
      },
    );
  }
}
