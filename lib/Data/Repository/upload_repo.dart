import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/Utils/exceptions/firebase_exceptions.dart';
import 'package:flutter_application_1/Utils/exceptions/format_exceptions.dart';
import 'package:flutter_application_1/Utils/exceptions/platform_exceptions.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class UploadRepository extends GetxController {
  static UploadRepository get instance => Get.find();
  final _db = FirebaseFirestore.instance;

  /// Updater any field in specific user collection
  Future<void> updateSingleField(id, Map<String, dynamic> json) async {
    try {
      // await _db.collection("Products").doc(AuthenticationRepository.instance.authUser?.uid).update(json);

      final data = await _db.collection('Products').doc(id).get();
      if (data.exists) {
        await _db.collection('Products').doc(id).update(json);
      } else {
        await _db.collection('Products').doc(id).set(json);
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

  // /// update Brand
  // Future<void> updateSingleFieldBrand(id, Map<String, dynamic> json) async {
  //   try {
  //     // await _db.collection("Products").doc(AuthenticationRepository.instance.authUser?.uid).update(json);
  //     final data = await _db.collection('Products').doc(id).get();
  //     print(data.exists);
  //     if (data.exists) {
  //       print('data exist');
  //       await _db.collection('Products').doc(id).update(json);
  //     } else {
  //       print('data added');
  //       await _db.collection('Products').doc(id).set(json);
  //     }
  //   } on FirebaseException catch (e) {
  //     throw TFirebaseException(e.code).message;
  //   } on FormatException catch (_) {
  //     throw const TFormatException();
  //   } on PlatformException catch (e) {
  //     throw TPlatformException(e.code).message;
  //   } catch (e) {
  //     print(e.toString());
  //     throw 'Something went wrong. Please try again later';
  //   }
  // }

  /// image upload
  Future<String> uploadImage(String path, XFile image) async {
    try {
      final ref = FirebaseStorage.instance.ref(path).child(image.name);
      await ref.putFile(File(image.path));
      final url = await ref.getDownloadURL();

      return url;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again later';
    }
  }

//   /// upload dummy data
//   Future<void> uploadFiles(List<ProductModel> products) async {
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
