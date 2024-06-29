import 'package:flutter/material.dart';
import 'package:flutter_application_1/Utils/Helpers/helper_functions.dart';

import '../../../../../Utils/constants/colors.dart';

class TsettingMenu extends StatelessWidget {
  const TsettingMenu({
    super.key,
    required this.title,
    required this.subtitle,
    this.onPressed,
    required this.icon,
    this.trailing,
    this.onTap,
  });

  final String title, subtitle;
  final Function()? onPressed;
  final IconData icon;
  final Widget? trailing;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onPressed,
      child: ListTile(
        title: Text(
          " $title",
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .apply(color: dark ? TColors.light : TColors.dark),
        ),
        subtitle: Text(" $subtitle",
            style: Theme.of(context)
                .textTheme
                .labelMedium!
                .apply(color: dark ? TColors.light : TColors.dark)),
        leading: Icon(
          icon,
          size: 28,
          color: TColors.primary,
        ),
        trailing: trailing,
        onTap: onTap,
      ),
    );
  }
}
