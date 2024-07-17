import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Common/widgets/AppBar/appbar.dart';
import 'package:flutter_application_1/Common/widgets/Gridview/gridview_layout.dart';
import 'package:flutter_application_1/Common/widgets/Product/product_card_vertical.dart';
import 'package:flutter_application_1/Feature/Shop/Controller/search_product_controller.dart';
import 'package:flutter_application_1/Feature/Shop/Model/product_model.dart';
import 'package:flutter_application_1/Utils/constants/sizes.dart';
import 'package:get/get.dart';

class SearchPage extends StatelessWidget {
  const SearchPage(
      {super.key, required this.title, this.query, this.futureMethod});
  final String title;
  final Query? query;
  final Future<List<ProductModel>>? futureMethod;

  @override
  Widget build(BuildContext context) {
    TextEditingController namecontroller = TextEditingController();

    final searchController = Get.put(SearchProductController());
    return Scaffold(
      appBar: const TAppBar(
        showBackArrow: true,
        title: Text('Search'),
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: Column(
              children: [
                SearchBar(
                  onChanged: (value) {
                    searchController.searchResult(
                        name: namecontroller.text.trim());
                  },
                  controller: namecontroller,
                  textStyle: const MaterialStatePropertyAll(
                      TextStyle(color: Colors.black)),
                  hintText: 'Search Products',
                  hintStyle: const MaterialStatePropertyAll(
                      TextStyle(color: Colors.black)),
                  elevation: const MaterialStatePropertyAll(00.01),
                  backgroundColor:
                      const MaterialStatePropertyAll(Colors.transparent),
                  trailing: {
                    IconButton(
                        onPressed: () {
                          String name = namecontroller.text;
                          searchController.searchResult(name: name);
                        },
                        icon: const Icon(
                          Icons.search,
                          color: Colors.white,
                        ))
                  },
                ),
                const SizedBox(height: 20),
                Obx(
                  () => TGridview(
                      itemcount: searchController.sortedProducts.length,
                      mainAxisExtent: 260,
                      itemBuilder: (_, index) => TProductCardVertical(
                          product: searchController.sortedProducts[index])),
                )
              ],
            )),
      ),
    );
  }
}
