class CartItemModel {
  String productId;
  String title;
  String? image;
  double price;
  int quantity;
  String variationId;
  String? brandName;
  Map<String, dynamic>? selectedVariation;

  ///constructor
  CartItemModel(
      {required this.productId,
      required this.quantity,
      this.title = '',
      this.image,
      this.price = 0,
      this.variationId = '',
      this.brandName,
      this.selectedVariation});

  ///empty cartModel
  static CartItemModel empty() {
    return CartItemModel(
      productId: '',
      quantity: 0,
    );
  }

  /// to json
  Map<String, dynamic> toJson() {
    return {
      'ProductId': productId,
      'Quantity': quantity,
      'Title': title,
      'Image': image,
      'Price': price,
      'VariationId': variationId,
      'BrandName': brandName,
      'SelectedVariation': selectedVariation
    };
  }

  /// from json
  factory CartItemModel.fromJson(Map<String, dynamic> json) {
    return CartItemModel(
      productId: json['ProductId'],
      quantity: json['Quantity'],
      title: json['Title'],
      image: json['Image'],
      price: json['Price'],
      variationId: json['VariationId'],
      brandName: json['BrandName'],
      selectedVariation: json['SelectedVariation'] != null
          ? Map<String, dynamic>.from(json['SelectedVariation'])
          : null,
    );
  }

  ///
}
