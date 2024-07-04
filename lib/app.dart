import 'package:flutter/material.dart';
import 'package:flutter_application_1/Bindings/general_binding.dart';
import 'package:flutter_application_1/Routes/app_routes.dart';
import 'package:flutter_application_1/Utils/Theme/theme.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Flutter Demo',
        themeMode: ThemeMode.system,
        theme: TAppTheme.lightTheme,
        darkTheme: TAppTheme.darkTheme,
        initialBinding: GeneralBingdings(),
        getPages: AppRoutes.pages,
        home: const Scaffold(
            body: Center(
          child: CircularProgressIndicator(),
        )));
  }
}
