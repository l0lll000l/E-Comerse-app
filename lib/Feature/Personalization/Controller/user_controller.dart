import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/Data/Repository/User/user_repository.dart';
import 'package:flutter_application_1/Feature/Authentication/Model/usermodel.dart';
import 'package:flutter_application_1/Utils/loaders/loaders.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();
  final userRepository = Get.put(UserRepository());
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
}
