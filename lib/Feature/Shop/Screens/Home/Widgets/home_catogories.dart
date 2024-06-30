import 'package:flutter/material.dart';

import 'package:flutter_application_1/Common/widgets/AppBar/section_heading.dart';
import 'package:flutter_application_1/Common/widgets/AppBar/vertica_image_text.dart';
import 'package:flutter_application_1/Feature/Shop/Screens/SubCatogory/sub_categories.dart';
import 'package:flutter_application_1/Utils/constants/colors.dart';
import 'package:flutter_application_1/Utils/constants/sizes.dart';
import 'package:get/get.dart';

class HomeCategories extends StatelessWidget {
  const HomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
          SizedBox(
            height: 80,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) {
                return TverticalImageText(
                  onTap: () {
                    Get.to(() => const SubCatogoriesScreen());
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
