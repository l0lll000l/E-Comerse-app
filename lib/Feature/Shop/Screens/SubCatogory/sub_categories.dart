import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Common/widgets/AppBar/appbar.dart';
import 'package:flutter_application_1/Common/widgets/AppBar/section_heading.dart';
import 'package:flutter_application_1/Common/widgets/Product/product_card_horizondal.dart';
import 'package:flutter_application_1/Common/widgets/Shimmer/horrizondal_product_shimmer.dart';
import 'package:flutter_application_1/Common/widgets/image%20container/rounded_image.dart';
import 'package:flutter_application_1/Feature/Shop/Controller/category_controller.dart';
import 'package:flutter_application_1/Feature/Shop/Model/category_model.dart';
import 'package:flutter_application_1/Feature/Shop/Screens/searchProduct/all_products.dart';
import 'package:flutter_application_1/Utils/Helpers/cloud_helper_functions.dart';
import 'package:flutter_application_1/Utils/constants/sizes.dart';
import 'package:get/get.dart';

class SubCatogoriesScreen extends StatelessWidget {
  const SubCatogoriesScreen({super.key, required this.category});
  final CategoryModel category;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CategoryController());
    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text(category.name),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// Banner
              TRoundedImage(
                height: 150,
                applyImageRadius: true,
                width: double.infinity,
                isNetworkImage: true,
                fit: BoxFit.contain,
                imageurl: category.image,
              ),
              const SizedBox(height: TSizes.spaceBtwSections),

              ///sub catogories
              FutureBuilder(
                  future: controller.GetProductBySubCategory(
                      categoryId: category.id),
                  builder: (context, snapshot) {
                    const loader = IHorrizondalProductShimmer();
                    final widget = TCloudHelperFunctions.checkMultiRecordState(
                        snapshot: snapshot, loader: loader);
                    if (widget != null) {
                      return widget;
                    }
                    final subcategories = snapshot.data;

                    return ListView.builder(
                        shrinkWrap: true,
                        itemCount: subcategories!.length,
                        itemBuilder: (context, index) {
                          final subcategory = subcategories[index];
                          return FutureBuilder(
                              future: controller.GetProductByCategory(
                                  categoryId: subcategory.id, limit: 4),
                              builder: (context, snapshot) {
                                const loader = IHorrizondalProductShimmer();
                                final widget =
                                    TCloudHelperFunctions.checkMultiRecordState(
                                        snapshot: snapshot, loader: loader);
                                if (widget != null) {
                                  return widget;
                                }
                                final subProducts = snapshot.data;
                                return Column(
                                  children: [
                                    /// heading
                                    TsectionHeading(
                                        showActionButton: true,
                                        title: subcategory.name,
                                        onpressed: () {
                                          Get.to(() => AllProducts(
                                                futureMethod: controller
                                                    .GetProductByCategory(
                                                  categoryId: subcategory.id,
                                                  limit: 6,
                                                ),
                                                title: subcategory.name,
                                              ));
                                        }),
                                    const SizedBox(
                                        height: TSizes.spaceBtwItems / 2),
                                    SizedBox(
                                      height: 120,
                                      child: ListView.separated(
                                          scrollDirection: Axis.horizontal,
                                          separatorBuilder: (context, index) {
                                            return const SizedBox(
                                              width: TSizes.spaceBtwItems / 2,
                                            );
                                          },
                                          shrinkWrap: true,
                                          itemCount: subProducts != null
                                              ? subProducts.length
                                              : [].length,
                                          itemBuilder: (context, index) =>
                                              TProductCardHorrizondal(
                                                product: subProducts![index],
                                              )),
                                    )
                                  ],
                                );
                              });
                        });
                  })
            ],
          ),
        ),
      ),
    );
  }
}
