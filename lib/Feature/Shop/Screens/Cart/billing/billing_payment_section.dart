import 'package:flutter/material.dart';
import 'package:flutter_application_1/Common/widgets/AppBar/section_heading.dart';
import 'package:flutter_application_1/Feature/Shop/Screens/Cart/billing/widgets/payment_method.dart';
import 'package:flutter_application_1/Utils/constants/image_strings.dart';
import 'package:flutter_application_1/Utils/constants/sizes.dart';

class BillingPaymentSection extends StatelessWidget {
  const BillingPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        TsectionHeading(
          title: 'Payment Method',
          buttonTitle: 'Change',
          showActionButton: true,
          onpressed: () {},
        ),
        const SizedBox(height: TSizes.spaceBtwItems / 2),
        const PaymentMethod(
          image: TImages.applePay,
          name: 'Apple pay',
        ),
        SizedBox(height: TSizes.spaceBtwItems / 2),
        const PaymentMethod(
          image: TImages.paypal,
          name: 'Paypal',
        ),
        SizedBox(height: TSizes.spaceBtwItems / 2),
        const PaymentMethod(
          image: TImages.googlePay,
          name: 'Googlepay',
        ),
        SizedBox(height: TSizes.spaceBtwItems / 2),
        const PaymentMethod(
          image: TImages.paytm,
          name: 'Paytm',
        ),
        SizedBox(height: TSizes.spaceBtwItems / 2),
        const PaymentMethod(
          image: TImages.creditCard,
          name: 'Card',
        )
      ],
    );
  }
}
