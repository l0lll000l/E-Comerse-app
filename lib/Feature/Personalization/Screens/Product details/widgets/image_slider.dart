import 'package:flutter/material.dart';
import 'package:flutter_application_1/Common/widgets/image%20container/rounded_image.dart';
import 'package:flutter_application_1/Utils/constants/colors.dart';

class ImageSlider extends StatelessWidget {
  const ImageSlider({super.key, this.sliderImage = const []});
  final List<String> sliderImage;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 260,
      height: 60,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          physics: const AlwaysScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            final image = sliderImage[index];
            return TRoundedImage(
              onPressed: () {},
              backGroundColor: Colors.white,
              applyImageRadius: true,
              border: Border.all(color: TColors.black),
              padding: const EdgeInsets.all(2),
              imageradius: 15,
              borderRadius: 15,
              height: 60,
              width: 60,
              isNetworkImage: true,
              imageurl: image,
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(width: 6);
          },
          itemCount: sliderImage.length),
    );
  }
}
