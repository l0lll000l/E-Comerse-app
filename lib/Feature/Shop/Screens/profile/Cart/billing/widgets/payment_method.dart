import 'package:flutter/material.dart';
import 'package:flutter_application_1/Common/widgets/Product/rounded_container.dart';
import 'package:flutter_application_1/Utils/Helpers/helper_functions.dart';
import 'package:flutter_application_1/Utils/constants/colors.dart';
import 'package:flutter_application_1/Utils/constants/sizes.dart';

class PaymentMethod extends StatelessWidget {
  const PaymentMethod({
    super.key,
    required this.image,
    required this.name,
  });
  final String image;
  final String name;
  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Row(
      children: [
        TRoundedContainer(
          width: 60,
          height: 35,
          backgroundColor:
              dark ? const Color.fromARGB(255, 243, 236, 236) : TColors.light,
          child: Image(fit: BoxFit.contain, image: AssetImage(image)),
        ),
        const SizedBox(width: TSizes.spaceBtwItems / 2),
        Text(name, style: Theme.of(context).textTheme.bodyLarge),
      ],
    );
  }
}
