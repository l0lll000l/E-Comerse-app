import 'package:flutter/material.dart';
import 'package:flutter_application_1/Common/widgets/Product/rounded_container.dart';
import 'package:flutter_application_1/Utils/Helpers/helper_functions.dart';
import 'package:flutter_application_1/Utils/constants/colors.dart';
import 'package:flutter_application_1/Utils/constants/sizes.dart';

class TCoupenCode extends StatelessWidget {
  const TCoupenCode({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return TRoundedContainer(
      padding: const EdgeInsets.only(
          left: TSizes.md, right: TSizes.sm, top: TSizes.sm, bottom: TSizes.sm),
      backgroundColor: dark ? TColors.dark : TColors.light,
      showBorder: true,
      child: Column(
        children: [
          Row(
            children: [
              ///coupen textfield
              Flexible(
                child: TextFormField(
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      hintText: 'Have a coupon code? Enter here'),
                ),
              ),

              /// apply button
              SizedBox(
                  width: 80,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          side: BorderSide(color: Colors.grey.withOpacity(0.1)),
                          backgroundColor: Colors.grey.withOpacity(0.2),
                          foregroundColor: dark
                              ? TColors.light.withOpacity(0.5)
                              : TColors.dark.withOpacity(0.5)),
                      onPressed: () {},
                      child: const Text('Apply')))
            ],
          ),
        ],
      ),
    );
  }
}
