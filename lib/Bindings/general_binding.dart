import 'package:flutter/material.dart';
import 'package:flutter_application_1/Feature/Shop/Controller/address_controller.dart';
import 'package:flutter_application_1/Feature/Shop/Controller/checkout_controller.dart';
import 'package:flutter_application_1/Feature/Shop/Controller/search_product_controller.dart';
import 'package:flutter_application_1/Utils/Helpers/network_manager.dart';
import 'package:flutter_application_1/Utils/Helpers/theme_controller.dart';
import 'package:get/get.dart';

class GeneralBingdings extends Bindings {
  @override
  void dependencies() {
    Get.put(NetworkManager());
    Get.put(AddressController());
    Get.put(CheckOutController());
    Get.put(ThemeController());
    Get.put(SearchController());
    Get.put(SearchProductController());
  }
}
