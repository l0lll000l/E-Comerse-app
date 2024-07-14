import 'package:flutter/material.dart';
import 'package:flutter_application_1/Utils/Helpers/helper_functions.dart';
import 'package:flutter_application_1/Utils/constants/colors.dart';
import 'package:flutter_application_1/Utils/loaders/animation_loader.dart';
import 'package:get/get.dart';

class TfullScreenLoader {
  static void openLoadingDialog(String text, String animation) {
    showDialog(
      context: Get.overlayContext!,
      builder: (context) => PopScope(
          canPop: false,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            color: THelperFunctions.isDarkMode(context)
                ? TColors.dark
                : TColors.light,
            child: Column(
              children: [
                SizedBox(height: 250),
                TAnimationLoaderWidget(
                  animation: animation,
                  showactionButton: false,
                  actionText: 'okey',
                  text: text,
                )
              ],
            ),
          )),
    );
  }

  static stopLoading() {
    Navigator.of(Get.overlayContext!).pop();
  }
}
