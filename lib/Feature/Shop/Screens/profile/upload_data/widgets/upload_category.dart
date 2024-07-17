import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Common/widgets/AppBar/appbar.dart';
import 'package:flutter_application_1/Feature/Shop/Controller/category_controller.dart';
import 'package:flutter_application_1/Feature/Shop/Model/category_model.dart';
import 'package:flutter_application_1/Utils/constants/sizes.dart';
import 'package:flutter_application_1/Utils/loaders/loaders.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class UploadCategory extends StatelessWidget {
  const UploadCategory({super.key});
  @override
  Widget build(BuildContext context) {
    String? id;
    String? url;
    bool? active;
    String? name;
    String? parentId;
    return Scaffold(
        appBar: TAppBar(
          leadingOnPressed: () {
            CategoryController.instance.fetchCategory();
          },
          showBackArrow: true,
          title: const Text(
            'Upload Category',
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: Column(
              children: [
                Form(
                    child: Column(children: [
                  TextFormField(
                    onChanged: (value) {
                      id = value;
                    },
                    decoration: const InputDecoration(
                      labelText: 'Id',
                      prefixIcon: Icon(Icons.edit),
                    ),
                  ),
                  const SizedBox(height: TSizes.spaceBtwInputFields),

                  /// add thumbnail
                  OutlinedButton(
                      onPressed: () async {
                        try {
                          CategoryController.instance.isLoading.value = true;
                          final image = await ImagePicker()
                              .pickImage(source: ImageSource.gallery);
                          if (image != null) {
                            final ref = FirebaseStorage.instance
                                .ref('Brands')
                                .child(image.name);
                            await ref.putFile(File(image.path));
                            final url1 = await ref.getDownloadURL();
                            url = url1;
                            CategoryController.instance.isLoading.value = false;
                          }
                        } catch (e) {
                          Tloaders.errorSnackBar(
                              title: 'Oh Snap!', message: e.toString());
                        }
                      },
                      child: const Text('Add Thumbnail')),
                  const SizedBox(height: TSizes.spaceBtwInputFields),

                  /// active
                  TextFormField(
                    onChanged: (value) {
                      active = value == 'true' ? true : false;
                    },
                    decoration: const InputDecoration(
                      labelText: 'Active = true/false',
                      prefixIcon: Icon(Icons.edit),
                    ),
                  ),
                  const SizedBox(height: TSizes.spaceBtwInputFields),
                  TextFormField(
                    onChanged: (value) {
                      name = value;
                    },
                    decoration: const InputDecoration(
                      labelText: 'Name',
                      prefixIcon: Icon(Icons.edit),
                    ),
                  ),
                  const SizedBox(height: TSizes.spaceBtwInputFields),
                  const SizedBox(height: TSizes.spaceBtwInputFields),
                  TextFormField(
                    onChanged: (value) {
                      parentId = value;
                    },
                    decoration: const InputDecoration(
                      labelText: 'Parent Id',
                      prefixIcon: Icon(Icons.edit),
                    ),
                  ),
                  const SizedBox(height: TSizes.spaceBtwInputFields),
                ])),
                const SizedBox(height: TSizes.spaceBtwInputFields),
                SizedBox(
                  width: double.infinity,
                  child: Obx(() {
                    if (!CategoryController.instance.isLoading.value) {
                      return ElevatedButton(
                          onPressed: () {
                            final data = CategoryModel(
                                    id: id ?? '',
                                    name: name ?? '',
                                    image: url ?? '',
                                    parentId: parentId ?? '',
                                    isFeatured: active ?? false)
                                .toJson();
                            CategoryController.instance
                                .uploadcategory(json: data, id: id);
                          },
                          child: const Text('Upload'));
                    } else {
                      return const Text('thumbnail Loading...');
                    }
                  }),
                )
              ],
            ),
          ),
        ));
  }
}
