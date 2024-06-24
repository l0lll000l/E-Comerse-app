import 'package:flutter/material.dart';

import 'package:flutter_application_1/Feature/Shop/Screens/Home/Widgets/home_appbar.dart';
import 'package:flutter_application_1/Common/widgets/AppBar/search_container.dart';
import 'package:flutter_application_1/Common/widgets/customShapes/primary_header.dart';
import 'package:flutter_application_1/Feature/Shop/Screens/Home/Widgets/home_catogories.dart';
import 'package:flutter_application_1/Utils/constants/sizes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            PrimaryHeader(
              child: Column(
                children: [
                  /// AppBar
                  ThomeAppBar(),
                  SizedBox(height: TSizes.spaceBtwItems / 2),

                  /// Search bar
                  TSearchContainer(),
                  SizedBox(height: TSizes.spaceBtwItems / 2),

                  ///  catogories
                  HomeCategories()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
