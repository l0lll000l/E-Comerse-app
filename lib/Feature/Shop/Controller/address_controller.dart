import 'package:flutter/material.dart';
import 'package:flutter_application_1/Common/widgets/AppBar/section_heading.dart';
import 'package:flutter_application_1/Data/Repository/address/address_repository.dart';
import 'package:flutter_application_1/Feature/Shop/Model/address_model.dart';
import 'package:flutter_application_1/Feature/Shop/Screens/profile/ADDRESS/WIDGETS/single_address.dart';
import 'package:flutter_application_1/Utils/Helpers/cloud_helper_functions.dart';
import 'package:flutter_application_1/Utils/Helpers/network_manager.dart';
import 'package:flutter_application_1/Utils/PopUp/fullscreen_loader.dart';
import 'package:flutter_application_1/Utils/constants/image_strings.dart';

import 'package:flutter_application_1/Utils/constants/sizes.dart';
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
          content: const CircularProgressIndicator());
      if (selectesAddress.value.id.isNotEmpty) {
        await addressRepository.updateSelectedAddress(
            addressId: selectesAddress.value.id, selected: false);
      }
      // newSelectedAddress.selectedAddress = true;
      await addressRepository.updateSelectedAddress(
          addressId: newSelectedAddress.id, selected: true);
      Get.back();
    } catch (e) {
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

  Future<dynamic> selectNewAddressPopUp(BuildContext context) {
    allUserAddresses();
    return showModalBottomSheet(
        context: context,
        builder: (context) => Container(
              padding: const EdgeInsets.all(TSizes.lg),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TsectionHeading(
                    title: 'Select Address',
                  ),
                  FutureBuilder(
                    future: allUserAddresses(),
                    builder: (context, snapshot) {
                      final response =
                          TCloudHelperFunctions.checkMultiRecordState(
                              snapshot: snapshot);
                      if (response != null) return response;

                      return ListView.builder(
                        itemCount: snapshot.data!.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return TsingleAddress(
                            address: snapshot.data![index],
                            onTap: () async {
                              await selectedAddress(snapshot.data![index]);
                              Get.back();
                            },
                          );
                        },
                      );
                    },
                  )
                ],
              ),
            ));
  }
}
