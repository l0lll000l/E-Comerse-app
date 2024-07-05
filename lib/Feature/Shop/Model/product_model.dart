import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/Feature/Shop/Model/brand_model.dart';
import 'package:flutter_application_1/Feature/Shop/Model/product_attribute_model.dart';
import 'package:flutter_application_1/Feature/Shop/Model/product_variation_model.dart';

class ProductModel {
  String id;
  int stock;
  String? sku;
  double price;
  String title;
  DateTime? date;
  double salePrice;
  String thumbnail;
  bool? isFeatured;
  BrandModel? brand;
  String? desctription;
  String? categoryType;
  List<String>? images;
  String productType;
  List<ProductAttributeModel>? productAttributes;
  List<ProductVariationModel>? productVariations;
  ProductModel(
      {required this.id,
      required this.price,
      required this.title,
      this.date,
      this.sku,
      required this.thumbnail,
      this.isFeatured,
      this.brand,
      this.desctription,
      this.categoryType,
      this.images,
      required this.productType,
      this.productAttributes,
      this.productVariations,
      required this.stock,
      this.salePrice = 0.0});

// empty helper constructor
  static ProductModel empty() => ProductModel(
        id: '',
        price: 0.0,
        title: '',
        thumbnail: '',
        stock: 0,
        productType: '',
      );

  /// to json
  Map<String, dynamic> toJson() {
    return {
      'Id': id,
      'Price': price,
      'Title': title,
      'Sku': sku,
      'Date': date,
      'Thumbnail': thumbnail,
      'IsFeatured': isFeatured,
      'Brand': brand!.toJson(),
      'Desctription': desctription,
      'CategoryType': categoryType,
      'Images': images ?? [],
      'ProductType': productType,
      'ProductAttributes': productAttributes != null
          ? productAttributes!.map((e) => e.toJson()).toList()
          : [],
      'ProductVariations': productVariations != null
          ? productVariations!.map((e) => e.toJson()).toList()
          : [],
      'Stock': stock,
      'SalePrice': salePrice
    };
  }

  /// from snapshot
  factory ProductModel.fromSnapShot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() == null) {
      return ProductModel.empty();
    }
    final data = document.data()!;
    return ProductModel(
        id: document.id,
        sku: data['Sku'] ?? '',
        title: data['Title'] ?? '',
        stock: data['Stock'] ?? 0,
        isFeatured: data['IsFeatured'] ?? false,
        price: double.parse((data['Price'] ?? 0.0).toString()),
        salePrice: double.parse((data['SalePrice'] ?? 0.0).toString()),
        thumbnail: data['Thumbnail'] ?? '',
        categoryType: data['CategoryType'] ?? '',
        desctription: data['Desctription'] ?? '',
        productType: data['ProductType'] ?? '',
        brand: BrandModel.fromSnapShot(data['Brand']),
        images: data['Images'] != null ? List<String>.from(data['Images']) : [],
        date:
            data['Date'] != null ? (data['Date'] as Timestamp).toDate() : null,
        productAttributes: (data['ProductAttributes'] as List<dynamic>)
            .map((e) => ProductAttributeModel.fromSnapShot(e))
            .toList(),
        productVariations: (data['ProductVariations'] as List<dynamic>)
            .map((e) => ProductVariationModel.fromSnapShot(e))
            .toList());
  }
}
