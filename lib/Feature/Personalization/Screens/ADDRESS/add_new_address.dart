import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/Common/widgets/AppBar/appbar.dart';
import 'package:flutter_application_1/Utils/constants/sizes.dart';
import 'package:iconsax/iconsax.dart';

class AddNewAddress extends StatelessWidget {
  const AddNewAddress({super.key});

  @override
  Widget build(BuildContext context) {
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
            TextFormField(
              decoration: const InputDecoration(
                  labelText: 'Name', prefixIcon: Icon(Iconsax.user)),
            ),
            const SizedBox(height: TSizes.spaceBtwItems),
            TextFormField(
              decoration: const InputDecoration(
                  labelText: 'Phone Number', prefixIcon: Icon(Iconsax.call)),
            ),
            const SizedBox(height: TSizes.spaceBtwItems),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    decoration: const InputDecoration(
                        labelText: 'Street',
                        prefixIcon: Icon(Iconsax.building)),
                  ),
                ),
                SizedBox(width: TSizes.spaceBtwItems),
                Expanded(
                  child: TextFormField(
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
                    decoration: const InputDecoration(
                        labelText: 'State',
                        prefixIcon: Icon(Icons.location_on)),
                  ),
                ),
              ],
            ),
            SizedBox(height: TSizes.spaceBtwItems),
            TextFormField(
              decoration: const InputDecoration(
                  labelText: 'Country', prefixIcon: Icon(Icons.language)),
            ),
            SizedBox(height: TSizes.spaceBtwItems),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(onPressed: () {}, child: Text('Save')),
            )
          ])),
        ),
      ),
    );
  }
}
