import 'package:flutter/material.dart';
import 'package:flutter_application_1/Common/widgets/AppBar/section_heading.dart';
import 'package:flutter_application_1/Data/Repository/upload_repo.dart';
import 'package:flutter_application_1/Feature/Shop/Controller/update_controller.dart';
import 'package:flutter_application_1/Feature/Shop/Model/product_variation_model.dart';
import 'package:flutter_application_1/Utils/constants/sizes.dart';
import 'package:flutter_application_1/Utils/loaders/loaders.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class UploadVariationScreen extends StatelessWidget {
  const UploadVariationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String? variationId;
    String? variationColor;
    String? variationSize;
    double? variationPrice;
    double? variationSalePrice;
    String? variationSku;
    int? variationStock;
    String id = '1';

    String? variationImage;
    String? variationDescription;

    final uploadRepo = Get.put(UploadRepository());
    final updateController = Get.put(UpdateController());
    return ListView(
        shrinkWrap: true,
        physics: const AlwaysScrollableScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const TsectionHeading(
                  title: 'Update variations',
                ),
                const SizedBox(height: TSizes.spaceBtwInputFields),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        onChanged: (value) {
                          id = value;
                          // controller.id.value = value;
                        },
                        decoration: const InputDecoration(
                          labelText: 'Id',
                          prefixIcon: Icon(Icons.edit),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: TSizes.spaceBtwInputFields,
                    ),
                    Expanded(
                      child: TextFormField(
                        onChanged: (value) {
                          variationId = value;
                        },
                        decoration: const InputDecoration(
                          labelText: 'variation id',
                          prefixIcon: Icon(Icons.edit),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: TSizes.spaceBtwInputFields),
                TextFormField(
                  onChanged: (value) {
                    variationColor = value;
                  },
                  decoration: const InputDecoration(
                    labelText: 'variation color',
                    prefixIcon: Icon(Icons.edit),
                  ),
                ),
                const SizedBox(height: TSizes.spaceBtwInputFields),
                TextFormField(
                  onChanged: (value) {
                    variationSize = value;
                  },
                  decoration: const InputDecoration(
                    labelText: 'variation size',
                    prefixIcon: Icon(Icons.edit),
                  ),
                ),
                const SizedBox(height: TSizes.spaceBtwInputFields),
                TextFormField(
                  onChanged: (value) {
                    variationDescription = value;
                  },
                  decoration: const InputDecoration(
                    labelText: 'variation Description',
                    prefixIcon: Icon(Icons.edit),
                  ),
                ),
                const SizedBox(height: TSizes.spaceBtwInputFields),
                TextFormField(
                  onChanged: (value) {
                    variationPrice = double.parse(value);
                  },
                  decoration: const InputDecoration(
                    labelText: 'variation price',
                    prefixIcon: Icon(Icons.edit),
                  ),
                ),
                const SizedBox(height: TSizes.spaceBtwInputFields),
                TextFormField(
                  onChanged: (value) {
                    variationSalePrice = double.parse(value);
                  },
                  decoration: const InputDecoration(
                    labelText: 'variation SalePrice',
                    prefixIcon: Icon(Icons.edit),
                  ),
                ),
                const SizedBox(height: TSizes.spaceBtwInputFields),
                // TextFormField(
                //   onChanged: (value) {
                //     variationSku = value;
                //   },
                //   decoration: const InputDecoration(
                //     labelText: 'variation Sku',
                //     prefixIcon: Icon(Icons.edit),
                //   ),
                // ),
                OutlinedButton(
                    onPressed: () async {
                      try {
                        updateController.fetchVariation(id);
                        final image = await ImagePicker()
                            .pickImage(source: ImageSource.gallery);
                        if (image != null) {
                          // imageUploading.value = true;
                          // upload image
                          final image3 = await uploadRepo.uploadImage(
                              'Products/Images?Brand/', image);
                          variationImage = image3;
                        }
                        updateController.imageUploading.value = true;
                      } catch (e) {
                        Tloaders.errorSnackBar(
                            title: 'Oh Snap!', message: e.toString());
                      }
                    },
                    child: const Text('variation image 1')),
                const SizedBox(height: TSizes.spaceBtwInputFields),
                Obx(
                  () => SizedBox(
                    width: double.infinity,
                    child: updateController.imageUploading.value
                        ? ElevatedButton(
                            onPressed: () async {
                              /// variations
                              final variation1 = ProductVariationModel(
                                  id: variationId ?? '',
                                  desctription: variationDescription ?? '',
                                  image: variationImage ?? '',
                                  price: variationPrice ?? 0.0,
                                  salePrice: variationSalePrice ?? 0.0,
                                  sku: variationSku ?? '',
                                  stock: variationStock ?? 0,
                                  attributesValues: {
                                    "Color": variationColor ?? '',
                                    "Size": variationSize ?? ''
                                  });
                              final variationJson = variation1.toJson();

                              final List variations =
                                  updateController.variation;
                              variations.add(variationJson);
                              updateController.updateVariations(
                                id: id,
                                variations: variations,
                              );
                            },
                            child: const Text('upload'))
                        : const Text('upload image first'),
                  ),
                )
              ],
            ),
          ),
        ]);
  }
}
