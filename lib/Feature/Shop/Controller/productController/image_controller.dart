import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Feature/Shop/Model/product_model.dart';
import 'package:flutter_application_1/Utils/constants/sizes.dart';
import 'package:get/get.dart';

class ImagesController extends GetxController {
  static ImagesController get instance => Get.find();

  /// variables
  RxString selectedImges = ''.obs;

  /// functions
  List<String> getAllProductsImagess(ProductModel product) {
    Set<String> images = {};
    images.add(product.thumbnail);
    selectedImges.value = product.thumbnail;
    if (product.images != null) {
      images.addAll(product.images!);
    }
    if (product.productVariations != null) {
      images.addAll(
          product.productVariations!.map((variation) => variation.image));
    }

    return images.toList();
  }

  /// show enlarged image
  void ShowEnlargedImage(String image) {
    Get.to(
        fullscreenDialog: true,
        () => Dialog.fullscreen(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: TSizes.defaultSpace * 2,
                        horizontal: TSizes.defaultSpace),
                    child: CachedNetworkImage(imageUrl: image),
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: SizedBox(
                      width: 150,
                      child: OutlinedButton(
                          onPressed: () {
                            Get.back();
                          },
                          child: const Text('Close')),
                    ),
                  )
                ],
              ),
            ));
  }
}
