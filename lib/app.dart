import 'package:flutter/material.dart';
import 'package:flutter_application_1/Bindings/general_binding.dart';
import 'package:flutter_application_1/Routes/app_routes.dart';
import 'package:flutter_application_1/Utils/Helpers/theme_controller.dart';
import 'package:flutter_application_1/Utils/Theme/theme.dart';
import 'package:get/get.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final themeController = Get.put(ThemeController());
    return Obx(
      () => GetMaterialApp(
          title: 'Flutter Demo',
          initialBinding: GeneralBingdings(),
          themeMode: themeController.themeMode(),
          theme: TAppTheme.lightTheme,
          darkTheme: TAppTheme.darkTheme,
          getPages: AppRoutes.pages,
          home: const Scaffold(
              body: Center(
            child: CircularProgressIndicator(),
          ))),
    );
  }
}
