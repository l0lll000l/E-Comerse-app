import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/Data/Repository/Product/product_repository.dart';
import 'package:flutter_application_1/Feature/Shop/Model/product_model.dart';
import 'package:flutter_application_1/Utils/loaders/loaders.dart';
import 'package:get/get.dart';

class AllProductsController extends GetxController {
  static AllProductsController get instance => Get.find();
  final repository = Get.put(ProductRepository());
  final RxList<ProductModel> products = <ProductModel>[].obs;
  final RxString selectedSortOption = "Name".obs;

  //// fetch products by quwery
  Future<List<ProductModel>> fetchProductQuery(Query? query) async {
    try {
      if (query == null) return [];
      final products = await repository.fetchProductsByQuery(query);
      products.addAll(products);
      return products;
    } catch (e) {
      Tloaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
      return [];
    }
  }

  void sortProducts(String sortOption) {
    selectedSortOption.value = sortOption;
    switch (sortOption) {
      case "Name":
        products.sort((a, b) => a.title.compareTo(b.title));
        break;
      case "Higer Price":
        products.sort((a, b) => b.price.compareTo(a.price));
        break;
      case "Lower Price":
        products.sort((a, b) => a.price.compareTo(b.price));
        break;
      case "date":
        products.sort((a, b) => a.date!.compareTo(b.date!));
        break;
      case 'sale':
        products.sort((a, b) {
          if (b.salePrice > 0) {
            return b.salePrice.compareTo(a.salePrice);
          } else {
            if (a.salePrice > 0) {
              return -1;
            } else {
              return 1;
            }
          }
        });
        break;
      default:
        products.sort((a, b) => a.title.compareTo(b.title));
    }
  }

  void assignProducts(List<ProductModel> products) {
    sortProducts(selectedSortOption.value);
    this.products.assignAll(products);
  }
}
