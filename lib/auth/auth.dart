import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/helper/databaseService.dart';

class AuthServices {
  String email = 'athulmp886@gmail.com';
  String password = '123456789';
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  //-------------------------------------------------------------
  Future login() async {
    try {
      User user = (await firebaseAuth.signInWithEmailAndPassword(
              email: email, password: password))
          .user!;
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }

  Future register() async {
    try {
      User user = (await firebaseAuth.createUserWithEmailAndPassword(
              email: email, password: password))
          .user!;
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }
}
