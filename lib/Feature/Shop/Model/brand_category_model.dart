import 'package:cloud_firestore/cloud_firestore.dart';

class BrandCategoryModel {
  final String brandId;
  final String categoryId;

  BrandCategoryModel({required this.brandId, required this.categoryId});

  Map<String, dynamic> toJson() {
    return {
      'BrandId': brandId,
      'CategoryId': categoryId,
    };
  }

  factory BrandCategoryModel.fromSnapShot(DocumentSnapshot document) {
    final data = document.data() as Map<String, dynamic>;

    return BrandCategoryModel(
        brandId: data['BrandId'] ?? '', categoryId: data['CategoryId'] ?? '');
  }
}
