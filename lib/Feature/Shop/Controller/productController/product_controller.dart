import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/Data/Repository/Product/product_repository.dart';
import 'package:flutter_application_1/Feature/Shop/Model/brand_model.dart';
import 'package:flutter_application_1/Feature/Shop/Model/product_model.dart';
import 'package:flutter_application_1/Utils/loaders/loaders.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  static ProductController get instance => Get.find();

  /// variables
  RxList<ProductModel> featuredProducts = <ProductModel>[].obs;

  final isLoading = false.obs;
  final selectedProductImage = 0.obs;
  final variationStockStatus = ''.obs;
  final selectedImageString = ''.obs;
  List<BrandModel> featuredBrands = <BrandModel>[].obs;

  /// oninit
  @override
  void onInit() {
    fetchFeaturedBrands();
    fetchFeaturedProducts();
    super.onInit();
  }

  final productRepository = Get.put(ProductRepository());
  void fetchFeaturedProducts() async {
    try {
      //  show loading
      isLoading.value = true;
      // fetch category
      final products = await ProductRepository().getFeaturedProducts();

      featuredProducts.assignAll(products);
      print(featuredProducts[0].brand!.toString());
    } catch (e) {
      Tloaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  /// get featured brands
  void fetchFeaturedBrands() async {
    try {
      //  show loading
      isLoading.value = true;
      // fetch category
      final products = await productRepository.getAllFeaturedBrands();
      print('Length ${products.length}');

      this.featuredBrands = products;
      print(featuredBrands.length);
    } catch (e) {
      print('error2: ${e.toString()} ');
      Tloaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  /// get brand specifc products
  Future<List<ProductModel>> getBrandProducts(
      {required String brandId, limit = -1}) async {
    try {
      final products = await productRepository.fetchProductsByBrand(
          brandId: brandId, limit: limit);
      return products;
    } catch (e) {
      print('error2: ${e.toString()} ');
      Tloaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
      return [];
    }
  }

  Future<List<ProductModel>> fetchAllFeaturedProducts() async {
    try {
      final products = await productRepository.getAllFeaturedProducts();
      return products;
    } catch (e) {
      Tloaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
      return [];
    }
  }

  /// get brand by category

  Future<List<BrandModel>> getbrandsByCategory(
      {String categoryId = '001'}) async {
    try {
      final brands =
          await productRepository.fetchBrandByCategory(categoryId: categoryId);
      return brands;
    } catch (e) {
      print('error2: ${e.toString()} ');
      Tloaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
      return [];
    }
  }

  /// get produtc by category
  Future<List<ProductModel>> GetProductByCategory(
      {String categoryId = '001', int limit = -1}) async {
    try {
      final products = await productRepository.fetchProductsByCategory(
          categoryId: categoryId, limit: limit);
      return products;
    } catch (e) {
      print('error2: ${e.toString()} ');
      Tloaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
      return [];
    }
  }

  /// get sub category
}
