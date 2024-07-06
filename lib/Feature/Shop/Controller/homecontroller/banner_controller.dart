import 'package:flutter/foundation.dart';
import 'package:flutter_application_1/Data/Repository/Banner/banner_repository.dart';
import 'package:flutter_application_1/Feature/Shop/Model/banner_model.dart';
import 'package:flutter_application_1/Utils/loaders/loaders.dart';
import 'package:get/get.dart';

class BannerController extends GetxController {
  static BannerController get instance => Get.find();

  /// variables
  final carouselCurrentIndex = 0.obs;
  final isLoading = false.obs;
  final RxList<BannerModel> banners = <BannerModel>[].obs;

  /// update page index
  void updatePageIndex(index) {
    carouselCurrentIndex.value = index;
  }

  @override
  void onInit() {
    fetchBanners();
    super.onInit();
  }

  final bannersRepo = Get.put(BannerRepository());

  /// fetchBanners

  Future<void> fetchBanners() async {
    try {
      //  show loading
      isLoading.value = true;

      final banners = await bannersRepo.fetchBanners();
// assign banners
      this.banners.assignAll(banners);
      isLoading.value = false;
      if (kDebugMode) {
        print('==================banner Controller==================');
        print('all banner length : ${banners.length}');
        print(' banner image : ${banners[0].imageUrl}');
      }
    } catch (e) {
      // Tloaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
      Tloaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  /// upload bannners
  uploadBanners({id, required Map<String, dynamic> json}) async {
    try {
      print(json);
      if (id != null && id.isNotEmpty) {
        await bannersRepo.uploadBanner(id, json);
      }
    } catch (e) {
      Tloaders.errorSnackBar(title: 'Oh Sanp!', message: e.toString());
    }
  }
}
