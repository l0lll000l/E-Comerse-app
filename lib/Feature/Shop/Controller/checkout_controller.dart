import 'package:flutter/material.dart';
import 'package:flutter_application_1/Common/widgets/AppBar/section_heading.dart';
import 'package:flutter_application_1/Feature/Shop/Model/payment_method_model.dart';
import 'package:flutter_application_1/Feature/Shop/Screens/profile/Cart/billing/widgets/payment_method.dart';
import 'package:flutter_application_1/Utils/constants/image_strings.dart';
import 'package:flutter_application_1/Utils/constants/sizes.dart';
import 'package:get/get.dart';

class CheckOutController extends GetxController {
  static CheckOutController get instance => Get.find();
  final Rx<PaymentMethodModel> selectedPaymentMethod =
      PaymentMethodModel.empty().obs;

  @override
  void onInit() {
    selectedPaymentMethod.value =
        PaymentMethodModel(name: 'Paypal', image: TImages.paypal);
    super.onInit();
  }

  Future<dynamic> selectedPaymentMethods(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (context) => SingleChildScrollView(
          child: Container(
        padding: const EdgeInsets.all(TSizes.lg),
        child: Column(
          children: [
            const TsectionHeading(
                title: 'Select Payment Method', showActionButton: false),
            const SizedBox(height: TSizes.spaceBtwItems),
            PaymentTile(
                paymentMethod:
                    PaymentMethodModel(name: 'Paypal', image: TImages.paypal)),
            const SizedBox(height: TSizes.spaceBtwItems),
            PaymentTile(
                paymentMethod: PaymentMethodModel(
                    name: 'Card', image: TImages.creditCard)),
            const SizedBox(height: TSizes.spaceBtwItems),
            PaymentTile(
                paymentMethod: PaymentMethodModel(
                    name: 'Googlepay', image: TImages.googlePay)),
            const SizedBox(height: TSizes.spaceBtwItems),
            PaymentTile(
                paymentMethod:
                    PaymentMethodModel(name: 'Paytm', image: TImages.paytm)),
            const SizedBox(height: TSizes.spaceBtwItems),
            PaymentTile(
                paymentMethod: PaymentMethodModel(
                    name: 'Apple pay', image: TImages.applePay)),
          ],
        ),
      )),
    );
  }
}
