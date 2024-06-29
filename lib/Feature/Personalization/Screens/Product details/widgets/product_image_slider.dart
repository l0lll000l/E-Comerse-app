import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Common/widgets/AppBar/appbar.dart';
import 'package:flutter_application_1/Common/widgets/customShapes/curved_edge_widget.dart';
import 'package:flutter_application_1/Feature/Personalization/Screens/Product%20details/widgets/image_slider.dart';
import 'package:flutter_application_1/Utils/Helpers/helper_functions.dart';
import 'package:flutter_application_1/Utils/constants/colors.dart';

import '../../../../../Utils/constants/sizes.dart';
import '../../../../Shop/Screens/wishList/widget/circularicon.dart';

class ProductImage extends StatelessWidget {
  const ProductImage({
    super.key,
    required this.sliderImage,
    required this.productImages,
  });
  final String sliderImage;
  final String productImages;
  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return TCurvedEdgeWidget(
        child: Container(
      color: dark ? TColors.light : TColors.light,
      child: Stack(
        children: [
          SizedBox(
              height: 400,
              child: Padding(
                padding: const EdgeInsets.all(TSizes.productImageRadius * 2),
                child: Center(child: Image(image: AssetImage(productImages))),
              )),

          ///image slider
          Positioned(
            right: 45,
            bottom: 30,
            child: ImageSlider(
              sliderImage: sliderImage,
            ),
          ),

          /// appbar
          const TAppBar(
            showBackArrow: true,
            actions: [CircleIcon()],
          )
        ],
      ),
    ));
  }
}
