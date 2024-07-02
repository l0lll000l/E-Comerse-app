import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/Data/Repository/Repository.Authentication/authentication_repository.dart';
import 'package:flutter_application_1/Data/Repository/User/user_repository.dart';
import 'package:flutter_application_1/Feature/Authentication/Model/usermodel.dart';
import 'package:flutter_application_1/Feature/Authentication/Screens/Login/login.dart';
import 'package:flutter_application_1/Feature/Personalization/Screens/Profile/Widgets/re_authenticatr_userlogin.dart';
import 'package:flutter_application_1/Utils/Helpers/network_manager.dart';
import 'package:flutter_application_1/Utils/PopUp/fullscreen_loader.dart';
import 'package:flutter_application_1/Utils/constants/image_strings.dart';
import 'package:flutter_application_1/Utils/constants/sizes.dart';
import 'package:flutter_application_1/Utils/loaders/loaders.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  /// variables
  final Rx<UserModel> user = UserModel.empty().obs;
  final profileLoading = true.obs;
  final userRepository = Get.put(UserRepository());
  //variables
  final hidepassword = false.obs;
  final verifyEmail = TextEditingController();
  final verifyPassword = TextEditingController();
  GlobalKey<FormState> reAuthFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    fetchUserRecord();
    super.onInit();
  }

  /// fetch user data
  Future<void> fetchUserRecord() async {
    try {
      profileLoading.value = true;
      final user = await userRepository.fetchUserDetails();
      this.user(user);
      profileLoading.value = false;
    } catch (e) {
      user(UserModel.empty());
    } finally {
      profileLoading.value = false;
    }
  }

  /// save user data
  Future<void> saveUserRecords(UserCredential? userCredentials) async {
    try {
      // map data
      if (userCredentials != null) {
        final nameparts =
            UserModel.nameparts(userCredentials.user!.displayName! ?? '');
        final username = UserModel.generateUserName(
            userCredentials.user!.displayName! ?? '');
        final user = UserModel(
            email: userCredentials.user!.email!,
            firstName: nameparts[0],
            lastName:
                nameparts.length > 1 ? nameparts.sublist(1).join(' ') : '',
            userName: username,
            phone: userCredentials.user!.phoneNumber ?? '',
            profilePic: '',
            id: userCredentials.user!.uid,
            password: userCredentials.user!.photoURL ?? '');
        // save data
        await userRepository.saveUserRecord(user);
      }
    } catch (e) {
      Tloaders.warningSnackBar(
          title: 'Data not saved',
          message: 'Something went wrong while saving your information');
    }
  }

// delete warning
  void deleteAccountWarning() {
    Get.defaultDialog(
        contentPadding: const EdgeInsets.all(TSizes.md),
        title: 'Delete Account',
        middleText: 'Are you sure you want to delete your account?',
        confirm: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                side: const BorderSide(color: Colors.red)),
            onPressed: () => deleteUserAccount(),
            child: const Text('Delete')),
        cancel: OutlinedButton(
          onPressed: () => Get.back(),
          child: const Text('Cancel'),
        ));
  }

  // delete user
  Future<void> deleteUserAccount() async {
    try {
      // loader
      TfullScreenLoader.openLoadingDialog(
          'We are processing your information', TImages.loading);

      /// reAuthenticate user
      final auth = AuthenticationRepository.instance;
      final provider =
          auth.authUser!.providerData.map((e) => e.providerId).first;
      if (provider.isNotEmpty) {
        if (provider == 'google.com') {
          await auth.signInWithGoogle();
          await auth.deleteAccount();
          Get.offAll(() => const LoginScreen());
        } else if (provider == 'password') {
          TfullScreenLoader.stopLoading();
          Get.to(() => const ReAuthenticateUser());
        }
      }
    } catch (e) {
      TfullScreenLoader.stopLoading();

      Tloaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  // reauthenticate user before deleting
  Future<void> reAuthEmailAndPassword() async {
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
      if (!reAuthFormKey.currentState!.validate()) {
        TfullScreenLoader.stopLoading();

        return;
      }
      await AuthenticationRepository.instance.reAuthenticateUser(
          email: verifyEmail.text.trim(), password: verifyPassword.text.trim());
      await AuthenticationRepository.instance.deleteAccount();

      TfullScreenLoader.stopLoading();

      Get.offAll(() => const LoginScreen());
    } catch (e) {
      TfullScreenLoader.stopLoading();
      Tloaders.warningSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
