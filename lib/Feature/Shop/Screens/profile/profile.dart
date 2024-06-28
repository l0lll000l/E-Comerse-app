import 'package:flutter/material.dart';
import 'package:flutter_application_1/Common/widgets/AppBar/appbar.dart';
import 'package:flutter_application_1/Common/widgets/AppBar/section_heading.dart';
import 'package:flutter_application_1/Common/widgets/customShapes/primary_header.dart';
import 'package:flutter_application_1/Feature/Personalization/Screens/Profile/profile_screen.dart';
import 'package:flutter_application_1/Feature/Shop/Screens/profile/widget/settingsmenu.dart';
import 'package:flutter_application_1/Feature/Shop/Screens/profile/widget/userprofile.dart';
import 'package:flutter_application_1/Utils/constants/colors.dart';
import 'package:flutter_application_1/Utils/constants/image_strings.dart';
import 'package:flutter_application_1/Utils/constants/sizes.dart';
import 'package:get/route_manager.dart';
import 'package:iconsax/iconsax.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            PrimaryHeader(
                child: Column(
              children: [
                /// appbar
                TAppBar(
                  title: Text(
                    'Account',
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .apply(color: TColors.light),
                  ),
                ),

                /// user profile card
                UserProfile(
                  OnTap: () {
                    Get.to(() => const ProfileScreen());
                  },
                  name: 'John Doe',
                  email: 'johndoe@gmail',
                  imageurl: TImages.testImage,
                  onPressed: () {
                    Get.to(() => const ProfileScreen());
                  },
                ),
                const SizedBox(height: TSizes.spaceBtwSections),
              ],
            )),

            /// header
            const Padding(
              padding: EdgeInsets.only(left: TSizes.defaultSpace),
              child: TsectionHeading(
                title: 'Account Settings',
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwSections / 2),

            /// Account Settings
            TsettingMenu(
              icon: Iconsax.safe_home,
              title: 'My Address',
              subtitle: 'Set shoping delivery address',
              onPressed: () {},
            ),
            TsettingMenu(
              icon: Iconsax.shopping_cart,
              title: 'My Cart',
              subtitle: 'Add remove products and move to checkout',
              onPressed: () {},
            ),
            TsettingMenu(
              icon: Iconsax.bag_tick,
              title: 'My orders',
              subtitle: 'In-progress and Completed orders',
              onPressed: () {},
            ),
            TsettingMenu(
              icon: Iconsax.bank,
              title: 'Bank Account',
              subtitle: 'Withdraw balance to registered bank account',
              onPressed: () {},
            ),
            TsettingMenu(
              icon: Iconsax.discount_shape,
              title: 'My Coupens',
              subtitle: 'List of all the discounted coupens',
              onPressed: () {},
            ),
            TsettingMenu(
              icon: Iconsax.notification,
              title: 'Notifications',
              subtitle: 'Set any kind of notification messages',
              onPressed: () {},
            ),
            TsettingMenu(
              icon: Iconsax.security_card,
              title: 'Account Privacy',
              subtitle: 'Manage datausage and connected accounts',
              onPressed: () {},
            ),
            const SizedBox(height: TSizes.spaceBtwSections / 2),

            /// header
            const Padding(
              padding: EdgeInsets.only(left: TSizes.defaultSpace),
              child: TsectionHeading(
                title: 'App Settings',
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwSections / 2),

            /// App settings
            TsettingMenu(
              icon: Iconsax.document_upload,
              title: 'Load Data',
              subtitle: 'Upload data to your cloud database',
              onPressed: () {},
            ),
            TsettingMenu(
              icon: Iconsax.location,
              title: 'Geolocation',
              subtitle: 'Set recomentation based on location',
              trailing: Switch(value: true, onChanged: (value) {}),
            ),
            TsettingMenu(
              icon: Iconsax.security_user,
              title: 'Safe Mode',
              subtitle: 'Search result is safe for all ages',
              trailing: Switch(value: true, onChanged: (value) {}),
            ),
            TsettingMenu(
              icon: Iconsax.image,
              title: 'HD image quality',
              subtitle: 'Set image Quality to be seen',
              trailing: Switch(value: true, onChanged: (value) {}),
            ),
          ],
        ),
      ),
    );
  }
}