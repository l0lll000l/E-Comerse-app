import 'dart:io';
import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class IFirebaseStorageService extends GetxController {
  static IFirebaseStorageService get instance => Get.find();

  /// variables

  final _firebaseStorage = FirebaseStorage.instance;

  /// upload local assets from ide
  /// return image data list
  Future<Uint8List> getImageDataFromAssets(String path) async {
    try {
      final byteData = await rootBundle.load(path);
      final imagePath = byteData.buffer
          .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes);
      return imagePath;
    } catch (e) {
      throw 'Error loading page : $e';
    }
  }

  /// upload image to firebase cloud storage
  /// return image url
  /// upload file from asset
  Future<String> uploadImageData(
      String path, Uint8List image, String name) async {
    try {
      final ref = _firebaseStorage.ref(path).child(name);
      await ref.putData(image);
      final url = await ref.getDownloadURL();
      return url;
    } catch (e) {
      if (e is FirebaseException) {
        throw 'FirebaseException : ${e.message}';
      } else if (e is SocketException) {
        throw 'Network Error : ${e.message}';
      } else if (e is PlatformException) {
        throw 'PlatformException : ${e.message}';
      } else {
        throw 'Something went wrong. Please try again later';
      }
    }
  }

  /// upload image to firebase cloud storage
  /// return image url
  /// upload from mobile
  Future<String> uploadImageFile(String path, XFile image) async {
    try {
      final ref = _firebaseStorage.ref(path).child(image.name);
      await ref.putFile(File(image.path));
      final url = await ref.getDownloadURL();
      return url;
    } catch (e) {
      if (e is FirebaseException) {
        throw 'FirebaseException : ${e.message}';
      } else if (e is SocketException) {
        throw 'Network Error : ${e.message}';
      } else if (e is PlatformException) {
        throw 'PlatformException : ${e.message}';
      } else {
        throw 'Something went wrong. Please try again later';
      }
    }
  }
}
