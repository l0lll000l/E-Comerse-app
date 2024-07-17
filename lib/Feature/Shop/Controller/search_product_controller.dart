import 'package:flutter_application_1/Data/Repository/Product/product_repository.dart';
import 'package:flutter_application_1/Feature/Shop/Model/product_model.dart';
import 'package:flutter_application_1/Utils/loaders/loaders.dart';
import 'package:get/get.dart';

class SearchProductController extends GetxController {
  static SearchProductController get instance => Get.find();
  List<ProductModel> productList = <ProductModel>[].obs;
  List<ProductModel> sortedProducts = <ProductModel>[].obs;
  searchProduct() async {
    try {
      final products = await ProductRepository.instance.SearchAllProducts();

      productList.assignAll(products);
    } catch (e) {
      Tloaders.errorSnackBar(title: 'Failed', message: e.toString());
    }
  }

  Future<List<ProductModel>> searchResult({String? name = 'n'}) async {
    try {
      print(productList.length);
      print(name);
      if (productList.isEmpty) {
        await searchProduct();
      }
      List<ProductModel> matchingProducts = productList
          .where((product) =>
              product.title.toLowerCase().contains(name!.toLowerCase()))
          .toList();
      // matchingProducts.sort((a, b) => a.title.compareTo(b.title));
      List<ProductModel> sortedMatchingProducts = [...matchingProducts]
        ..sort((a, b) => a.title.compareTo(b.title));
      for (var product in sortedMatchingProducts) {
        print(product.title);
      }
      print(sortedMatchingProducts.length);

      sortedProducts.assignAll(sortedMatchingProducts);
      return sortedMatchingProducts;
    } catch (e) {
      Tloaders.errorSnackBar(title: 'Failed', message: e.toString());
      return [];
    }
  }
}
