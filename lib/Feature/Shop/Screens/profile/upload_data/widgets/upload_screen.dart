import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/Common/widgets/AppBar/appbar.dart';
import 'package:flutter_application_1/Common/widgets/AppBar/section_heading.dart';
import 'package:flutter_application_1/Data/Repository/upload_repo.dart';
import 'package:flutter_application_1/Feature/Shop/Controller/update_controller.dart';
import 'package:flutter_application_1/Feature/Shop/Model/product_variation_model.dart';
import 'package:flutter_application_1/Utils/constants/sizes.dart';
import 'package:flutter_application_1/Utils/loaders/loaders.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

// ignore: must_be_immutable
class UploadProducts extends StatelessWidget {
  UploadProducts({super.key});
  // final idController = TextEditingController();
  // final priceController = TextEditingController();

  String? _id;
  String? _price;
  String? _salePrice;
  String? _title;
  String? _productType;

  String? _categoryType;
  String? _stock;
  String? _description;
  String? _sku;
  String? _brandid;
  String? _brandname;
  bool? _brandisFeatured;
  int? _brandproductCount;
  List<String>? images = [];
  String? _thumbnail;
  String? _color1, _color2, _color3, _color4, _size1, _size2, _size3, _size4;
  String? _variationId,
      _variationDescription,
      _variationImage,
      _variationColor,
      _variationSize,
      _variationSku;
  int? _variationStock;
  double? _variationPrice, _variationSalePrice;

