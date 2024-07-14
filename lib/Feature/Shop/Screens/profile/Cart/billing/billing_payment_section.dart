import 'package:flutter/material.dart';
import 'package:flutter_application_1/Common/widgets/AppBar/section_heading.dart';
import 'package:flutter_application_1/Feature/Shop/Controller/checkout_controller.dart';
import 'package:flutter_application_1/Feature/Shop/Screens/profile/Cart/billing/widgets/payment_method.dart';
import 'package:flutter_application_1/Utils/constants/image_strings.dart';
import 'package:flutter_application_1/Utils/constants/sizes.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class BillingPaymentSection extends StatelessWidget {
  const BillingPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final checkoutController = Get.put(CheckOutController());
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        TsectionHeading(
          title: 'Payment Method',
          buttonTitle: 'Change',
          showActionButton: true,
          onpressed: () {
            checkoutController.selectedPaymentMethods(context);
          },
        ),
        const SizedBox(height: TSizes.spaceBtwItems / 2),
        Obx(
          () => PaymentTile(
              paymentMethod: checkoutController.selectedPaymentMethod.value),
        ),
      ],
    );
  }
}
