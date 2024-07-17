import 'package:flutter_application_1/Feature/Shop/Controller/productController/image_controller.dart';
import 'package:flutter_application_1/Feature/Shop/Model/product_model.dart';
import 'package:flutter_application_1/Feature/Shop/Model/product_variation_model.dart';
import 'package:get/get.dart';

class VariationController extends GetxController {
  static VariationController get instance => Get.find();
  RxMap selectedAttributes = {}.obs;
  RxString variationStockStatus = ''.obs;

  Rx<ProductVariationModel> selectedVariation =
      ProductVariationModel.empty().obs;

  /// on
  void onAttributeSelected(
      ProductModel product, attributeName, AttributeValue) {
    final selectedAttributes =
        Map<String, dynamic>.from(this.selectedAttributes);

    selectedAttributes[attributeName] = AttributeValue;

    this.selectedAttributes[attributeName] = AttributeValue;

    final selectedVariation = product.productVariations!.firstWhere(
        (variation) => _isSameAttributeValues(
            variation.attributesValues, selectedAttributes),
        orElse: () => ProductVariationModel.empty());
    if (selectedVariation.image.isNotEmpty) {
      ImagesController.instance.selectedImges.value = selectedVariation.image;
      this.selectedVariation.value = selectedVariation;
    }
  }

  bool _isSameAttributeValues(Map<String, dynamic> variationAttributes,
      Map<String, dynamic> selectedAttributes) {
    if (variationAttributes.length != selectedAttributes.length) {
      return false;
    }
    for (final key in variationAttributes.keys) {
      if (variationAttributes[key] != selectedAttributes[key]) {
        return false;
      }
    }
    return true;
  }

  Set<dynamic> getAttributeAvailabilityInVariation(
      List<ProductVariationModel> variations, String attributeName) {
    final availableVariationAttibuteValues = variations
        .where((variation) =>
            variation.attributesValues[attributeName] != null &&
            variation.stock > 0)
        .map((variation) => variation.attributesValues[attributeName])
        .toSet();
    return availableVariationAttibuteValues;
  }

  /// reset selected attributes
  void resetSelectedAttributes() {
    selectedAttributes.clear();
    selectedVariation.value = ProductVariationModel.empty();
    variationStockStatus.value = '';
  }
}
