import 'package:flutter_application_1/Feature/Shop/Model/banner_model.dart';
import 'package:flutter_application_1/Feature/Shop/Model/brand_model.dart';
import 'package:flutter_application_1/Feature/Shop/Model/category_model.dart';
import 'package:flutter_application_1/Feature/Shop/Model/product_attribute_model.dart';
import 'package:flutter_application_1/Feature/Shop/Model/product_model.dart';
import 'package:flutter_application_1/Feature/Shop/Model/product_variation_model.dart';
import 'package:flutter_application_1/Utils/constants/image_strings.dart';

class TdummyData {
  static final List<BannerModel> banners = [
    BannerModel(
        imageUrl: TImages.banner1, targetScreen: 'order', active: false),
    BannerModel(imageUrl: TImages.banner2, targetScreen: 'cart', active: true),
    BannerModel(imageUrl: TImages.banner3, targetScreen: 'home', active: false),
    BannerModel(
        imageUrl: TImages.banner4, targetScreen: 'search', active: true),
    BannerModel(
        imageUrl: TImages.banner5, targetScreen: 'profile', active: false),
    BannerModel(imageUrl: TImages.banner6, targetScreen: 'order', active: true),
    BannerModel(imageUrl: TImages.banner7, targetScreen: 'cart', active: true),
    BannerModel(imageUrl: TImages.banner8, targetScreen: 'home', active: true),
  ];

  /// list of all catogories
  static final List<CategoryModel> categories = [
    /// featured
    CategoryModel(
        id: '1', name: 'Sports', image: TImages.sportIcon, isFeatured: true),
    CategoryModel(
        id: '2', name: 'Cloth', image: TImages.clothIcon, isFeatured: true),
    CategoryModel(
        id: '3', name: 'Shoe', image: TImages.shoeIcon, isFeatured: true),
    CategoryModel(
        id: '4',
        name: 'Cosmetics',
        image: TImages.cosmeticsIcon,
        isFeatured: true),
    CategoryModel(
        id: '5', name: 'Animal', image: TImages.animalIcon, isFeatured: true),
    CategoryModel(
        id: '6', name: 'Toy', image: TImages.toyIcon, isFeatured: true),
    CategoryModel(
        id: '7',
        name: 'Furniture',
        image: TImages.furnitureIcon,
        isFeatured: true),
    CategoryModel(
        id: '8',
        name: 'Jewelery',
        image: TImages.jeweleryIcon,
        isFeatured: true),
    CategoryModel(
        id: '9',
        name: 'Electronics',
        image: TImages.electronicsIcon,
        isFeatured: true),

    ///subcategory
    CategoryModel(
        id: '10',
        name: 'Sport shoes',
        image: TImages.sportIcon,
        isFeatured: false),
    CategoryModel(
        id: '11',
        name: 'Track suits',
        image: TImages.sportIcon,
        isFeatured: false),
    CategoryModel(
        id: '12',
        name: 'Running shoes',
        image: TImages.sportIcon,
        isFeatured: false),
    CategoryModel(
        id: '13',
        name: 'Sports Equipments',
        image: TImages.sportIcon,
        isFeatured: false),

    ///frniture
    CategoryModel(
        id: '14',
        name: 'Sofa',
        image: TImages.furnitureIcon,
        isFeatured: false),
    CategoryModel(
        id: '15', name: 'Bed', image: TImages.furnitureIcon, isFeatured: false),
    CategoryModel(
        id: '16',
        name: 'Chair',
        image: TImages.furnitureIcon,
        isFeatured: false),
    CategoryModel(
        id: '17',
        name: 'Cupboards',
        image: TImages.furnitureIcon,
        isFeatured: false),

    ///electronics
    CategoryModel(
        id: '18',
        name: 'Laptop',
        image: TImages.electronicsIcon,
        isFeatured: false),
    CategoryModel(
        id: '19',
        name: 'Mobile',
        image: TImages.electronicsIcon,
        isFeatured: false),
    CategoryModel(
        id: '20',
        name: 'Television',
        image: TImages.electronicsIcon,
        isFeatured: false),
  ];

  static final List<ProductModel> products = [
    ProductModel(
        id: '002', //
        price: 135, //
        title: 'green nike shoe', //
        thumbnail: TImages.shoeIcon, //
        productType: 'shoe', //
        stock: 5, //
        brand: BrandModel(id: '1', name: 'Nike', image: TImages.sportIcon),
        categoryType: 'Sports', //
        date: DateTime.now(),
        images: [TImages.sportIcon, TImages.shoeIcon, TImages.shoeIcon],
        productAttributes: [
          ProductAttributeModel(
              name: 'color', values: ['Green', 'Blue', 'Red']),
          ProductAttributeModel(name: 'size', values: ['S', 'M', 'L', 'XL']),
        ],
        productVariations: [
          ProductVariationModel(
              id: '1',
              attributesValues: {
                'color': 'Green',
                'size': 'S',
              },
              stock: 34,
              price: 150,
              sku: 'Abr458',
              desctription: '',
              image: TImages.productImage1,
              salePrice: 135)
        ],
        salePrice: 120,
        isFeatured: false,
        desctription: '')
  ];
}
