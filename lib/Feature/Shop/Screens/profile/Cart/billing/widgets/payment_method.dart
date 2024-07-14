import 'package:flutter/material.dart';
import 'package:flutter_application_1/Common/widgets/Product/rounded_container.dart';
import 'package:flutter_application_1/Feature/Shop/Controller/checkout_controller.dart';
import 'package:flutter_application_1/Feature/Shop/Model/payment_method_model.dart';
import 'package:flutter_application_1/Utils/Helpers/helper_functions.dart';
import 'package:flutter_application_1/Utils/constants/colors.dart';
import 'package:flutter_application_1/Utils/constants/image_strings.dart';
import 'package:flutter_application_1/Utils/constants/sizes.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';

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

class PaymentTile extends StatelessWidget {
  const PaymentTile({super.key, required this.paymentMethod});
  final PaymentMethodModel paymentMethod;
  @override
  Widget build(BuildContext context) {
    final controller = CheckOutController.instance;
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      onTap: () {
        controller.selectedPaymentMethod.value = paymentMethod;
        Get.back();
      },
      leading: TRoundedContainer(
        width: 60,
        height: 40,
        padding: const EdgeInsets.all(TSizes.sm),
        backgroundColor: THelperFunctions.isDarkMode(context)
            ? TColors.light
            : TColors.light,
        child: Image(
          image: AssetImage(paymentMethod.image),
          fit: BoxFit.contain,
        ),
      ),
      title: Text(paymentMethod.name),
      trailing: const Icon(Iconsax.arrow_right_34),
    );
  }
}
