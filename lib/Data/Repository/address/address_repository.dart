import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/Data/Repository/Authentication/authentication_repository.dart';
import 'package:flutter_application_1/Feature/Shop/Model/address_model.dart';
import 'package:get/get.dart';

class AddressRepository extends GetxController {
  static AddressRepository get instance => Get.find();
  final _db = FirebaseFirestore.instance;
  Future<List<AddressModel>> fetchUserAddress() async {
    try {
      final userId = AuthenticationRepository.instance.authUser!.uid;
      if (userId.isEmpty) {
        throw 'unable to find user information, try again later';
      }
      final result = await _db
          .collection('Users')
          .doc(userId)
          .collection('Addresses')
          .get();
      return result.docs
          .map((documentSnapShot) =>
              AddressModel.fromDocumentSnapShot(documentSnapShot))
          .toList();
    } catch (e) {
      throw 'Something went wrong. Please try again later';
    }
  }

  Future<void> updateSelectedAddress({
    required String addressId,
    required bool selected,
  }) async {
    try {
      final userId = AuthenticationRepository.instance.authUser!.uid;
      await _db
          .collection('Users')
          .doc(userId)
          .collection('Addresses')
          .doc(addressId)
          .update({'SelectedAddress': selected, 'Id': addressId});
    } catch (e) {
      throw 'Something went wrong. Please try again later';
    }
  }

  Future<String> addAddress(AddressModel address) async {
    try {
      final userId = AuthenticationRepository.instance.authUser!.uid;

      final currentAddress = await _db
          .collection('Users')
          .doc(userId)
          .collection('Addresses')
          .add(address.toJson());
      return currentAddress.id;
    } catch (e) {
      throw 'Something went wrong. Please try again later';
    }
  }
}
