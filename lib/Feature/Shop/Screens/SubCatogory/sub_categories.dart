import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Common/widgets/AppBar/appbar.dart';
import 'package:flutter_application_1/Common/widgets/AppBar/section_heading.dart';
import 'package:flutter_application_1/Common/widgets/Product/product_card_horizondal.dart';
import 'package:flutter_application_1/Common/widgets/image%20container/rounded_image.dart';
import 'package:flutter_application_1/Utils/constants/image_strings.dart';
import 'package:flutter_application_1/Utils/constants/sizes.dart';

class SubCatogoriesScreen extends StatelessWidget {
  const SubCatogoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(
        showBackArrow: true,
        title: Text('Sports Shirts'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// Banner
              const TRoundedImage(
                height: 150,
                applyImageRadius: true,
                width: double.infinity,
                fit: BoxFit.cover,
                imageurl: TImages.banner1,
              ),
              const SizedBox(height: TSizes.spaceBtwSections),

              ///sub catogories
              Column(
                children: [
                  /// heading
                  TsectionHeading(
                      showActionButton: true,
                      title: 'Sports shirts',
                      onpressed: () {}),
                  const SizedBox(height: TSizes.spaceBtwItems / 2),
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
                        itemCount: 4,
                        itemBuilder: (context, index) =>
                            TProductCardHorrizondal()),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
