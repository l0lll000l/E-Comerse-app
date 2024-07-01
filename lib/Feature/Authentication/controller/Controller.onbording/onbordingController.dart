import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Feature/Authentication/Screens/Login/login.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class OnbordingController extends GetxController {
  static OnbordingController get instance => Get.find();

  ///variables
  final pagecontroller = PageController();
  Rx<int> currentPageIndex = 0.obs;

  /// update current index when page scroll
  void updatePageIndicator(index) {
    currentPageIndex.value = index;
  }

  ///jumb to the specific dot selected page.
  void dotNavigationClick(index) {
    currentPageIndex.value = index;
    pagecontroller.jumpToPage(index);
  }

  ///update current index and jump to next page
  void nextPage() {
    final storage = GetStorage();
    if (currentPageIndex.value == 2) {
      if (kDebugMode) {
        print('====================== GET STORAGE =====================');
        print(storage.read('IsFirstTime'));
      }

      storage.write('IsFirstTime', false);
      Get.offAll(() => const LoginScreen());
    } else {
      int page = currentPageIndex.value + 1;

      pagecontroller.jumpToPage(page);
    }
  }

  ///update current index and jump to the last page
  void skipPage() {
    currentPageIndex.value = 2;
    pagecontroller.jumpToPage(2);
  }
}
