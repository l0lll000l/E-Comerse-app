import 'package:flutter/material.dart';
import 'package:flutter_application_1/Common/widgets/AppBar/appbar.dart';
import 'package:flutter_application_1/Common/widgets/AppBar/section_heading.dart';
import 'package:flutter_application_1/Data/Repository/upload_repo.dart';
import 'package:flutter_application_1/Feature/Shop/Controller/update_controller.dart';
import 'package:flutter_application_1/Utils/constants/sizes.dart';
import 'package:flutter_application_1/Utils/loaders/loaders.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

// ignore: must_be_immutable
class UploadProducts extends StatelessWidget {
  UploadProducts({super.key});
  // final idController = TextEditingController();
  // final priceController = TextEditingController();

  String? _id = '0';
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
  bool isBrand = false;
  bool isAttribute = false;

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
                  _title = value;
                },
                decoration: const InputDecoration(
                  labelText: 'Title',
                  prefixIcon: Icon(Icons.edit),
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwInputFields),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      onChanged: (value) {
                        _price = value;
                        // controller.price.value = value;
                      },
                      decoration: const InputDecoration(
                        labelText: 'Price',
                        prefixIcon: Icon(Icons.edit),
                      ),
                    ),
                  ),
                  const SizedBox(width: TSizes.spaceBtwInputFields),
                  Expanded(
                    child: TextFormField(
                      onChanged: (value) {
                        _salePrice = value;
                      },
                      decoration: const InputDecoration(
                        labelText: 'Sale Price',
                        prefixIcon: Icon(Icons.edit),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: TSizes.spaceBtwInputFields),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      onChanged: (value) {
                        _productType = value;
                      },
                      decoration: const InputDecoration(
                        labelText: 'Product Type',
                        prefixIcon: Icon(Icons.edit),
                      ),
                    ),
                  ),
                  const SizedBox(width: TSizes.spaceBtwInputFields),
                  Expanded(
                    child: TextFormField(
                      onChanged: (value) => _categoryType = value,
                      decoration: const InputDecoration(
                        labelText: 'Category Type',
                        prefixIcon: Icon(Icons.edit),
                      ),
                    ),
                  ),
                ],
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
                onChanged: (value) => _description = value,
                decoration: const InputDecoration(
                  labelText: 'Description',
                  prefixIcon: Icon(Icons.edit),
                ),
              ),
              // const SizedBox(height: TSizes.spaceBtwInputFields),
              // TextFormField(
              //   onChanged: (value) => _sku = value,
              //   decoration: const InputDecoration(
              //     labelText: 'Sku',
              //     prefixIcon: Icon(Icons.edit),
              //   ),
              // ),
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
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: OutlinedButton(
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
                        child: const Text('Image1')),
                  ),
                  Expanded(
                    child: OutlinedButton(
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
                        child: const Text('image2')),
                  ),
                  Expanded(
                    child: OutlinedButton(
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
                        child: const Text('image3')),
                  ),
                ],
              ),
              const SizedBox(height: TSizes.spaceBtwInputFields),

              const TsectionHeading(
                title: 'Brand',
              ),
              const SizedBox(height: TSizes.spaceBtwInputFields),

              /// Brand
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
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                        onPressed: () {
                          updateController.uploadImage(
                            firebaseLocation: 'Products/brand/',
                          );
                          isBrand = true;
                        },
                        child: const Text('Brand logo')),
                  ),
                ],
              ),
              const SizedBox(height: TSizes.spaceBtwInputFields),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      onChanged: (value) {
                        _brandisFeatured = value == 'true' ? true : false;
                      },
                      decoration: const InputDecoration(
                        labelText: 'IsFearted  true / false  ',
                        prefixIcon: Icon(Icons.edit),
                      ),
                    ),
                  ),
                  const SizedBox(width: TSizes.spaceBtwItems),
                  Expanded(
                    child: TextFormField(
                      onChanged: (value) {
                        _brandproductCount = int.parse(value);
                      },
                      decoration: const InputDecoration(
                        labelText: 'Product count',
                        prefixIcon: Icon(Icons.edit),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: TSizes.spaceBtwInputFields),

              /// update attributes
              const TsectionHeading(
                title: 'Update Attributes',
              ),
              const SizedBox(height: TSizes.spaceBtwInputFields),

              /// color
              SizedBox(
                height: 65,
                child: ListWheelScrollView(
                  itemExtent: 65,
                  children: [
                    TextFormField(
                      onChanged: (value) {
                        _color1 = value;
                        isAttribute = true;
                      },
                      decoration: const InputDecoration(
                        labelText: 'color1',
                        prefixIcon: Icon(Icons.edit),
                      ),
                    ),
                    TextFormField(
                      onChanged: (value) {
                        _color2 = value;
                      },
                      decoration: const InputDecoration(
                        labelText: 'color2',
                        prefixIcon: Icon(Icons.edit),
                      ),
                    ),
                    TextFormField(
                      onChanged: (value) {
                        _color3 = value;
                      },
                      decoration: const InputDecoration(
                        labelText: 'color3',
                        prefixIcon: Icon(Icons.edit),
                      ),
                    ),
                    TextFormField(
                      onChanged: (value) {
                        _color4 = value;
                      },
                      decoration: const InputDecoration(
                        labelText: 'color4',
                        prefixIcon: Icon(Icons.edit),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwInputFields),

              /// size
              SizedBox(
                  height: 65,
                  child: ListWheelScrollView(itemExtent: 65, children: [
                    TextFormField(
                      onChanged: (value) {
                        _size1 = value;
                      },
                      decoration: const InputDecoration(
                        labelText: 'size1',
                        prefixIcon: Icon(Icons.edit),
                      ),
                    ),
                    TextFormField(
                      onChanged: (value) {
                        _size2 = value;
                      },
                      decoration: const InputDecoration(
                        labelText: 'size2',
                        prefixIcon: Icon(Icons.edit),
                      ),
                    ),
                    TextFormField(
                      onChanged: (value) {
                        _size3 = value;
                      },
                      decoration: const InputDecoration(
                        labelText: 'size3',
                        prefixIcon: Icon(Icons.edit),
                      ),
                    ),
                    TextFormField(
                      onChanged: (value) {
                        _size4 = value;
                      },
                      decoration: const InputDecoration(
                        labelText: 'size4',
                        prefixIcon: Icon(Icons.edit),
                      ),
                    ),
                  ])),

              const SizedBox(height: TSizes.spaceBtwInputFields),

              /// update variations
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

                    if (isBrand) {
                      updateController.updateBrand(
                        id: _id,
                        brandId: _brandid,
                        name: _brandname,
                        image: updateController.brandImage.value,
                        isFeatured: _brandisFeatured,
                        productCount: _brandproductCount,
                      );
                    }

                    /// add attributes
                    if (isAttribute) {
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
                    }
                  },
                  child: const Text('Submit'))),
        ]),
      ),
    );
  }
}
