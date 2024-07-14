import 'package:flutter/material.dart';
import 'package:flutter_application_1/Common/widgets/success_screen/Success.dart';
import 'package:flutter_application_1/Data/Repository/Authentication/authentication_repository.dart';
import 'package:flutter_application_1/Data/Repository/order_repository.dart';
import 'package:flutter_application_1/Feature/Shop/Controller/address_controller.dart';
import 'package:flutter_application_1/Feature/Shop/Controller/cart_controller.dart';
import 'package:flutter_application_1/Feature/Shop/Controller/checkout_controller.dart';
import 'package:flutter_application_1/Feature/Shop/Model/order_model.dart';
import 'package:flutter_application_1/Navigation_menu.dart';
import 'package:flutter_application_1/Utils/PopUp/fullscreen_loader.dart';
import 'package:flutter_application_1/Utils/constants/enums.dart';
import 'package:flutter_application_1/Utils/constants/image_strings.dart';
import 'package:flutter_application_1/Utils/loaders/loaders.dart';
import 'package:get/get.dart';

class OrderController extends GetxController {
  static OrderController get instance => Get.find();

  /// variables

  final cartController = CartController.instance;
  final addressController = AddressController.instance;
  final checkoutController = CheckOutController.instance;
  final orderRepository = Get.put(OrderRepository());
  final controller = Get.put(NavigationController());

  ///functions
  Future<List<OrderModel>> fetchUserOrders() async {
    try {
      final userOrder = await orderRepository.fetchUserOrders();
      return userOrder;
    } catch (e) {
      Tloaders.errorSnackBar(title: 'Error', message: e.toString());
      return [];
    }
  }

  Future<void> processOrders(double totalAmount) async {
    try {
      TfullScreenLoader.openLoadingDialog(
          'Processing your order', TImages.loading);
      final userId = AuthenticationRepository.instance.authUser!.uid;
      if (userId.isEmpty) return;

      ///
      final order = OrderModel(
          Id: UniqueKey().toString(),
          userId: userId,
          status: OrderStatus.processing,
          totalAmount: totalAmount,
          orderDate: DateTime.now(),
          address: addressController.selectesAddress.value,
          deliveryDate: DateTime.now(),
          paymentMethod: checkoutController.selectedPaymentMethod.value.name,
          items: cartController.cartItems.toList());
      await orderRepository.saveOrder(order, userId);
      TfullScreenLoader.stopLoading();
      Get.to(() => SuccessScreen(
            image: TImages.nikeLogo,
            onpressed: () {
              controller.selectedIndex.value = 0;
              Get.to(() => const NavigationMenu());
            },
            title: 'success',
            subtitle: 'your order has been placed',
          ));
    } catch (e) {
      Tloaders.errorSnackBar(title: 'Error', message: e.toString());
    }
  }

  ///
}
