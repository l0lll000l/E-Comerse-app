import 'package:flutter/material.dart';
import 'package:flutter_application_1/Common/widgets/image%20container/circle_image.dart';
import 'package:flutter_application_1/Common/widgets/image%20container/rounded_image.dart';
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
      leading: TRoundedImage(
        isNetworkImage: true,
        imageradius: 56,
        applyImageRadius: true,
        fit: BoxFit.cover,
        padding: const EdgeInsets.all(2),
        borderRadius: 56,
        height: 56,
        width: 56,
        imageurl: imageurl,
      ),
      trailing: IconButton(
        onPressed: onPressed,
        icon: const Icon(Iconsax.edit),
        color: dark ? TColors.dark : TColors.light,
      ),
    );
  }
}
