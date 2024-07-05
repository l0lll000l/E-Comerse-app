import 'package:flutter/foundation.dart';
import 'package:flutter_application_1/Data/Repository/Product/product_repository.dart';
import 'package:flutter_application_1/Data/Services/dummy_data.dart';
import 'package:flutter_application_1/Feature/Shop/Model/product_model.dart';
import 'package:flutter_application_1/Utils/loaders/loaders.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  static ProductController get instance => Get.find();

  /// variables
  RxList<ProductModel> featuredProducts = <ProductModel>[].obs;
  final isLoading = false.obs;

  /// oninit
  @override
  void onInit() {
    fetchFeaturedProducts();
    super.onInit();
  }

  void fetchFeaturedProducts() async {
    try {
      //  show loading
      isLoading.value = true;
      // fetch category
      final products = await ProductRepository().getFeaturedProducts();
      if (kDebugMode) {
        print('==================product Controller==================');
        print(products.length);
      }
      featuredProducts.assignAll(products);
      print(featuredProducts[0].brand!.toString());
    } catch (e) {
      Tloaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  /// upload dummy data
  // Future<void> uploadDummyData() async {
  //   try {
  //     await ProductRepository().uploadDummyData(TdummyData.products);
  //   } catch (e) {
  //     Tloaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
  //   }
  // }
}
