import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/Data/Repository/User/user_repository.dart';
import 'package:flutter_application_1/Feature/Personalization/Controller/user_controller.dart';
import 'package:flutter_application_1/Navigation_menu.dart';
import 'package:flutter_application_1/Utils/Helpers/network_manager.dart';
import 'package:flutter_application_1/Utils/PopUp/fullscreen_loader.dart';
import 'package:flutter_application_1/Utils/constants/image_strings.dart';
import 'package:flutter_application_1/Utils/loaders/loaders.dart';
import 'package:get/get.dart';

class UpdateNameController extends GetxController {
  static UpdateNameController get instance => Get.find();

  /// variables
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final userController = UserController.instance;
  final userRepository = UserRepository.instance;
  GlobalKey<FormState> updateUserNamesFormKey = GlobalKey<FormState>();
  @override
  void onInit() {
    super.onInit();
    initializeNames();
  }

  Future<void> initializeNames() async {
    firstName.text = userController.user.value.firstName;
    lastName.text = userController.user.value.lastName;
  }

  /// update user first name and last name
  Future<void> updateUserNames() async {
    try {
      // loader
      TfullScreenLoader.openLoadingDialog(
          'We are processing your information', TImages.loading);
      // check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();

      if (!isConnected) {
        TfullScreenLoader.stopLoading();
        Tloaders.warningSnackBar(title: 'No Internet Connection');
        return;
      }
      // form validation
      if (!updateUserNamesFormKey.currentState!.validate()) {
        TfullScreenLoader.stopLoading();

        return;
      }
      // update user first name and last name
      Map<String, dynamic> name = {
        'FirstName': firstName.text.trim(),
        'LastName': lastName.text.trim()
      };
      await userRepository.updateSingleField(name);

      // update user value
      userController.user.value.firstName = firstName.text.trim();
      userController.user.value.lastName = lastName.text.trim();
      // remove loader
      TfullScreenLoader.stopLoading();
      // show success snackbar
      Tloaders.successSnackBar(
          title: 'Name Updated', message: 'Your name has been updated');
      Get.off(() => const NavigationMenu());
    } catch (e) {
      TfullScreenLoader.stopLoading();
      Tloaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