  /// variables
  @override
  Widget build(BuildContext context) {
    final uploadRepo = Get.put(UploadRepository());
    var updateController = Get.put(UpdateController());
    return Scaffold(
      appBar: const TAppBar(
        showBackArrow: true,
        title: Text('Upload products'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(children: [
          Form(
              child: Column(
            children: [
              TextFormField(
                onChanged: (value) {
                  _id = value;
                  // controller.id.value = value;
                },
                decoration: const InputDecoration(
                  labelText: 'Id',
                  prefixIcon: Icon(Icons.edit),
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwInputFields),
              TextFormField(
                onChanged: (value) {
                  _price = value;
                  // controller.price.value = value;
                },
                decoration: const InputDecoration(
                  labelText: 'Price',
                  prefixIcon: Icon(Icons.edit),
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwInputFields),
              TextFormField(
                onChanged: (value) {
                  _salePrice = value;
                },
                decoration: const InputDecoration(
                  labelText: 'Sale Price',
                  prefixIcon: Icon(Icons.edit),
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwInputFields),
              TextFormField(
                onChanged: (value) {
                  _title = value;
                },
                decoration: const InputDecoration(
                  labelText: 'Title',
                  prefixIcon: Icon(Icons.edit),
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwInputFields),
              TextFormField(
                onChanged: (value) {
                  _productType = value;
                },
                decoration: const InputDecoration(
                  labelText: 'Product Type',
                  prefixIcon: Icon(Icons.edit),
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwInputFields),
              TextFormField(
                onChanged: (value) {
                  _stock = value;
                },
                decoration: const InputDecoration(
                  labelText: 'Stock',
                  prefixIcon: Icon(Icons.edit),
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwInputFields),
              TextFormField(
                onChanged: (value) => _categoryType = value,
                decoration: const InputDecoration(
                  labelText: 'Category Type',
                  prefixIcon: Icon(Icons.edit),
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwInputFields),
              TextFormField(
                onChanged: (value) => _description = value,
                decoration: const InputDecoration(
                  labelText: 'Description',
                  prefixIcon: Icon(Icons.edit),
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwInputFields),
              TextFormField(
                onChanged: (value) => _sku = value,
                decoration: const InputDecoration(
                  labelText: 'Sku',
                  prefixIcon: Icon(Icons.edit),
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwInputFields),
              OutlinedButton(
                  onPressed: () async {
                    try {
                      final image = await ImagePicker()
                          .pickImage(source: ImageSource.gallery);
                      if (image != null) {
                        // imageUploading.value = true;
                        // upload image
                        final thumbnail = await uploadRepo.uploadImage(
                            'Products/Images?Brand/', image);
                        _thumbnail = thumbnail;
                      }
                    } catch (e) {
                      Tloaders.errorSnackBar(
                          title: 'Oh Snap!', message: e.toString());
                    }
                  },
                  child: const Text('Add Thumbnail')),
              const SizedBox(height: TSizes.spaceBtwInputFields),
              const SizedBox(height: TSizes.spaceBtwInputFields),
              OutlinedButton(
                  onPressed: () async {
                    try {
                      final image = await ImagePicker()
                          .pickImage(source: ImageSource.gallery);
                      if (image != null) {
                        // imageUploading.value = true;
                        // upload image
                        final image1 = await uploadRepo.uploadImage(
                            'Products/Images?Brand/', image);
                        images!.add(image1);
                      }
                    } catch (e) {
                      Tloaders.errorSnackBar(
                          title: 'Oh Snap!', message: e.toString());
                    }
                  },
                  child: const Text('Product Image1')),
              const SizedBox(height: TSizes.spaceBtwInputFields),
              const SizedBox(height: TSizes.spaceBtwInputFields),
              OutlinedButton(
                  onPressed: () async {
                    try {
                      final image = await ImagePicker()
                          .pickImage(source: ImageSource.gallery);
                      if (image != null) {
                        // imageUploading.value = true;
                        // upload image
                        final image2 = await uploadRepo.uploadImage(
                            'Products/Images?Brand/', image);
                        images!.add(image2);
                      }
                    } catch (e) {
                      Tloaders.errorSnackBar(
                          title: 'Oh Snap!', message: e.toString());
                    }
                  },
                  child: const Text('Product image2')),
              const SizedBox(height: TSizes.spaceBtwInputFields),
              const SizedBox(height: TSizes.spaceBtwInputFields),
              OutlinedButton(
                  onPressed: () async {
                    try {
                      final image = await ImagePicker()
                          .pickImage(source: ImageSource.gallery);
                      if (image != null) {
                        // imageUploading.value = true;
                        // upload image
                        final image3 = await uploadRepo.uploadImage(
                            'Products/Images?Brand/', image);
                        images!.add(image3);
                      }
                    } catch (e) {
                      Tloaders.errorSnackBar(
                          title: 'Oh Snap!', message: e.toString());
                    }
                  },
                  child: const Text('product image 3')),
              const SizedBox(height: TSizes.spaceBtwInputFields),
              TextFormField(
                onChanged: (value) {
                  _brandid = value;
                },
                decoration: const InputDecoration(
                  labelText: 'Brand id',
                  prefixIcon: Icon(Icons.edit),
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwInputFields),
              TextFormField(
                onChanged: (value) {
                  _brandname = value;
                },
                decoration: const InputDecoration(
                  labelText: 'Brand Name',
                  prefixIcon: Icon(Icons.edit),
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwInputFields),
              OutlinedButton(
                  onPressed: () {
                    updateController.uploadImage(
                      firebaseLocation: 'Products/brand/',
                    );
                  },
                  child: const Text('Brand logo')),
              const SizedBox(height: TSizes.spaceBtwInputFields),
              TextFormField(
                onChanged: (value) {
                  _brandisFeatured = value == 'true' ? true : false;
                },
                decoration: const InputDecoration(
                  labelText: 'IsFearted  true / false  ',
                  prefixIcon: Icon(Icons.edit),
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwInputFields),
              TextFormField(
                onChanged: (value) {
                  _brandproductCount = int.parse(value);
                },
                decoration: const InputDecoration(
                  labelText: 'Product count',
                  prefixIcon: Icon(Icons.edit),
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwInputFields),
              const TsectionHeading(
                title: 'Update Attributes',
              ),
              const SizedBox(height: TSizes.spaceBtwInputFields),
              TextFormField(
                onChanged: (value) {
                  _color1 = value;
                },
                decoration: const InputDecoration(
                  labelText: 'color1',
                  prefixIcon: Icon(Icons.edit),
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwInputFields),
              TextFormField(
                onChanged: (value) {
                  _color2 = value;
                },
                decoration: const InputDecoration(
                  labelText: 'color2',
                  prefixIcon: Icon(Icons.edit),
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwInputFields),
              TextFormField(
                onChanged: (value) {
                  _color3 = value;
                },
                decoration: const InputDecoration(
                  labelText: 'color3',
                  prefixIcon: Icon(Icons.edit),
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwInputFields),
              TextFormField(
                onChanged: (value) {
                  _color4 = value;
                },
                decoration: const InputDecoration(
                  labelText: 'color4',
                  prefixIcon: Icon(Icons.edit),
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwInputFields),
              TextFormField(
                onChanged: (value) {
                  _size1 = value;
                },
                decoration: const InputDecoration(
                  labelText: 'size1',
                  prefixIcon: Icon(Icons.edit),
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwInputFields),
              TextFormField(
                onChanged: (value) {
                  _size2 = value;
                },
                decoration: const InputDecoration(
                  labelText: 'size2',
                  prefixIcon: Icon(Icons.edit),
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwInputFields),
              TextFormField(
                onChanged: (value) {
                  _size3 = value;
                },
                decoration: const InputDecoration(
                  labelText: 'size3',
                  prefixIcon: Icon(Icons.edit),
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwInputFields),
              TextFormField(
                onChanged: (value) {
                  _size4 = value;
                },
                decoration: const InputDecoration(
                  labelText: 'size4',
                  prefixIcon: Icon(Icons.edit),
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwInputFields),
              const SizedBox(height: TSizes.spaceBtwInputFields),
              const TsectionHeading(
                title: 'Update variations',
              ),
              const SizedBox(height: TSizes.spaceBtwInputFields),
              TextFormField(
                onChanged: (value) {
                  _variationId = value;
                },
                decoration: const InputDecoration(
                  labelText: 'variation id',
                  prefixIcon: Icon(Icons.edit),
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwInputFields),
              TextFormField(
                onChanged: (value) {
                  _variationColor = value;
                },
                decoration: const InputDecoration(
                  labelText: 'variation color',
                  prefixIcon: Icon(Icons.edit),
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwInputFields),
              TextFormField(
                onChanged: (value) {
                  _variationSize = value;
                },
                decoration: const InputDecoration(
                  labelText: 'variation size',
                  prefixIcon: Icon(Icons.edit),
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwInputFields),
              TextFormField(
                onChanged: (value) {
                  _variationDescription = value;
                },
                decoration: const InputDecoration(
                  labelText: 'variation Description',
                  prefixIcon: Icon(Icons.edit),
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwInputFields),
              TextFormField(
                onChanged: (value) {
                  _variationPrice = double.parse(value);
                },
                decoration: const InputDecoration(
                  labelText: 'variation price',
                  prefixIcon: Icon(Icons.edit),
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwInputFields),
              TextFormField(
                onChanged: (value) {
                  _variationSalePrice = double.parse(value);
                },
                decoration: const InputDecoration(
                  labelText: 'variation SalePrice',
                  prefixIcon: Icon(Icons.edit),
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwInputFields),
              TextFormField(
                onChanged: (value) {
                  _variationSku = value;
                },
                decoration: const InputDecoration(
                  labelText: 'variation Sku',
                  prefixIcon: Icon(Icons.edit),
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwInputFields),
              TextFormField(
                onChanged: (value) {
                  _variationStock = int.parse(value);
                },
                decoration: const InputDecoration(
                  labelText: 'variation SalePrice',
                  prefixIcon: Icon(Icons.edit),
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwInputFields),
            ],
          )),
          SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    // update price
                    updateController.updateSingleFields(
                      id: _id,
                      price: _price,
                      salePrice: _salePrice,
                      stock: _stock,
                      title: _title,
                      productType: _productType,
                      categoryType: _categoryType,
                      description: _description,
                      sku: _sku,
                      images: images,
                      thumbnail: _thumbnail,
                    );
                    // add brand

                    updateController.updateBrand(
                      id: _id,
                      brandId: _brandid,
                      name: _brandname,
                      image: updateController.brandImage.value,
                      isFeatured: _brandisFeatured,
                      productCount: _brandproductCount,
                    );

                    /// add attributes
                    updateController.updateAttributes(
                      id: _id,
                      color1: _color1,
                      color2: _color2,
                      color3: _color3,
                      color4: _color4,
                      size1: _size1,
                      size2: _size2,
                      size3: _size3,
                      size4: _size4,
                    );

                    /// variations
                    final variation1 = ProductVariationModel(
                        id: _variationId ?? '',
                        desctription: _variationDescription ?? '',
                        image: _variationImage ?? '',
                        price: _variationPrice ?? 0.0,
                        salePrice: _variationSalePrice ?? 0.0,
                        sku: _variationSku ?? '',
                        stock: _variationStock ?? 0,
                        attributesValues: {
                          "color": _variationColor ?? '',
                          "size": _variationSize ?? ''
                        });
                    print(variation1.toJson());

                    updateController.updateVariations(
                      id: _id,
                      variations: [variation1.toJson()],
                    );
                  },
                  child: const Text('Submit'))),
        ]),
      ),
    );
  }
}
