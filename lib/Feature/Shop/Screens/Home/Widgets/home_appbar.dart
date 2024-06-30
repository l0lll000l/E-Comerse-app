import 'package:flutter/material.dart';
import 'package:flutter_application_1/Common/widgets/AppBar/appbar.dart';
import 'package:flutter_application_1/Common/widgets/AppBar/cart_counter_icon.dart';
import 'package:flutter_application_1/Feature/Shop/Screens/profile/Cart/cart_screen.dart';
import 'package:flutter_application_1/Utils/constants/colors.dart';
import 'package:flutter_application_1/Utils/constants/textString.dart';
import 'package:get/get.dart';

class ThomeAppBar extends StatelessWidget {
  const ThomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TAppBar(
      /// Actions
      actions: [
        TCartCounterIcon(
          iconColor: TColors.light,
          onpressed: () {
            Get.to(() => const CartScreen());
          },
        )
      ],

      /// Title
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            TTexts.homeAppbarTitle,
            style: Theme.of(context)
                .textTheme
                .labelMedium!
                .apply(color: TColors.grey),
          ),
          Text(
            TTexts.homeAppbarSubTitle,
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .apply(color: TColors.light),
          )
        ],
      ),
    );
  }
}
