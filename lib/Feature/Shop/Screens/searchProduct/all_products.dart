import 'package:flutter/material.dart';
import 'package:flutter_application_1/Common/widgets/AppBar/appbar.dart';
import 'package:flutter_application_1/Feature/Shop/Screens/searchProduct/widgets/sortable_products.dart';
import 'package:flutter_application_1/Utils/constants/sizes.dart';

class AllProducts extends StatelessWidget {
  const AllProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text('All products'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: TsortableProducts(),
        ),
      ),
    );
  }
}
