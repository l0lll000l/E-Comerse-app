import 'package:dotlottie_loader/dotlottie_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Feature/Authentication/Screens/onbording/widgets/OnbordingButton.dart';
import 'package:flutter_application_1/Feature/Authentication/Screens/onbording/widgets/OnbordingDot.dart';
import 'package:flutter_application_1/Feature/Authentication/Screens/onbording/widgets/onbordingSkip.dart';
import 'package:flutter_application_1/Feature/Authentication/controller/Controller.onbording/onbordingController.dart';
import 'package:flutter_application_1/Utils/Helpers/helper_functions.dart';
import 'package:flutter_application_1/Utils/constants/image_strings.dart';
import 'package:flutter_application_1/Utils/constants/sizes.dart';
import 'package:flutter_application_1/Utils/constants/textString.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class OnbordingScreen extends StatelessWidget {
  const OnbordingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnbordingController());

    return Scaffold(
      body: Stack(
        children: [
          //horrizonal scrollable page
          PageView(
            controller: controller.pagecontroller,
            onPageChanged: controller.updatePageIndicator,
            children: const [
              OnBordingPage(
                image: TImages.chooseProduct,
                title: TTexts.onBoardingTitle1,
                subtitle: TTexts.onBoardingSubTitle1,
              ),
              OnBordingPage(
                image: TImages.paymentMethod,
                title: TTexts.onBoardingTitle2,
                subtitle: TTexts.onBoardingSubTitle2,
              ),
              OnBordingPage(
                image: TImages.homeDeliveryAnimation,
                title: TTexts.onBoardingTitle3,
                subtitle: TTexts.onBoardingSubTitle3,
              ),
            ],
          ),
          //skip button
          const OnBordingSkip(),
          //dot navigation smoothindicator
          const OnBordingDotNavigation()
          //circular button
          ,
          const OnBordingNextButton()
        ],
      ),
    );
  }
}

class OnBordingPage extends StatelessWidget {
  const OnBordingPage({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
  });
  final String image, title, subtitle;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(TSizes.defaultSpace),
      child: Column(
        children: [
          const SizedBox(
            height: 0,
          ),
          DotLottieLoader.fromAsset(image,
              frameBuilder: (BuildContext ctx, DotLottie? dotlottie) {
            if (dotlottie != null) {
              return Lottie.memory(dotlottie.animations.values.single,
                  width: THelperFunctions.screenWidth() * 0.9,
                  height: THelperFunctions.screenHeight() * 0.6);
            } else {
              return Container();
            }
          }),
          Text(
            title,
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: TSizes.spaceBtwItems),
          Text(
            subtitle,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
