import 'package:flutter/material.dart';
import 'package:flutter_application_1/Feature/Authentication/Screens/Login/login.dart';
import 'package:get/get.dart';

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
    if (currentPageIndex.value == 2) {
      Get.offAll(const LoginScreen());
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
