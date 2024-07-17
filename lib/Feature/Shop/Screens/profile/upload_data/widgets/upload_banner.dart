import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Common/widgets/AppBar/appbar.dart';
import 'package:flutter_application_1/Feature/Shop/Controller/homecontroller/banner_controller.dart';
import 'package:flutter_application_1/Feature/Shop/Model/banner_model.dart';
import 'package:flutter_application_1/Utils/constants/sizes.dart';
import 'package:flutter_application_1/Utils/loaders/loaders.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class UploadBanner extends StatelessWidget {
  const UploadBanner({super.key});
  @override
  Widget build(BuildContext context) {
    String? id;
    String? url0;
    bool? active;
    String? targetScreen;
    return Scaffold(
        appBar: TAppBar(
          leadingOnPressed: () {
            BannerController.instance.fetchBanners();
          },
          showBackArrow: true,
          title: const Text(
            'Upload banners',
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
                          BannerController.instance.isLoading.value = true;
                          final image = await ImagePicker()
                              .pickImage(source: ImageSource.gallery);
                          if (image != null) {
                            final ref = FirebaseStorage.instance
                                .ref('Brands')
                                .child(image.name);
                            await ref.putFile(File(image.path));
                            final url = await ref.getDownloadURL();
                            url0 = url;
                            BannerController.instance.isLoading.value = false;
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
                      targetScreen = value;
                    },
                    decoration: const InputDecoration(
                      labelText: 'Target Screen',
                      prefixIcon: Icon(Icons.edit),
                    ),
                  ),
                  const SizedBox(height: TSizes.spaceBtwInputFields),
                ])),
                const SizedBox(height: TSizes.spaceBtwInputFields),
                SizedBox(
                  width: double.infinity,
                  child: Obx(() {
                    if (!BannerController.instance.isLoading.value) {
                      return ElevatedButton(
                          onPressed: () {
                            final data = BannerModel(
                                    imageUrl: url0 ?? '',
                                    targetScreen: targetScreen ?? '',
                                    active: active ?? false)
                                .toJson();
                            BannerController.instance
                                .uploadBanners(id: id, json: data);
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
