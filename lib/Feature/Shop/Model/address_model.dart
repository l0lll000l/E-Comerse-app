import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/Utils/formatters/formatter.dart';

class AddressModel {
  String id;
  final String name;
  final String phoneNumer;
  final String street;
  final String city;
  final String state;
  final String postalCode;
  final String country;
  late final bool selectedAddress;
  final DateTime? dateTime;

  AddressModel({
    this.dateTime,
    required this.id,
    required this.name,
    required this.phoneNumer,
    required this.street,
    required this.city,
    required this.state,
    required this.postalCode,
    required this.country,
    this.selectedAddress = true,
  });

  /// format phone number
  String get formattedPhoneNumber => Tformatter.formatPhoneNumber(phoneNumer);

  /// empty model
  static AddressModel empty() => AddressModel(
        id: '',
        city: '',
        country: '',
        name: '',
        phoneNumer: '',
        postalCode: '',
        state: '',
        street: '',
      );

  /// to json
  ///
  Map<String, dynamic> toJson() {
    return {
      'Id': id,
      'Name': name,
      'PhoneNumber': phoneNumer,
      'Street': street,
      'City': city,
      'State': state,
      'PostalCode': postalCode,
      'Country': country,
      'SelectedAddress': selectedAddress,
      'DateTime': DateTime.now(),
    };
  }

  /// from Map
  factory AddressModel.fromMap(Map<String, dynamic> data) {
    return AddressModel(
      id: data['Id'] as String,
      name: data['Name'] as String,
      phoneNumer: data['PhoneNumber'] as String,
      street: data['Street'] as String,
      city: data['City'] as String,
      state: data['State'] as String,
      postalCode: data['PostalCode'] as String,
      country: data['Country'] as String,
      selectedAddress: data['SelectedAddress'] as bool,
      dateTime: (data['DateTime'] as Timestamp).toDate(),
    );
  }

  /// from document snapshot
  factory AddressModel.fromDocumentSnapShot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    return AddressModel(
      id: snapshot.id,
      name: data['Name'] ?? '',
      phoneNumer: data['PhoneNumber'] ?? '',
      street: data['Street'] ?? '',
      city: data['City'] ?? '',
      state: data['State'] ?? '',
      postalCode: data['PostalCode'] ?? '',
      country: data['Country'] ?? '',
      selectedAddress: data['SelectedAddress'] as bool,
      dateTime: (data['DateTime'] as Timestamp).toDate(),
    );
  }
  @override
  String toString() {
    return '$street,$city,$state,$postalCode,$country';
  }

  ///
}
