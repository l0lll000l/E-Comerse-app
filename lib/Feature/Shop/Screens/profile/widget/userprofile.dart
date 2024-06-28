import 'package:flutter/material.dart';
import 'package:flutter_application_1/Common/widgets/image%20container/circle_image.dart';
import 'package:flutter_application_1/Utils/Helpers/helper_functions.dart';
import 'package:flutter_application_1/Utils/constants/colors.dart';
import 'package:flutter_application_1/Utils/constants/image_strings.dart';
import 'package:iconsax/iconsax.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({
    super.key,
    required this.name,
    required this.email,
    this.onPressed,
    this.imageurl = TImages.testImage,
    this.OnTap,
  });
  final String name, email;
  final Function()? onPressed;
  final String imageurl;
  final Function()? OnTap;
  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return ListTile(
      onTap: OnTap,
      title: Text(
        name,
        style: Theme.of(context)
            .textTheme
            .headlineSmall!
            .apply(color: TColors.light),
      ),
      subtitle: Text(email,
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .apply(color: TColors.light)),
      leading: TCircleImage(
          imageurl: imageurl,
          backgroundColor: dark ? TColors.dark : TColors.light,
          overlayColor: null),
      trailing: IconButton(
        onPressed: onPressed,
        icon: const Icon(Iconsax.edit),
        color: dark ? TColors.dark : TColors.light,
      ),
    );
  }
}
