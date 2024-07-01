import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/Utils/formatters/formatter.dart';

class UserModel {
  final String email;
  String password;
  String firstName;
  String lastName;
  final String userName;
  String phone;
  String profilePic;
  final String id;

  UserModel(
      {required this.email,
      required this.password,
      required this.firstName,
      required this.lastName,
      required this.userName,
      required this.phone,
      required this.profilePic,
      required this.id});

  /// helperfunction to get full name
  String get fullName => '$firstName $lastName';

  /// format phone number
  String get formattedPhone => Tformatter.formatPhoneNumber(phone);

  /// split fullname to get first and last name
  static List<String> nameparts(fullname) => fullname.split("");

  /// function to generate username
  static String generateUserName(fullname) {
    List<String> nameparts = fullname.split(" ");
    String firstName = nameparts[0].toLowerCase();
    String lastName = nameparts.length > 1 ? nameparts[1].toLowerCase() : "";
    String camelCaseUsername = "$firstName$lastName";
    String userNameWithPrefix = "cwt_$camelCaseUsername";
    return userNameWithPrefix;
  }

  /// function to create empty usermodel
  static UserModel empty() => UserModel(
      email: '',
      password: '',
      firstName: '',
      lastName: '',
      userName: '',
      phone: '',
      profilePic: '',
      id: '');

  /// convert usermodel to json  to store in firebase
  Map<String, dynamic> toJson() {
    return {
      'Email': email,
      'Password': password,
      'FirstName': firstName,
      'LastName': lastName,
      'UserName': userName,
      'Phone': phone,
      'ProfilePic': profilePic,
    };
  }

  /// convert firebase snapshot to usermodel
  factory UserModel.fromSnapShot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return UserModel(
          email: data['Email'] ?? '',
          password: data['Password'] ?? '',
          firstName: data['FirstName'] ?? '',
          lastName: data['LastName'] ?? '',
          userName: data['UserName'] ?? '',
          phone: data['Phone'] ?? '',
          profilePic: data['ProfilePic'] ?? '',
          id: document.id);
    }
    return UserModel.empty();
  }
}
