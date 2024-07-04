import 'package:flutter_application_1/Data/Repository/Product/product_repository.dart';
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
      final products = await ProductRepository().GetFeaturedProducts();
      featuredProducts.assignAll(products);
    } catch (e) {
      Tloaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
