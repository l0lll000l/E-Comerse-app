import 'package:flutter/material.dart';
import 'package:flutter_application_1/Common/widgets/AppBar/appbar.dart';
import 'package:flutter_application_1/Common/widgets/AppBar/section_heading.dart';
import 'package:flutter_application_1/Common/widgets/image%20container/rounded_image.dart';
import 'package:flutter_application_1/Feature/Shop/Screens/profile/Profile/Widgets/profile_menu.dart';
import 'package:flutter_application_1/Utils/constants/colors.dart';
import 'package:flutter_application_1/Utils/constants/image_strings.dart';
import 'package:flutter_application_1/Utils/constants/sizes.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text(
          'Profile',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                TRoundedImage(
                  imageradius: 60,
                  border: Border.all(color: TColors.black),
                  applyImageRadius: true,
                  fit: BoxFit.contain,
                  padding: const EdgeInsets.all(5),
                  borderRadius: 60,
                  height: 120,
                  width: 120,
                  imageurl: TImages.user,
                  backGroundColor: TColors.grey,
                ),
                TextButton(
                    onPressed: () {},
                    child: const Text('Change profile picture')),
                const SizedBox(height: TSizes.spaceBtwItems / 2),
                const Divider(),
                const SizedBox(height: TSizes.spaceBtwItems / 2),

                /// Profile information
                const TsectionHeading(
                  title: 'Profile Information',
                  showActionButton: false,
                ),
                const SizedBox(height: TSizes.spaceBtwItems),
                TProfileMenu(
                  onTap: () {
                    print('change name');
                  },
                  value: 'Athul m p',
                ),
                TProfileMenu(
                  onTap: () {},
                  title: 'Username',
                  value: '@athulmp',
                ),
                const SizedBox(height: TSizes.spaceBtwItems / 2),
                const Divider(),
                const SizedBox(height: TSizes.spaceBtwItems / 2),

                /// personal information
                const TsectionHeading(
                  title: 'Personal Information',
                  showActionButton: false,
                ),
                TProfileMenu(
                  title: 'User ID',
                  onTap: () {},
                  value: '45845',
                ),
                TProfileMenu(
                  title: 'Email',
                  onTap: () {},
                  value: 'athul@gmail.com',
                ),
                TProfileMenu(
                  title: 'Phone Number',
                  onTap: () {},
                  value: '123456789',
                ),
                TProfileMenu(
                  title: 'Gender',
                  onTap: () {},
                  value: 'male',
                ),
                TProfileMenu(
                  title: 'Date of Birth',
                  onTap: () {},
                  value: '12/12/2001',
                ),
                const Divider(),
                const SizedBox(height: TSizes.spaceBtwItems / 2),

                /// close account
                const Center(
                  child: Text(
                    'Close Account',
                    style: TextStyle(color: Colors.red),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
