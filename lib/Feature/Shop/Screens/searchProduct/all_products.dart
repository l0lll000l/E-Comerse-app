import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Common/widgets/AppBar/appbar.dart';
import 'package:flutter_application_1/Common/widgets/Shimmer/vertical_product_shimmer.dart';
import 'package:flutter_application_1/Feature/Shop/Controller/allProducts_controller.dart';
import 'package:flutter_application_1/Feature/Shop/Model/product_model.dart';
import 'package:flutter_application_1/Feature/Shop/Screens/searchProduct/widgets/sortable_products.dart';
import 'package:flutter_application_1/Utils/Helpers/cloud_helper_functions.dart';
import 'package:flutter_application_1/Utils/constants/sizes.dart';
import 'package:get/get.dart';

class AllProducts extends StatelessWidget {
  const AllProducts(
      {super.key, required this.title, this.query, this.futureMethod});
  final String title;
  final Query? query;
  final Future<List<ProductModel>>? futureMethod;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AllProductsController());
    return Scaffold(
      appBar: const TAppBar(
        showBackArrow: true,
        title: Text('All products'),
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: FutureBuilder(
              future: futureMethod ??
                  controller.fetchProductQuery(
                      query), //   ---------------------------query
              builder: (context, snapshot) {
                const loader = IVerticalProductShimmer();
                final widget = TCloudHelperFunctions.checkMultiRecordState(
                    snapshot: snapshot, loader: loader);
                if (widget != null) return widget;
                final products = snapshot.data!;
                return TsortableProducts(
                  products: products,
                );
              },
            )),
      ),
    );
  }
}
