class ProductVariationModel {
  final String id;
  String sku;
  String image;
  String? desctription;
  double price;
  double salePrice;
  int stock;
  Map<String, dynamic> attributesValues;
  ProductVariationModel(
      {required this.id,
      this.sku = '',
      this.image = '',
      this.price = 0.0,
      this.salePrice = 0.0,
      this.stock = 0,
      required this.attributesValues,
      this.desctription});

  // empty helper constructor

  static ProductVariationModel empty() => ProductVariationModel(
        id: '',
        attributesValues: {},
      );

  // to json

  Map<String, dynamic> toJson() {
    return {
      'Id': id,
      'Sku': sku,
      'Image': image,
      'Desctription': desctription,
      'Price': price,
      'SalePrice': salePrice,
      'Stock': stock,
      'AttributesValues': attributesValues
    };
  }
  // from snapshot

  factory ProductVariationModel.fromSnapShot(Map<String, dynamic> document) {
    final data = document;
    return ProductVariationModel(
      id: data['Id'] ?? '',
      sku: data['Sku'] ?? '',
      image: data['Image'] ?? '',
      desctription: data['Desctription'] ?? '',
      price: double.parse((data['Price'] ?? 0.0).toString()),
      salePrice: double.parse((data['SalePrice'] ?? 0.0).toString()),
      stock: data['Stock'] ?? 0,
      attributesValues: Map<String, dynamic>.from(data['AttributesValues']),
    );
  }
}
