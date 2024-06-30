import 'package:flutter/material.dart';
import 'package:flutter_application_1/Common/widgets/AppBar/appbar.dart';
import 'package:flutter_application_1/Feature/Shop/Screens/profile/ADDRESS/WIDGETS/single_address.dart';
import 'package:flutter_application_1/Feature/Shop/Screens/profile/ADDRESS/add_new_address.dart';
import 'package:flutter_application_1/Utils/Helpers/helper_functions.dart';
import 'package:flutter_application_1/Utils/constants/sizes.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class UserAddressScreen extends StatelessWidget {
  const UserAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Iconsax.add),
        onPressed: () {
          Get.to(() => AddNewAddress());
        },
      ),
      appBar: TAppBar(
        showBackArrow: true,
        title:
            Text('Addresses', style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              TsingleAddress(),
              TsingleAddress(
                selectedAddress: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
