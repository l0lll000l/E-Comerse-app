import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Common/widgets/AppBar/appbar.dart';
import 'package:flutter_application_1/Common/widgets/Product/favourite_icon.dart';
import 'package:flutter_application_1/Common/widgets/customShapes/curved_edge_widget.dart';
import 'package:flutter_application_1/Feature/Personalization/Screens/Product%20details/widgets/image_slider.dart';
import 'package:flutter_application_1/Feature/Shop/Controller/productController/image_controller.dart';
import 'package:flutter_application_1/Feature/Shop/Model/product_model.dart';
import 'package:flutter_application_1/Utils/Helpers/helper_functions.dart';
import 'package:flutter_application_1/Utils/constants/colors.dart';
import 'package:flutter_application_1/Utils/loaders/shimmer.dart';
import 'package:get/get.dart';

import '../../../../../Utils/constants/sizes.dart';

class ProductImage extends StatelessWidget {
  const ProductImage({
    super.key,
    this.fit = BoxFit.cover,
    this.product,
  });
  final BoxFit fit;
  final ProductModel? product;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ImagesController());
    final images = controller.getAllProductsImagess(product!);

    final dark = THelperFunctions.isDarkMode(context);
    return TCurvedEdgeWidget(child: Obx(() {
      final image = controller.selectedImges.value;
      return Container(
        color: dark ? TColors.light : TColors.light,
        child: Stack(
          children: [
            SizedBox(
                height: 400,
                child: Padding(
                  padding: const EdgeInsets.all(TSizes.productImageRadius * 2),
                  child: Center(
                      child: GestureDetector(
                    onTap: () => controller.ShowEnlargedImage(image),
                    child: CachedNetworkImage(
                      fit: fit,
                      imageUrl: image,
                      progressIndicatorBuilder: (context, url, progress) =>
                          const TShimmerEffect(
                        width: double.infinity,
                        height: 190,
                        radius: 15,
                      ),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  )),
                )),

            ///image slider
            Positioned(
                right: 45,
                bottom: 30,
                child: ImageSlider(
                  sliderImage: images != null ? images : [],
                )),

            /// appbar
            TAppBar(
              showBackArrow: true,
              actions: [FavouriteIcon(productId: product!.id)],
            )
          ],
        ),
      );
    }));
  }
}
