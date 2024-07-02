import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/Common/widgets/AppBar/appbar.dart';
import 'package:flutter_application_1/Common/widgets/AppBar/section_heading.dart';
import 'package:flutter_application_1/Common/widgets/image%20container/rounded_image.dart';
import 'package:flutter_application_1/Feature/Personalization/Controller/user_controller.dart';
import 'package:flutter_application_1/Feature/Personalization/Screens/Profile/Widgets/profile_menu.dart';
import 'package:flutter_application_1/Feature/Personalization/Screens/Profile/Widgets/re_authenticatr_userlogin.dart';
import 'package:flutter_application_1/Feature/Personalization/Screens/Profile/Widgets/update_name.dart';
import 'package:flutter_application_1/Utils/constants/colors.dart';
import 'package:flutter_application_1/Utils/constants/image_strings.dart';
import 'package:flutter_application_1/Utils/constants/sizes.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
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
                    Get.to(() => const UpdateName());
                  },
                  title: 'Name',
                  value: controller.user.value.fullName,
                ),
                TProfileMenu(
                  onTap: () {},
                  title: 'Username',
                  value: controller.user.value.userName,
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
                  value: controller.user.value.id,
                ),
                TProfileMenu(
                  title: 'Email',
                  onTap: () {},
                  value: controller.user.value.email,
                ),
                TProfileMenu(
                  title: 'Phone Number',
                  onTap: () {},
                  value: controller.user.value.phone,
                ),
                TProfileMenu(
                  title: 'Gender',
                  onTap: () {},
                  value: 'Male',
                ),
                TProfileMenu(
                  title: 'Date of Birth',
                  onTap: () {},
                  value: '12/12/2001',
                ),
                const Divider(),
                const SizedBox(height: TSizes.spaceBtwItems / 2),

                /// close account
                Center(
                  child: GestureDetector(
                    onTap: () {
                      controller.deleteAccountWarning();
                    },
                    child: const Text(
                      'Close Account',
                      style: TextStyle(color: Colors.red),
                    ),
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
