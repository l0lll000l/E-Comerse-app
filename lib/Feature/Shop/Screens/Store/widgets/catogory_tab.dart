import 'package:flutter/material.dart';
import 'package:flutter_application_1/Common/widgets/AppBar/section_heading.dart';
import 'package:flutter_application_1/Common/widgets/Gridview/gridview_layout.dart';
import 'package:flutter_application_1/Common/widgets/Product/product_card_vertical.dart';
import 'package:flutter_application_1/Common/widgets/Product/rounded_container.dart';
import 'package:flutter_application_1/Feature/Shop/Screens/Store/widgets/featured_brands.dart';
import 'package:flutter_application_1/Utils/Helpers/helper_functions.dart';
import 'package:flutter_application_1/Utils/constants/colors.dart';
import 'package:flutter_application_1/Utils/constants/sizes.dart';

class Tcatogory extends StatelessWidget {
  const Tcatogory({super.key, required this.images});
  final List<String> images;
  @override
  Widget build(BuildContext context) {
    return ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: Column(
              children: [
                /// Brand container
                TRoundedContainer(
                  padding: const EdgeInsets.all(TSizes.spaceBtwItems),
                  showBorder: true,
                  child: Column(
                    children: [
                      const FeaturedBrands(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: images
                            .map((images) =>
                                brandTopProductImages(context, images))
                            .toList(),
                      )
                    ],
                  ),
                ),

                /// products
                // SizedBox(height: TSizes.spaceBtwItems),
                const TsectionHeading(
                  showActionButton: true,
                  title: 'You might also like',
                ),
                TGridview(
                  itemBuilder: (_, index) => const TProductCardVertical(),
                )
              ],
            ),
          ),
        ]);
  }

  Widget brandTopProductImages(context, image) {
    return Expanded(
        child: TRoundedContainer(
      showBorder: true,
      margin: const EdgeInsets.only(right: TSizes.sm),
      height: 80,
      backgroundColor:
          THelperFunctions.isDarkMode(context) ? TColors.dark : TColors.light,
      child: Image(fit: BoxFit.contain, image: AssetImage(image)),
    ));
  }
}
