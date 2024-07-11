import 'package:flutter/material.dart';
import 'package:flutter_application_1/Common/widgets/Product/rounded_container.dart';
import 'package:flutter_application_1/Common/widgets/Text/branded_text.dart';
import 'package:flutter_application_1/Common/widgets/image%20container/circle_image.dart';
import 'package:flutter_application_1/Feature/Shop/Model/brand_model.dart';
import 'package:flutter_application_1/Utils/Helpers/helper_functions.dart';
import 'package:flutter_application_1/Utils/constants/colors.dart';
import 'package:flutter_application_1/Utils/constants/enums.dart';
import 'package:flutter_application_1/Utils/constants/image_strings.dart';
import 'package:flutter_application_1/Utils/constants/sizes.dart';

class FeaturedBrands extends StatelessWidget {
  const FeaturedBrands({
    super.key,
    this.imageurl = TImages.noImage,
    this.showBorder = false,
    this.onTap,
    this.brand,
  });
  final String imageurl;
  final BrandModel? brand;
  final bool showBorder;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: TRoundedContainer(
        showBorder: showBorder,
        padding: const EdgeInsets.all(TSizes.sm),
        backgroundColor: Colors.transparent,
        child: Column(
          children: [
            Row(
              children: [
                Flexible(
                  child: TCircleImage(
                    fit: BoxFit.contain,
                    isNetworkImage: true,
                    imageurl: brand != null ? brand!.image : TImages.noImage,
                    backgroundColor: dark ? TColors.dark : TColors.light,
                    overlayColor: dark ? TColors.light : TColors.dark,
                  ),
                ),
                const SizedBox(width: TSizes.spaceBtwItems / 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BrandedText(
                        text: brand != null ? brand!.name : '',
                        brandTextSize: TextSizes.large,
                        textcolor: dark ? TColors.light : TColors.dark,
                      ),
                      Text(
                        brand != null ? brand!.productCount.toString() : '0',
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.labelMedium,
                      )
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
