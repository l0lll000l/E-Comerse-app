import 'package:flutter/material.dart';
import 'package:flutter_application_1/Common/widgets/AppBar/appbar.dart';
import 'package:flutter_application_1/Feature/Shop/Screens/profile/upload_data/widgets/variation_screen.dart';

class UploadVariations extends StatelessWidget {
  const UploadVariations({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        appBar: TAppBar(
          showBackArrow: true,
          title: Text('Upload variatoin'),
        ),
        body: Padding(
          padding: EdgeInsets.all(8.0),
          child: UploadVariationScreen(),
        ));
  }
}
