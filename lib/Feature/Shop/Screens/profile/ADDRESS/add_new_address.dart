import 'package:flutter/material.dart';
import 'package:flutter_application_1/Common/widgets/AppBar/appbar.dart';
import 'package:flutter_application_1/Feature/Shop/Controller/address_controller.dart';
import 'package:flutter_application_1/Feature/Shop/Model/address_model.dart';
import 'package:flutter_application_1/Utils/constants/sizes.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class AddNewAddress extends StatelessWidget {
  const AddNewAddress({super.key});

  @override
  Widget build(BuildContext context) {
    String? name;
    String? phoneNumber;
    String? street;
    String? city;
    String? state;
    String? country;
    String? postalCode;
    final controller = Get.put(AddressController());
    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text(
          'Add New Address',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Form(
              child: Column(children: [
            /// name
            TextFormField(
              onChanged: (value) {
                name = value;
              },
              decoration: const InputDecoration(
                  labelText: 'Name', prefixIcon: Icon(Iconsax.user)),
            ),
            const SizedBox(height: TSizes.spaceBtwItems),

            /// phone
            TextFormField(
              onChanged: (value) {
                phoneNumber = value;
              },
              decoration: const InputDecoration(
                  labelText: 'Phone Number', prefixIcon: Icon(Iconsax.call)),
            ),
            const SizedBox(height: TSizes.spaceBtwItems),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    onChanged: (value) {
                      street = value;
                    },
                    decoration: const InputDecoration(
                        labelText: 'Street',
                        prefixIcon: Icon(Iconsax.building)),
                  ),
                ),
                SizedBox(width: TSizes.spaceBtwItems),
                Expanded(
                  child: TextFormField(
                    onChanged: (value) {
                      postalCode = value;
                    },
                    decoration: const InputDecoration(
                        labelText: 'Postel Code', prefixIcon: Icon(Icons.pin)),
                  ),
                ),
              ],
            ),
            SizedBox(height: TSizes.spaceBtwItems),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    onChanged: (value) {
                      city = value;
                    },
                    decoration: const InputDecoration(
                        labelText: 'City',
                        prefixIcon: Icon(
                          Icons.apartment,
                        )),
                  ),
                ),
                SizedBox(width: TSizes.spaceBtwItems),
                Expanded(
                  child: TextFormField(
                    onChanged: (value) {
                      state = value;
                    },
                    decoration: const InputDecoration(
                        labelText: 'State',
                        prefixIcon: Icon(Icons.location_on)),
                  ),
                ),
              ],
            ),
            SizedBox(height: TSizes.spaceBtwItems),
            TextFormField(
              onChanged: (value) {
                country = value;
              },
              decoration: const InputDecoration(
                  labelText: 'Country', prefixIcon: Icon(Icons.language)),
            ),
            SizedBox(height: TSizes.spaceBtwItems),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    final data = AddressModel(
                        id: '',
                        name: name ?? '',
                        phoneNumer: phoneNumber ?? '',
                        street: street ?? '',
                        city: city ?? '',
                        state: state ?? '',
                        postalCode: postalCode ?? '',
                        country: country ?? '');
                    controller.addNewAddresses(data);
                  },
                  child: Text('Save')),
            )
          ])),
        ),
      ),
    );
  }
}
