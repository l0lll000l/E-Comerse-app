import 'package:dotlottie_loader/dotlottie_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Utils/Helpers/helper_functions.dart';
import 'package:flutter_application_1/Utils/constants/colors.dart';
import 'package:flutter_application_1/Utils/constants/image_strings.dart';
import 'package:lottie/lottie.dart';

class TAnimationLoaderWidget extends StatelessWidget {
  const TAnimationLoaderWidget(
      {super.key,
      this.animation = TImages.verifying,
      required this.text,
      required this.showactionButton,
      this.actionText,
      this.onPressed});
  final String animation;
  final String text;
  final bool showactionButton;
  final String? actionText;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DotLottieLoader.fromAsset(animation,
              frameBuilder: (BuildContext ctx, DotLottie? dotlottie) {
            if (dotlottie != null) {
              return Lottie.memory(dotlottie.animations.values.single,
                  width: THelperFunctions.screenWidth() * 0.9,
                  height: THelperFunctions.screenHeight() * 0.6);
            } else {
              return Container();
            }
          }),
          showactionButton
              ? SizedBox(
                  width: 250,
                  child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                          backgroundColor: TColors.dark),
                      onPressed: onPressed,
                      child: Text(
                        actionText!,
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .apply(color: TColors.light),
                      )),
                )
              : SizedBox()
        ],
      ),
    );
  }
}
