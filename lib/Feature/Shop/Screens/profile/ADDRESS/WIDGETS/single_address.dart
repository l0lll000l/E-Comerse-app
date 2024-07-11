import 'package:flutter/material.dart';
import 'package:flutter_application_1/Common/widgets/Product/rounded_container.dart';
import 'package:flutter_application_1/Feature/Shop/Controller/address_controller.dart';
import 'package:flutter_application_1/Feature/Shop/Model/address_model.dart';
import 'package:flutter_application_1/Utils/Helpers/helper_functions.dart';
import 'package:flutter_application_1/Utils/constants/colors.dart';
import 'package:flutter_application_1/Utils/constants/sizes.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class TsingleAddress extends StatelessWidget {
  const TsingleAddress({
    super.key,
    required this.address,
    this.onTap,
  });
  final AddressModel address;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    print(address.toJson());
    final dark = THelperFunctions.isDarkMode(context);
    final controller = AddressController.instance;

    return Obx(() {
      controller.allUserAddresses();
      final selectedAddressId = controller.selectesAddress.value.id;
      final selectedAddress = selectedAddressId == address.id;
      return InkWell(
        onTap: onTap,
        child: TRoundedContainer(
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
                    color: address.selectedAddress
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
                      address.name),
                  const SizedBox(height: TSizes.sm / 2),
                  Text(
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      address.phoneNumer),
                  const SizedBox(height: TSizes.sm / 2),
                  Text(
                    softWrap: true,
                    address.toString(),
                  ),
                ],
              )
            ],
          ),
        ),
      );
    });
  }
}
