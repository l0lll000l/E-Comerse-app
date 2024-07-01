import 'package:flutter/material.dart';
import 'package:flutter_application_1/Feature/Authentication/controller/Controller.onbording/onbordingController.dart';
import 'package:flutter_application_1/Utils/constants/sizes.dart';
import 'package:flutter_application_1/Utils/device/device_utility.dart';

class OnBordingSkip extends StatelessWidget {
  const OnBordingSkip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: TSizes.defaultSpace,
      top: TDeviceUtils.getAppBarHeight(),
      child: TextButton(
          onPressed: () {
            OnbordingController.instance.skipPage();
          },
          child: const Text('Skip')),
    );
  }
}
