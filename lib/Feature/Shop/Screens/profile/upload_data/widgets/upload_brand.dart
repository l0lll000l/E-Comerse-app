import 'package:flutter/material.dart';
import 'package:flutter_application_1/Common/widgets/AppBar/appbar.dart';
import 'package:flutter_application_1/Data/Repository/upload_repo.dart';
import 'package:flutter_application_1/Feature/Shop/Controller/update_controller.dart';
import 'package:flutter_application_1/Feature/Shop/Model/brand_model.dart';
import 'package:flutter_application_1/Utils/constants/sizes.dart';
import 'package:flutter_application_1/Utils/loaders/loaders.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class UploadBrand extends StatelessWidget {
  const UploadBrand({super.key});

  @override
  Widget build(BuildContext context) {
    String? id = '';
    String? brandid;
    String? brandname;
    String brandLogo = '';
    bool brandisFeatured = false;
    bool isBrand = true;
    String brandproductCount = '0';

    final uploadRepo = Get.put(UploadRepository());
    final updateController = Get.put(UpdateController());
    return Scaffold(
      appBar: const TAppBar(
        showBackArrow: true,
        title: Text('Upload products'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextFormField(
                onChanged: (value) {
                  id = value;
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
                  brandid = value;
                },
                decoration: const InputDecoration(
                  labelText: 'Brand id',
                  prefixIcon: Icon(Icons.edit),
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwInputFields),
              TextFormField(
                onChanged: (value) {
                  brandname = value;
                },
                decoration: const InputDecoration(
                  labelText: 'Brand Name',
                  prefixIcon: Icon(Icons.edit),
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwInputFields),
              OutlinedButton(
                  onPressed: () async {
                    try {
                      isBrand = false;
                      final image = await ImagePicker()
                          .pickImage(source: ImageSource.gallery);
                      if (image != null) {
                        // imageUploading.value = true;
                        // upload image
                        final image3 = await uploadRepo.uploadImage(
                            'Products/Images?Brand/', image);
                        brandLogo = image3;
                        isBrand = true;
                        Tloaders.successSnackBar(
                            title: 'congratulations',
                            message: ' image has been uploaded successfully');
                      }
                    } catch (e) {
                      Tloaders.errorSnackBar(
                          title: 'Oh Snap!', message: e.toString());
                    }
                  },
                  child: const Text('Brand logo')),
              const SizedBox(height: TSizes.spaceBtwInputFields),
              TextFormField(
                onChanged: (value) {
                  brandisFeatured = value == 'false' ? false : true;
                },
                decoration: const InputDecoration(
                  labelText: 'IsFearted  true / false  ',
                  prefixIcon: Icon(Icons.edit),
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwInputFields),
              TextFormField(
                onChanged: (value) {
                  brandproductCount = value;
                },
                decoration: const InputDecoration(
                  labelText: 'Product count',
                  prefixIcon: Icon(Icons.edit),
                ),
              ),
              const SizedBox(height: TSizes.spaceBtwInputFields),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () async {
                      final data = BrandModel(
                              productCount: int.parse(brandproductCount) ?? 0,
                              isFeatured: brandisFeatured ?? true,
                              id: brandid ?? '',
                              name: brandname ?? '',
                              image: brandLogo ?? '')
                          .toJson();

                      /// update brand
                      try {
                        // Map<String, dynamic> json = {'Brand': data};
                        await uploadRepo.updateSingleField(
                            collection: 'Brands', id: id, json: data);
                                            } catch (e) {
                        Tloaders.errorSnackBar(
                            title: 'Oh Snap!', message: e.toString());
                      }
                    },
                    child: const Text('Upolad')),
              )
            ],
          ),
        ),
      ),
    );
  }
}
