import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController {
  static ThemeController get instance => Get.find();

  RxBool isDarkMode = false.obs;

  void changeTheme() {
    isDarkMode.value = !isDarkMode.value;
  }

  @override
  void onInit() {
    super.onInit();
    isDarkMode.value = Get.isDarkMode;
  }

  themeMode() {
    if (isDarkMode.value) {
      return ThemeMode.dark;
    } else {
      return ThemeMode.light;
    }
  }
}
