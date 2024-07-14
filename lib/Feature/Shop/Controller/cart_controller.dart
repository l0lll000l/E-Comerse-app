import 'package:flutter_application_1/Feature/Shop/Controller/variation_controller.dart';
import 'package:flutter_application_1/Feature/Shop/Model/cart_item_model.dart';
import 'package:flutter_application_1/Feature/Shop/Model/product_model.dart';
import 'package:flutter_application_1/Utils/Local_storage/storage.dart';
import 'package:flutter_application_1/Utils/loaders/loaders.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  static CartController get instance => Get.find();

  /// variables
  RxInt noOfVariables = 0.obs;
  RxDouble totalCartprice = 0.0.obs;
  RxInt productQuantityInCart = 0.obs;
  RxList<CartItemModel> cartItems = <CartItemModel>[].obs;
  final variationController = Get.put(VariationController());
  @override
  void onInit() {
    loadCartItems();
    super.onInit();
  }

  /// functions
  void addToCart(ProductModel product) {
    // if (productQuantityInCart.value < 1) {
    //   Tloaders.customToast(message: 'Select Quantity');
    //   return;
    // }
    if (product.productType != null &&
        variationController.selectedVariation.value.id.isEmpty) {
      Tloaders.customToast(message: 'Select Variation');
      return;
    }
    if (product.productType != null && product.productType.isNotEmpty) {
      if (variationController.selectedVariation.value.stock < 1) {
        Tloaders.warningSnackBar(
            title: 'Out of Stock', message: 'Please select another variation');
        return;
      }
    } else {
      if (product.stock < 1) {
        Tloaders.warningSnackBar(
            title: 'Out of Stock', message: 'Please select another variation');
        return;
      }
    }
    final selectedCartItems =
        convertToCartItem(product, productQuantityInCart.value);

    int index = cartItems.indexWhere((cartitem) =>
        cartitem.productId == selectedCartItems.productId &&
        cartitem.variationId == selectedCartItems.variationId);
    if (index >= 0) {
      cartItems[index].quantity = selectedCartItems.quantity;
    } else {
      cartItems.add(selectedCartItems);
    }
    updateCart();
    Tloaders.customToast(message: 'Product added to cart');
  }

  ///add item to cart
  void addOneToCart(CartItemModel item) {
    int index = cartItems.indexWhere((cartItem) =>
        cartItem.productId == item.productId &&
        cartItem.variationId == item.variationId);

    if (index >= 0) {
      cartItems[index].quantity++;
      updateCart();
    } else {
      cartItems.add(item);
      updateCart();
    }
  }

  ///remove item from cart
  void removeOneFromCart(CartItemModel item) {
    int index = cartItems.indexWhere((cartItem) =>
        cartItem.productId == item.productId &&
        cartItem.variationId == item.variationId);
    if (index >= 0) {
      if (cartItems[index].quantity > 1) {
        cartItems[index].quantity--;
        updateCart();
      } else {
        cartItems[index].quantity == 1
            ? removeFromCartDialog(index)
            : cartItems.removeAt(index);
        updateCart();
      }
    }
    updateCart();
  }

  void removeFromCartDialog(int index) {
    Get.defaultDialog(
      title: 'Remove Product',
      middleText:
          'Are you sure you want to remove this product from your cart?',
      onConfirm: () {
        cartItems.removeAt(index);
        updateCart();
        Tloaders.customToast(message: 'Product removed from cart');
        Get.back();
      },
      onCancel: () => () => Get.back(),
    );
  }

  /// product model to cartItem model
  CartItemModel convertToCartItem(ProductModel product, int quantity) {
    if (product.productType != null) {
      variationController.resetSelectedAttributes();
    }
    final variation = variationController.selectedVariation.value;
    final isVariation = variation.id.isNotEmpty;
    final price = isVariation
        ? variation.salePrice > 0.0
            ? variation.salePrice
            : variation.price
        : product.salePrice > 0.0
            ? product.salePrice
            : product.price;
    return CartItemModel(
      productId: product.id,
      quantity: quantity,
      brandName: product.brand!.name,
      image: isVariation ? variation.image : product.thumbnail,
      title: product.title,
      variationId: variation.id,
      selectedVariation: isVariation ? variation.attributesValues : null,
      price: price,
    );
  }

  ///update cart
  void updateCart() {
    updateCartTotals();
    saveCartItems();
    cartItems.refresh();
  }

  void updateCartTotals() {
    double calculatedTotalPrice = 0.0;
    int calculatedNoOfItems = 0;
    for (var item in cartItems) {
      calculatedTotalPrice += item.price * item.quantity.toDouble();
      calculatedNoOfItems += item.quantity;
    }
    totalCartprice.value = calculatedTotalPrice;
    noOfVariables.value = calculatedNoOfItems;
  }

  /// save cart items
  void saveCartItems() {
    final cartItemStrings = cartItems.map((item) => item.toJson()).toList();
    TLocalStorage.instance().saveData(key: 'CartItems', value: cartItemStrings);
  }

  /// load cart items
  void loadCartItems() {
    final cartItemStrings =
        TLocalStorage.instance().readData<List<dynamic>>(key: 'CartItems');
    if (cartItemStrings != null) {
      cartItems.assignAll(cartItemStrings
          .map((item) => CartItemModel.fromJson(item as Map<String, dynamic>))
          .toList());
      updateCartTotals();
    }
  }

  /// get product quantity in cart
  int getProductQuantityInCart(String productId) {
    final foundItem = cartItems
        .where((item) => item.productId == productId)
        .fold(0, (previousValue, element) => previousValue + element.quantity);
    return foundItem;
  }

  int getVariationQuantityInCart(String productId, String variationId) {
    final foundItem = cartItems.firstWhere(
        (item) =>
            item.productId == productId && item.variationId == variationId,
        orElse: () => CartItemModel.empty());
    return foundItem.quantity;
  }

  void clearCart() {
    productQuantityInCart.value = 0;
    cartItems.clear();
    updateCart();
  }
}
