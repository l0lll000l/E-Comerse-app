import 'package:cloud_firestore/cloud_firestore.dart';

class BrandModel {
  String id;
  String name;
  String image;
  bool? isFeatured;
  int? productCount;

  BrandModel(
      {required this.id,
      required this.name,
      required this.image,
      this.isFeatured,
      this.productCount});

  /// empty helper constructor

  static BrandModel empty() => BrandModel(
      id: '', name: '', image: '', isFeatured: false, productCount: 0);

  /// to json
  Map<String, dynamic> toJson() {
    return {
      'Id': id,
      'Name': name,
      'Image': image,
      'IsFeatured': isFeatured,
      'ProductCount': productCount
    };
  }

  /// from snapshot
  factory BrandModel.fromSnapShot(Map<String, dynamic> document) {
    final data = document;
    if (data.isEmpty) return BrandModel.empty();
    return BrandModel(
        id: data['Id'] ?? '',
        name: data['Name'] ?? '',
        image: data['Image'] ?? '',
        isFeatured: data['IsFeatured'] ?? false,
        productCount: data['ProductCount'] ?? 0);
  }
  factory BrandModel.fromQuerySnapShot(
      QueryDocumentSnapshot<Object?> document) {
    final data = document.data() as Map<String, dynamic>;
    return BrandModel(
        id: data['Id'] ?? '',
        name: data['Name'] ?? '',
        image: data['Image'] ?? '',
        isFeatured: data['IsFeatured'] ?? false,
        productCount: data['ProductCount'] ?? 0);
  }
}
