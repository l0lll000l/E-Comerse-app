import 'package:flutter/material.dart';
import 'package:flutter_application_1/Utils/constants/sizes.dart';

class TsectionHeading extends StatelessWidget {
  const TsectionHeading({
    super.key,
    this.title = 'Popular Catogories',
    this.buttonTitle = 'View all',
    this.textcolor = Colors.black,
    this.showActionButton = false,
    this.onpressed,
    this.child,
    this.addChild = false,
  });
  final String title, buttonTitle;
  final Color textcolor;
  final bool showActionButton;
  final void Function()? onpressed;
  final Widget? child;
  final bool addChild;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(title,
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .apply(color: textcolor),
            maxLines: 1,
            overflow: TextOverflow.ellipsis),
        const SizedBox(width: TSizes.spaceBtwItems),
        if (addChild) child!,
        const Spacer(),
        if (showActionButton)
          TextButton(onPressed: onpressed, child: Text(buttonTitle))
      ],
    );
  }
}
