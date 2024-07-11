import 'dart:convert';

import 'package:flutter_application_1/Data/Repository/Product/product_repository.dart';
import 'package:flutter_application_1/Feature/Shop/Model/product_model.dart';
import 'package:flutter_application_1/Utils/Local_storage/storage.dart';
import 'package:flutter_application_1/Utils/loaders/loaders.dart';
import 'package:get/get.dart';

class FavouritesController extends GetxController {
  static FavouritesController get instance => Get.find();

  /// variables
  final favourites = <String, bool>{}.obs;

  /// functions
  @override
  void onInit() {
    super.onInit();
    initFavourites();
  }

  Future<void> initFavourites() async {
    final json = TLocalStorage.instance().readData(key: 'favourites');
    if (json != null) {
      final storedFavourites = jsonDecode(json) as Map<String, dynamic>;
      favourites.assignAll(
          storedFavourites.map((key, value) => MapEntry(key, value as bool)));
    }
  }

  bool isFavourite({required String productId}) {
    return favourites[productId] ?? false;
  }

  void toogleFavouriteProduct({required String productId}) {
    if (!favourites.containsKey(productId)) {
      favourites[productId] = true;
      saveFavouritesToStorage();
      Tloaders.customToast(message: 'Product has been added to wishlist');
    } else {
      TLocalStorage.instance().removeData(key: productId);
      favourites.remove(productId);
      saveFavouritesToStorage();
      favourites.refresh();
      Tloaders.customToast(message: 'Product has been removed from wishlist');
    }
  }

  void saveFavouritesToStorage() {
    print(favourites);
    final encodedFavourites = json.encode(favourites);
    TLocalStorage.instance()
        .saveData(key: 'favourites', value: encodedFavourites);
  }

  Future<List<ProductModel>> favouriteProducts() async {
    return await ProductRepository.instance
        .getFavouriteProduct(productIds: favourites.keys.toList());
  }
}
