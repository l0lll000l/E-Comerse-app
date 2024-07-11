import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/Feature/Shop/Model/brand_model.dart';
import 'package:flutter_application_1/Feature/Shop/Model/product_model.dart';
import 'package:flutter_application_1/Utils/exceptions/firebase_exceptions.dart';
import 'package:flutter_application_1/Utils/exceptions/platform_exceptions.dart';
import 'package:get/get.dart';

class ProductRepository extends GetxController {
  static ProductRepository get instance => Get.find();
  final _db = FirebaseFirestore.instance;

  /// get limited featured products
  Future<List<ProductModel>> getFeaturedProducts() async {
    try {
      final snapShot = await _db
          .collection('Products')
          .where('IsFeatured', isEqualTo: true)
          .limit(4)
          .get();

      return snapShot.docs.map((e) => ProductModel.fromSnapShot(e)).toList();
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again later';
    }
  }

  Future<List<ProductModel>> getAllFeaturedProducts() async {
    try {
      final snapShot = await _db
          .collection('Products')
          .where('IsFeatured', isEqualTo: true)
          .get();

      return snapShot.docs.map((e) => ProductModel.fromSnapShot(e)).toList();
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again later';
    }
  }

  /// fetch favourite products
  Future<List<ProductModel>> getFavouriteProduct(
      {List<String> productIds = const ['0000000000000']}) async {
    try {
      if (productIds.isEmpty) return [];
      final snapShot = await _db
          .collection('Products')
          .where(FieldPath.documentId, whereIn: productIds)
          .get();
      return snapShot.docs
          .map((querySnapShot) => ProductModel.fromSnapShot(querySnapShot))
          .toList();
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      print('product list ${e.toString()}');
      throw 'Something went wrong. Please try again later';
    }
  }

  Future<List<BrandModel>> getAllFeaturedBrands() async {
    try {
      final snapShot = await _db
          .collection('Brands')
          .where('IsFeatured', isEqualTo: true)
          .get();
      print(snapShot.docs.length);
      return snapShot.docs.map((e) => BrandModel.fromQuerySnapShot(e)).toList();
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      print(e.toString());
      throw 'Something went wrong. Please try again later';
    }
  }

  Future<List<ProductModel>> fetchProductsByQuery(Query? query) async {
    try {
      final querySnapShot = await query!.get();
      final List<ProductModel> productlist = querySnapShot.docs
          .map((doc) => ProductModel.fromQuerySnapShot(doc))
          .toList();
      return productlist;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again later';
    }
  }

  /// get products by brand
  Future<List<ProductModel>> fetchProductsByBrand(
      {required String brandId, int limit = -1}) async {
    try {
      final querySnapshot = limit == -1
          ? await _db
              .collection('Products')
              .where('Brand.Id', isEqualTo: brandId)
              .get()
          : await _db
              .collection('Products')
              .where('Brand.Id', isEqualTo: brandId)
              .limit(limit)
              .get();
      final products = querySnapshot.docs
          .map((doc) => ProductModel.fromQuerySnapShot(doc))
          .toList();
      return products;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again later';
    }
  }

  /// get brand products by category
  Future<List<BrandModel>> fetchBrandByCategory(
      {String categoryId = '001'}) async {
    try {
      QuerySnapshot brandCategoryQuery = await _db
          .collection('BrandCategory')
          .where('CategoryId', isEqualTo: categoryId)
          .get();
      List<String> brandIds = brandCategoryQuery.docs
          .map((doc) => doc['BrandId'] as String)
          .toList();
      final brandQuery = await _db
          .collection('Brands')
          .where(FieldPath.documentId, whereIn: brandIds)
          .limit(2)
          .get();
      List<BrandModel> brands = brandQuery.docs
          .map((doc) => BrandModel.fromQuerySnapShot(doc))
          .toList();
      return brands;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      print('fetch brand by category : ${e.toString()}  ');
      throw 'Something went wrong. Please try again later';
    }
  }

  /// get all products by category
  Future<List<ProductModel>> fetchProductsByCategory(
      {String? categoryId = '001', int limit = -1}) async {
    try {
      QuerySnapshot productCategoryQuery = limit == -1
          ? await _db
              .collection('ProductCategory')
              .where('CategoryId', isEqualTo: categoryId)
              .get()
          : await _db
              .collection('ProductCategory')
              .where('CategoryId', isEqualTo: categoryId)
              .limit(limit)
              .get();
      print('fetch prodyct by category ${productCategoryQuery.docs.length} ');
      List<String> productIds = productCategoryQuery.docs
          .map((docs) => docs['ProductId'] as String)
          .toList();
      print('fetch prodyct by category ${productIds.length} ');
      final productsQuery = await _db
          .collection('Products')
          .where(FieldPath.documentId, whereIn: productIds)
          .get();

      List<ProductModel> products = productsQuery.docs
          .map((doc) => ProductModel.fromQuerySnapShot(doc))
          .toList();
      return products;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again later';
    }
  }

  /// upload dummy data
//   Future<void> uploadDummyData(List<ProductModel> products) async {
//     try {
//       final storage = Get.put(IFirebaseStorageService());
// // loop through products
//       for (var product in products) {
//         // get image data from local asset
//         final thumbnail =
//             await storage.getImageDataFromAssets(product.thumbnail);
//         final url = await storage.uploadImageData(
//             'Products/images', thumbnail, product.thumbnail.toString());
//         //assign url to product
//         product.thumbnail = url;
// // product list of images
//         if (product.images != null && product.images!.isNotEmpty) {
//           List<String> imagesUrl = [];
//           for (var image in product.images!) {
//             //get image data link from local assets
//             final assetImage = await storage.getImageDataFromAssets(image);
//             // upload image to get url
//             final url = await storage.uploadImageData(
//                 'Products/images', assetImage, image);
//             imagesUrl.add(url);
//           }
//           product.images!.clear();
//           product.images!.addAll(imagesUrl);
//         }
//         //upload variation images
//         // if (product.productType == producttype.varable.toString()) {
//         //   for(var variation in product.productVariations!){
//         //     final assetImage=await storage.getImageDataFromAssets(variation.image!);
//         //     final url=await storage.uploadImageData('Products/images', assetImage, variation.image!);
//         //     variation.image=url;
//         //   }
//         // }
// // store product in firebase
//         await _db.collection('Products').doc(product.id).set(product.toJson());
//       }
//     } on FirebaseException catch (e) {
//       throw e.message!;
//     } on SocketException catch (e) {
//       throw e.message;
//     } on PlatformException catch (e) {
//       throw e.message!;
//     } catch (e) {
//       throw e.toString();
//     }
//   }
}
