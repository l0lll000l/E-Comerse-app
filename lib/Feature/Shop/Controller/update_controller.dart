import 'dart:developer';

import 'package:flutter_application_1/Data/Repository/upload_repo.dart';
import 'package:flutter_application_1/Feature/Shop/Model/product_model.dart';
import 'package:flutter_application_1/Feature/Shop/Model/product_variation_model.dart';
import 'package:flutter_application_1/Utils/loaders/loaders.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class UpdateController extends GetxController {
  static UpdateController get instance => Get.find();

  /// variables

  final title = ''.obs;
  final brandImage = ''.obs;
  String? brandImage1;

  final imageUploading = false.obs;
  final profileLoading = true.obs;
  final uploadRepo = Get.put(UploadRepository());
  RxList<ProductModel> allProducts = <ProductModel>[].obs;
  final List<Map<String, dynamic>> variation = <Map<String, dynamic>>[].obs;

  uploadImage({
    required String firebaseLocation,
  }) async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image != null) {
        imageUploading.value = true;
        // upload image
        final imageurl = await uploadRepo.uploadImage(
            firebaseLocation, image); //'Products/Images?Brand/');

        brandImage.value = imageurl;

        Tloaders.successSnackBar(
            title: 'congratulations',
            message: ' picture has been updated successfully');
      }
    } catch (e) {
      Tloaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      imageUploading.value = false;
    }
  }

  /// update price
  updateSingleFields({
    String? id,
    String? price,
    String? salePrice,
    String? stock,
    String? title,
    String? productType,
    String? categoryType,
    String? description,
    String? sku,
    List<String>? images,
    String? thumbnail,
  }) async {
    try {
      if (id != null && id.isNotEmpty) {
        Map<String, dynamic> json = {'Id': id};
        await uploadRepo.updateSingleField(id: id, json: json);
      }
      // update brand
      if (price != null && price.isNotEmpty) {
        Map<String, dynamic> json = {'Price': price};
        await uploadRepo.updateSingleField(id: id, json: json);
      }
      //sale price
      if (salePrice != null && salePrice.isNotEmpty) {
        Map<String, dynamic> json = {'SalePrice': salePrice};
        await uploadRepo.updateSingleField(id: id, json: json);
      }
      //title
      if (title != null && title.isNotEmpty) {
        Map<String, dynamic> json = {'Title': title};
        await uploadRepo.updateSingleField(id: id, json: json);
      }
      //product type
      if (productType != null && productType.isNotEmpty) {
        Map<String, dynamic> json = {'ProductType': productType};
        await uploadRepo.updateSingleField(id: id, json: json);
      }
      //category type
      if (categoryType != null && categoryType.isNotEmpty) {
        Map<String, dynamic> json = {'CategoryType': categoryType};
        await uploadRepo.updateSingleField(id: id, json: json);
      }
      //description
      if (description != null && description.isNotEmpty) {
        Map<String, dynamic> json = {'Desctription': description};
        await uploadRepo.updateSingleField(id: id, json: json);
      }
      // sku
      if (sku != null && sku.isNotEmpty) {
        Map<String, dynamic> json = {'Sku': sku};
        await uploadRepo.updateSingleField(id: id, json: json);
      }
      // image list
      if (images != null && images.isNotEmpty) {
        Map<String, dynamic> json = {'Images': images};
        await uploadRepo.updateSingleField(id: id, json: json);
      }

      //thumbnail
      if (thumbnail != null && thumbnail.isNotEmpty) {
        Map<String, dynamic> json = {'Thumbnail': thumbnail};
        await uploadRepo.updateSingleField(id: id, json: json);
      }

      // Map<String, dynamic> json = {'Date': DateTime.now().toString()};
      // await uploadRepo.updateSingleField(id, json);
    } catch (e) {
      log(e.toString());
      Tloaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      imageUploading.value = false;
    }
  }

  ///update brand
  updateBrand(
      {String? brandId,
      String? id,
      String? name,
      String? image,
      bool? isFeatured,
      int? productCount}) async {
    try {
      Map<String, dynamic> brand = {
        'Id': brandId,
        'Name': name ?? '',
        'Image': image ?? '',
        'IsFeatured': isFeatured ?? false,
        'ProductCount': productCount ?? 0
      };
      Map<String, dynamic> json = {'Brand': brand};
      await uploadRepo.updateSingleField(id: id, json: json);
    } catch (e) {
      Tloaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      imageUploading.value = false;
    }
  }

  /// update Attributes
  updateAttributes({
    String? id,
    String? color1,
    color2,
    color3,
    color4,
    size1,
    size2,
    size3,
    size4,
  }) async {
    try {
      Map<String, dynamic> colorModel = {
        'Name': 'Color',
        'Values': [color1 ?? '', color2 ?? '', color3 ?? '', color4 ?? '']
      };

      Map<String, dynamic> sizeModel = {
        'Name': 'Size',
        'Values': [size1 ?? '', size2 ?? '', size3 ?? '', size4 ?? '']
      };

      List attributes = [colorModel, sizeModel];
      Map<String, dynamic> json = {"ProductAttributes": attributes};
      await uploadRepo.updateSingleField(id: id, json: json);
    } catch (e) {
      Tloaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  void fetchVariation(String id) async {
    try {
      final data = await uploadRepo.fetchvariation(id);

      final List<ProductVariationModel>? data1 =
          (data.elementAt(0).productVariations);
      final List<Map<String, dynamic>> data2 =
          data1!.map((e) => e.toJson()).toList();
      variation.assignAll(data2);
    } catch (e) {
      Tloaders.warningSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  /// product variation
  updateVariations({id, required List variations}) async {
    try {
      Map<String, dynamic> json = {"ProductVariations": variations};
      await uploadRepo.updateSingleField(id: id, json: json);
    } catch (e) {
      Tloaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
