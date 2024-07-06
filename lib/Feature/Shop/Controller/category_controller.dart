import 'package:flutter/foundation.dart';
import 'package:flutter_application_1/Data/Repository/Category/category_respository.dart';
import 'package:flutter_application_1/Feature/Shop/Model/category_model.dart';
import 'package:flutter_application_1/Utils/loaders/loaders.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  static CategoryController get instance => Get.find();

  /// variables
  final isLoading = false.obs;
  final _categoryRepository = Get.put(CategoryRepository());
  RxList<CategoryModel> allCategories = <CategoryModel>[].obs;
  RxList<CategoryModel> featuredCategories = <CategoryModel>[].obs;

  /// oninit
  @override
  void onInit() {
    fetchCategory();
    super.onInit();
  }

  /// load data
  Future<void> fetchCategory() async {
    try {
      //  show loading

      isLoading.value = true;
      // fetch category
      final categories = await _categoryRepository.getAllCategory();

      //update category list
      allCategories.assignAll(categories);

      isLoading.value = false;
      //filter featured category
      featuredCategories.assignAll(allCategories
          .where((category) => category.isFeatured && category.parentId.isEmpty)
          .take(8)
          .toList());

      if (kDebugMode) {
        print('==================Category Controller==================');
        print('all category length : ${allCategories.length}');
        print('featured category length : ${featuredCategories.length}');
      }
    } catch (e) {
      // Tloaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
      Tloaders.warningSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  /// load selected data

  ///get category / sub category products
  ///
  ///update category

  uploadcategory({id, required Map<String, dynamic> json}) async {
    try {
      print(json);
      if (id != null && id.isNotEmpty) {
        await _categoryRepository.uploadCategory(id, json);
        Tloaders.successSnackBar(
            title: 'Success!', message: 'category Updated successfully ');
      }
    } catch (e) {
      Tloaders.errorSnackBar(title: 'Oh Sanp!', message: e.toString());
    }
  }
}
