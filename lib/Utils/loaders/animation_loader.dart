import 'package:flutter/material.dart';
import 'package:flutter_application_1/Utils/constants/colors.dart';
import 'package:flutter_application_1/Utils/constants/image_strings.dart';
import 'package:flutter_application_1/Utils/constants/sizes.dart';
import 'package:lottie/lottie.dart';

class TAnimationLoaderWidget extends StatelessWidget {
  const TAnimationLoaderWidget(
      {super.key,
      this.animation = TImages.loading,
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
          Lottie.asset(animation,
              width: MediaQuery.of(context).size.width * 0.8),
          SizedBox(height: TSizes.defaultSpace),
          Text(text, style: Theme.of(context).textTheme.bodyMedium),
          SizedBox(height: TSizes.defaultSpace),
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
