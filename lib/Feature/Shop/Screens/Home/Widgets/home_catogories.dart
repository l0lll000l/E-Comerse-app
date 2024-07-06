import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:flutter_application_1/Common/widgets/AppBar/section_heading.dart';
import 'package:flutter_application_1/Common/widgets/AppBar/vertica_image_text.dart';
import 'package:flutter_application_1/Common/widgets/Shimmer/category_shimmer.dart';
import 'package:flutter_application_1/Feature/Shop/Controller/category_controller.dart';
import 'package:flutter_application_1/Feature/Shop/Screens/SubCatogory/sub_categories.dart';
import 'package:flutter_application_1/Utils/constants/colors.dart';
import 'package:flutter_application_1/Utils/constants/image_strings.dart';
import 'package:flutter_application_1/Utils/constants/sizes.dart';
import 'package:get/get.dart';

class HomeCategories extends StatelessWidget {
  const HomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final categoryController = Get.put(CategoryController());
    return Padding(
      padding: const EdgeInsets.only(left: TSizes.defaultSpace),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          /// section heading
          const TsectionHeading(
            textcolor: TColors.light,
          ),
          const SizedBox(height: TSizes.spaceBtwItems),
          Obx(
            () {
              if (categoryController.isLoading.value) return ICategoryShimmer();
              if (categoryController.featuredCategories.isEmpty) {
                return Center(
                    child: Text('No data found',
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(color: TColors.light)));
              }
              return SizedBox(
                height: 80,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: categoryController.featuredCategories.length,
                  itemBuilder: (context, index) {
                    final category =
                        categoryController.featuredCategories[index];

                    return TverticalImageText(
                      image: category.image,
                      text: category.name,
                      isNetworkImage: true,
                      onTap: () {
                        Get.to(() => const SubCatogoriesScreen());
                      },
                    );
                  },
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
