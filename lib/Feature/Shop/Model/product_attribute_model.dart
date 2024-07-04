class ProductAttributeModel {
  String? name;
  final List<String>? values;

  ProductAttributeModel({this.name, this.values});

// empty helper constructor
  static ProductAttributeModel empty() => ProductAttributeModel(
        name: '',
        values: [],
      );

  // to json
  Map<String, dynamic> toJson() {
    return {
      'Name': name,
      'Values': values,
    };
  }

  // from snapshot
  factory ProductAttributeModel.fromSnapShot(Map<String, dynamic> document) {
    final data = document;
    if (data.isEmpty) return ProductAttributeModel.empty();
    return ProductAttributeModel(
      name: data.containsKey('Name') ? data['Name'] : '',
      values: List<String>.from(data['Values']),
    );
  }
}
