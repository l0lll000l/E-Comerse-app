import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Utils/Helpers/helper_functions.dart';

import 'package:flutter_application_1/Utils/constants/colors.dart';
import 'package:flutter_application_1/Utils/constants/image_strings.dart';
import 'package:flutter_application_1/Utils/constants/sizes.dart';
import 'package:flutter_application_1/Utils/loaders/shimmer.dart';

class TverticalImageText extends StatelessWidget {
  const TverticalImageText({
    super.key,
    this.image = TImages.nikeLogo,
    this.text = 'item',
    this.onTap,
    this.textcolor = TColors.light,
    this.backgroundColor,
    this.fit = BoxFit.cover,
    this.isNetworkImage = false,
  });
  final String image, text;
  final void Function()? onTap;
  final Color textcolor;
  final Color? backgroundColor;
  final BoxFit fit;
  final bool isNetworkImage;
  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: TSizes.spaceBtwItems / 2),
        child: Column(
          children: [
            Container(
                width: 56,
                height: 56,
                padding: const EdgeInsets.all(TSizes.xs),
                decoration: BoxDecoration(
                    color: backgroundColor ??
                        (dark ? TColors.dark : TColors.light),
                    borderRadius: BorderRadius.circular(28)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(56),
                  child: isNetworkImage
                      ? CachedNetworkImage(
                          fit: fit,
                          imageUrl: image,
                          progressIndicatorBuilder: (context, url, progress) =>
                              const TShimmerEffect(
                            width: 55,
                            height: 55,
                            radius: 55,
                          ),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        )
                      : Image(fit: fit, image: AssetImage(TImages.nikeLogo)),
                )),
            const SizedBox(height: TSizes.spaceBtwItems / 2),
            SizedBox(
              child: Text(
                text,
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .copyWith(color: textcolor),
                overflow: TextOverflow.ellipsis,
              ),
            )
          ],
        ),
      ),
    );
  }
}
