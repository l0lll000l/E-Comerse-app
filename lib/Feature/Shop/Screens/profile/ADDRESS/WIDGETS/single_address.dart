import 'package:flutter/material.dart';
import 'package:flutter_application_1/Common/widgets/Product/rounded_container.dart';
import 'package:flutter_application_1/Utils/Helpers/helper_functions.dart';
import 'package:flutter_application_1/Utils/constants/colors.dart';
import 'package:flutter_application_1/Utils/constants/sizes.dart';
import 'package:iconsax/iconsax.dart';

class TsingleAddress extends StatelessWidget {
  const TsingleAddress({
    super.key,
    this.selectedAddress = false,
  });
  final bool selectedAddress;
  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return TRoundedContainer(
      padding: const EdgeInsets.all(TSizes.md),
      width: double.infinity,
      showBorder: true,
      backgroundColor: selectedAddress
          ? TColors.primary.withOpacity(0.3)
          : Colors.transparent,
      borderColor: selectedAddress ? TColors.darkerGrey : Colors.grey,
      margin: const EdgeInsets.only(bottom: TSizes.spaceBtwItems),
      child: Stack(
        children: [
          Positioned(
            right: 5,
            top: 0,
            child: Icon(selectedAddress ? Iconsax.tick_circle5 : null,
                color: selectedAddress
                    ? dark
                        ? TColors.light
                        : TColors.dark.withOpacity(0.9)
                    : null),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .apply(color: dark ? TColors.light : TColors.dark),
                  'John'),
              const SizedBox(height: TSizes.sm / 2),
              const Text(
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  '+91 987456123'),
              const SizedBox(height: TSizes.sm / 2),
              const Text(
                  softWrap: true,
                  'kozhikode,kerala,indiajjjjjjjjjsaioooojjjjllllllllllllljjjjjjjjjjj'),
            ],
          )
        ],
      ),
    );
  }
}
