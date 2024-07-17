import 'package:flutter/material.dart';
import 'package:flutter_application_1/Common/widgets/AppBar/appbar.dart';
import 'package:flutter_application_1/Common/widgets/Shimmer/horrizondal_product_shimmer.dart';
import 'package:flutter_application_1/Feature/Shop/Controller/address_controller.dart';
import 'package:flutter_application_1/Feature/Shop/Screens/profile/ADDRESS/WIDGETS/single_address.dart';
import 'package:flutter_application_1/Feature/Shop/Screens/profile/ADDRESS/add_new_address.dart';
import 'package:flutter_application_1/Utils/Helpers/cloud_helper_functions.dart';
import 'package:flutter_application_1/Utils/Helpers/helper_functions.dart';
import 'package:flutter_application_1/Utils/constants/sizes.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class UserAddressScreen extends StatelessWidget {
  const UserAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AddressController());
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Iconsax.add),
        onPressed: () {
          Get.to(() => const AddNewAddress());
        },
      ),
      appBar: TAppBar(
        showBackArrow: true,
        title:
            Text('Addresses', style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: FutureBuilder(
              future: controller.allUserAddresses(),
              builder: (context, snapshot) {
                const loader = IHorrizondalProductShimmer();
                final widget = TCloudHelperFunctions.checkMultiRecordState(
                    snapshot: snapshot, loader: loader);
                if (widget != null) {
                  return widget;
                }
                final addresses = snapshot.data;
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: addresses!.length,
                  itemBuilder: (context, index) {
                    return TsingleAddress(
                      address: addresses[index],
                      onTap: () => controller.selectedAddress(addresses[index]),
                    );
                  },
                );
              }),
        ),
      ),
    );
  }
}
