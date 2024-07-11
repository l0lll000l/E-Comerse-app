import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/Data/Services/firebase_storage.dart';
import 'package:flutter_application_1/Feature/Shop/Model/category_model.dart';
import 'package:flutter_application_1/Utils/exceptions/firebase_exceptions.dart';
import 'package:flutter_application_1/Utils/exceptions/format_exceptions.dart';
import 'package:flutter_application_1/Utils/exceptions/platform_exceptions.dart';
import 'package:get/get.dart';

class CategoryRepository extends GetxController {
  static CategoryRepository get instance => Get.find();

  /// variables

  final _db = FirebaseFirestore.instance;

  /// get all categories
  Future<List<CategoryModel>> getAllCategory() async {
    try {
      final snapshot = await _db.collection('Categories').get();

      final list = snapshot.docs
          .map((document) => CategoryModel.fromSnapShot(document))
          .toList();

      return list;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again later';
    }
  }

  /// get subcategories

  Future<List<CategoryModel>> getSubCategory(
      {required String categoryId}) async {
    try {
      final snapshot = await _db
          .collection('Categories')
          .where('ParentId', isEqualTo: categoryId)
          .get();

      final list = snapshot.docs
          .map((document) => CategoryModel.fromSnapShot(document))
          .toList();
      print(list[0].toJson());
      return list;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again later';
    }
  }

  /// upload Categories to firebase
  Future<void> UploadDumyData(List<CategoryModel> categories) async {
    try {
      final storage = Get.put(IFirebaseStorageService());

      // loop category
      for (var category in categories) {
        // get image data link from local asset
        final file = await storage.getImageDataFromAssets(category.image);

        await storage.uploadImageData("Categories", file, category.image);
        // upload image to get url
        final url =
            await storage.uploadImageData("Categories", file, category.name);
        // assign url to category.image
        category.image = url;
        await _db
            .collection("Categories")
            .doc(category.id)
            .set(category.toJson());
      }
    } catch (e) {}
  }

  /// upload category

  Future<void> uploadCategory(id, Map<String, dynamic> json) async {
    try {
      final data = await _db.collection('Categories').doc(id).get();
      if (data.exists) {
        await _db.collection('Categories').doc(id).update(json);
      } else {
        await _db.collection('Categories').doc(id).set(json);
      }
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      print(e.toString());
      throw 'Something went wrong. Please try again later';
    }
  }
}
