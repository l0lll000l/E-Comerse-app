import 'package:flutter/material.dart';
import 'package:flutter_application_1/Data/Repository/address/address_repository.dart';
import 'package:flutter_application_1/Feature/Shop/Model/address_model.dart';
import 'package:flutter_application_1/Utils/Helpers/network_manager.dart';
import 'package:flutter_application_1/Utils/PopUp/fullscreen_loader.dart';
import 'package:flutter_application_1/Utils/constants/image_strings.dart';
import 'package:flutter_application_1/Utils/loaders/loaders.dart';
import 'package:get/get.dart';

class AddressController extends GetxController {
  static AddressController get instance => Get.find();

  /// variables
  final Rx<AddressModel> selectesAddress = AddressModel.empty().obs;
  final addressRepository = Get.put(AddressRepository());

  /// functions
  Future<List<AddressModel>> allUserAddresses() async {
    try {
      final addresses = await addressRepository.fetchUserAddress();
      selectesAddress.value = addresses.firstWhere(
        (element) => element.selectedAddress,
        orElse: () => AddressModel.empty(),
      );
      return addresses;
    } catch (e) {
      print(e.toString());
      Tloaders.errorSnackBar(title: 'Address not found', message: e.toString());
      return [];
    }
  }

  ///

  Future selectedAddress(AddressModel newSelectedAddress) async {
    try {
      Get.defaultDialog(
          title: '',
          onWillPop: () async {
            return false;
          },
          barrierDismissible: true,
          backgroundColor: Colors.transparent,
          content: CircularProgressIndicator());
      if (selectesAddress.value.id.isNotEmpty) {
        await addressRepository.updateSelectedAddress(
            addressId: selectesAddress.value.id, selected: false);
      }
      // newSelectedAddress.selectedAddress = true;
      print(newSelectedAddress.toJson());
      await addressRepository.updateSelectedAddress(
          addressId: newSelectedAddress.id, selected: true);
      Get.back();
    } catch (e) {
      print(e.toString());
      Tloaders.errorSnackBar(title: 'Failed', message: e.toString());
    }
  }

  Future addNewAddresses(AddressModel address) async {
    try {
      TfullScreenLoader.openLoadingDialog(
          'Storing Address...', TImages.addressSaving);

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TfullScreenLoader.stopLoading();
        return;
      }

      final id = await addressRepository.addAddress(address);
      address.id = id;
      await selectedAddress(address);

      TfullScreenLoader.stopLoading();
      Tloaders.successSnackBar(
          title: 'Address added successfully',
          message: 'Address added successfully');
      Get.back();
    } catch (e) {
      TfullScreenLoader.stopLoading();
      Tloaders.errorSnackBar(title: 'Failed', message: e.toString());
    }
  }
}
