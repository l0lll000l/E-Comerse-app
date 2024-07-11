import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Common/widgets/AppBar/section_heading.dart';
import 'package:flutter_application_1/Common/widgets/Gridview/gridview_layout.dart';
import 'package:flutter_application_1/Common/widgets/Product/product_card_vertical.dart';
import 'package:flutter_application_1/Common/widgets/Product/rounded_container.dart';
import 'package:flutter_application_1/Common/widgets/Shimmer/vertical_product_shimmer.dart';
import 'package:flutter_application_1/Feature/Shop/Controller/productController/product_controller.dart';
import 'package:flutter_application_1/Feature/Shop/Model/category_model.dart';
import 'package:flutter_application_1/Feature/Shop/Model/product_model.dart';
import 'package:flutter_application_1/Feature/Shop/Screens/Store/widgets/featured_brands.dart';
import 'package:flutter_application_1/Utils/Helpers/cloud_helper_functions.dart';
import 'package:flutter_application_1/Utils/Helpers/helper_functions.dart';
import 'package:flutter_application_1/Utils/constants/colors.dart';
import 'package:flutter_application_1/Utils/constants/image_strings.dart';
import 'package:flutter_application_1/Utils/constants/sizes.dart';
import 'package:flutter_application_1/Utils/loaders/box_shimmer.dart';
import 'package:flutter_application_1/Utils/loaders/list_tile_shimmer.dart';
import 'package:flutter_application_1/Utils/loaders/shimmer.dart';
import 'package:get/get.dart';

class Tcatogory extends StatelessWidget {
  const Tcatogory({super.key, required this.category});

  final CategoryModel category;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductController());
    return ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: Column(
              children: [
                FutureBuilder(
                  future: controller.getbrandsByCategory(categoryId: '001'),
                  builder: (context, snapshot) {
                    const loader = Column(
                      children: [
                        IListTileShimmer(),
                        SizedBox(height: TSizes.spaceBtwItems),
                        IboxesShimmer(),
                        SizedBox(height: TSizes.spaceBtwItems),
                      ],
                    );
                    final widget = TCloudHelperFunctions.checkMultiRecordState(
                        snapshot: snapshot, loader: loader);
                    if (widget != null) return widget;
                    final brands = snapshot.data;
                    return ListView.separated(
                      separatorBuilder: (context, index) {
                        return SizedBox(height: TSizes.spaceBtwItems);
                      },
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: brands!.length,
                      itemBuilder: (context, index) {
                        final brand = brands[index];

                        return TRoundedContainer(
                          padding: const EdgeInsets.all(TSizes.spaceBtwItems),
                          showBorder: true,
                          child: Column(
                            children: [
                              FeaturedBrands(
                                brand: brand,
                              ),
                              FutureBuilder(
                                  future: controller.getBrandProducts(
                                      brandId: brand.id, limit: 3),
                                  builder: (context, snapshot) {
                                    final products = snapshot.data;
                                    return Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: products != null
                                            ? products!
                                                .map((images) =>
                                                    brandTopProductImages(
                                                        context: context,
                                                        images:
                                                            images.thumbnail))
                                                .toList()
                                            : []);
                                  })
                            ],
                          ),
                        );
                      },
                    );
                  },
                ),
//----------------------------------------------------------------------------------
                /// products
                // SizedBox(height: TSizes.spaceBtwItems),
                const TsectionHeading(
                  showActionButton: true,
                  title: 'You might also like',
                ),
                FutureBuilder(
                  future: controller.GetProductByCategory(
                      categoryId: '001', limit: 6),
                  builder: (context, snapshot) {
                    const loader = IVerticalProductShimmer();
                    final widget = TCloudHelperFunctions.checkMultiRecordState(
                        snapshot: snapshot, loader: loader);
                    if (widget != null) {
                      return widget;
                    }
                    final products = snapshot.data;
                    print('product Length ${products!.length}');
                    return TGridview(
                      itemcount: products.length,
                      itemBuilder: (context, index) => TProductCardVertical(
                        product: products[index] != null
                            ? products[index]
                            : ProductModel.empty(),
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        ]);
  }

  Widget brandTopProductImages({context, String? images = TImages.noImage}) {
    return Expanded(
        child: TRoundedContainer(
            padding: EdgeInsets.all(TSizes.sm),
            showBorder: true,
            margin: const EdgeInsets.only(right: TSizes.sm),
            height: 80,
            backgroundColor: THelperFunctions.isDarkMode(context)
                ? TColors.dark
                : TColors.light,
            child: CachedNetworkImage(
              fit: BoxFit.contain,
              imageUrl: images!,
              progressIndicatorBuilder: (context, url, progress) =>
                  const TShimmerEffect(
                width: double.infinity,
                height: 80,
                radius: 15,
              ),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            )));
  }
}
