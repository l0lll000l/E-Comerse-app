import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/Common/widgets/AppBar/section_heading.dart';
import 'package:flutter_application_1/Feature/Shop/Controller/address_controller.dart';
import 'package:flutter_application_1/Utils/constants/colors.dart';
import 'package:flutter_application_1/Utils/constants/sizes.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class TBillingAddressSection extends StatelessWidget {
  const TBillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final addressController = AddressController.instance;
      final address = addressController.selectesAddress.value;
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TsectionHeading(
            onpressed: () {
              addressController.selectNewAddressPopUp(context);
            },
            title: 'Shipping Address',
            showActionButton: true,
            buttonTitle: 'Change',
          ),
          const SizedBox(height: TSizes.spaceBtwItems / 2),
          Text(address.name, style: Theme.of(context).textTheme.bodyMedium),
          const SizedBox(height: TSizes.spaceBtwItems / 2),
          Row(
            children: [
              const Icon(
                Icons.phone,
                color: TColors.grey,
                size: 16,
              ),
              const SizedBox(width: TSizes.spaceBtwItems / 2),
              Text(address.phoneNumer,
                  style: Theme.of(context).textTheme.bodyMedium)
            ],
          ),
          const SizedBox(height: TSizes.spaceBtwItems / 2),
          Row(
            children: [
              const Icon(
                Icons.location_on,
                color: TColors.grey,
                size: 16,
              ),
              const SizedBox(width: TSizes.spaceBtwItems / 2),
              Flexible(
                child: Text(address.toString(),
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                    maxLines: 2,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .apply(overflow: TextOverflow.ellipsis)),
              )
            ],
          ),
        ],
      );
    });
  }
}
