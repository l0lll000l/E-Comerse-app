import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/Feature/Shop/Model/banner_model.dart';
import 'package:flutter_application_1/Utils/exceptions/firebase_exceptions.dart';
import 'package:flutter_application_1/Utils/exceptions/format_exceptions.dart';
import 'package:flutter_application_1/Utils/exceptions/platform_exceptions.dart';
import 'package:get/get.dart';

class BannerRepository extends GetxController {
  static BannerRepository get instance => Get.find();

  /// variables
  final _db = FirebaseFirestore.instance;

  /// get border
  Future<List<BannerModel>> fetchBanners() async {
    try {
      final result = await _db
          .collection('Banners')
          .where('Active', isEqualTo: true)
          .get();
      return result.docs
          .map((documentSnapshot) => BannerModel.fromSnapShot(documentSnapshot))
          .toList();
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again later';
    }
  }

  /// upload banner
  Future<void> uploadBanner(id, Map<String, dynamic> json) async {
    try {
      final data = await _db.collection('Banners').doc(id).get();
      if (data.exists) {
        await _db.collection('Banners').doc(id).update(json);
      } else {
        await _db.collection('Banners').doc(id).set(json);
      }
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
}
