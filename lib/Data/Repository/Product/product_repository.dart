import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/Data/Services/firebase_storage.dart';
import 'package:flutter_application_1/Feature/Shop/Model/product_attribute_model.dart';
import 'package:flutter_application_1/Feature/Shop/Model/product_model.dart';
import 'package:flutter_application_1/Utils/exceptions/firebase_exceptions.dart';
import 'package:flutter_application_1/Utils/exceptions/platform_exceptions.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class ProductRepository extends GetxController {
  static ProductRepository get instance => Get.find();
  final _db = FirebaseFirestore.instance;

  /// get limited featured products
  Future<List<ProductModel>> GetFeaturedProducts() async {
    try {
      final snapShot = await _db
          .collection('Products')
          .where('ÍsFeatured', isEqualTo: true)
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

  /// upload dummy data
  Future<void> uploadDummyData(List<ProductModel> products) async {
    try {
      final storage = Get.put(IFirebaseStorageService());
// loop through products
      for (var product in products) {
        // get image data from local asset
        final thumbnail =
            await storage.getImageDataFromAssets(product.thumbnail);
        final url = await storage.uploadImageData(
            'Products/images', thumbnail, product.thumbnail.toString());
        //assign url to product
        product.thumbnail = url;
// product list of images
        if (product.images != null && product.images!.isNotEmpty) {
          List<String> imagesUrl = [];
          for (var image in product.images!) {
            //get image data link from local assets
            final assetImage = await storage.getImageDataFromAssets(image);
            // upload image to get url
            final url = await storage.uploadImageData(
                'Products/images', assetImage, image);
            imagesUrl.add(url);
          }
          product.images!.clear();
          product.images!.addAll(imagesUrl);
        }
        //upload variation images
        // if (product.productType == producttype.varable.toString()) {
        //   for(var variation in product.productVariations!){
        //     final assetImage=await storage.getImageDataFromAssets(variation.image!);
        //     final url=await storage.uploadImageData('Products/images', assetImage, variation.image!);
        //     variation.image=url;
        //   }
        // }
// store product in firebase
        await _db.collection('Products').doc(product.id).set(product.toJson());
      }
    } on FirebaseException catch (e) {
      throw e.message!;
    } on SocketException catch (e) {
      throw e.message;
    } on PlatformException catch (e) {
      throw e.message!;
    } catch (e) {
      throw e.toString();
    }
  }
}
