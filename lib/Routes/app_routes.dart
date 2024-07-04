import 'package:flutter_application_1/Feature/Shop/Screens/Home/home.dart';
import 'package:flutter_application_1/Feature/Shop/Screens/Store/store.dart';
import 'package:flutter_application_1/Feature/Shop/Screens/profile/Cart/cart_screen.dart';
import 'package:flutter_application_1/Feature/Shop/Screens/profile/profile.dart';
import 'package:flutter_application_1/Feature/Shop/Screens/wishList/wishlist.dart';
import 'package:flutter_application_1/Routes/routes.dart';
import 'package:get/get.dart';

class AppRoutes {
  static final pages = [
    GetPage(name: IRoutes.home, page: () => const HomeScreen()),
    GetPage(name: IRoutes.store, page: () => const Store()),
    GetPage(name: IRoutes.favorites, page: () => const WishList()),
    GetPage(name: IRoutes.settings, page: () => const Profile()),
    GetPage(name: IRoutes.subCategories, page: () => const HomeScreen()),
    GetPage(name: IRoutes.search, page: () => const HomeScreen()),
    GetPage(name: IRoutes.productReviews, page: () => const HomeScreen()),
    GetPage(name: IRoutes.productDetails, page: () => const HomeScreen()),
    GetPage(name: IRoutes.cart, page: () => const CartScreen()),
    GetPage(name: IRoutes.brand, page: () => const HomeScreen()),
    GetPage(name: IRoutes.allProducts, page: () => const HomeScreen()),
    GetPage(name: IRoutes.userProfile, page: () => const HomeScreen()),
    GetPage(name: IRoutes.order, page: () => const HomeScreen()),
  ];
}
