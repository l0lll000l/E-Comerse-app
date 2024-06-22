import 'package:flutter/material.dart';
import 'package:flutter_application_1/Utils/Theme/customTheme/appBArTheme.dart';
import 'package:flutter_application_1/Utils/Theme/customTheme/bottomSheet.dart';
import 'package:flutter_application_1/Utils/Theme/customTheme/checkboxTheme.dart';
import 'package:flutter_application_1/Utils/Theme/customTheme/elevatedButtonTheme.dart';
import 'package:flutter_application_1/Utils/Theme/customTheme/text_theme.dart';

class TAppTheme {
  TAppTheme._();
  static ThemeData lightTheme = ThemeData(
      useMaterial3: true,
      fontFamily: 'popins',
      brightness: Brightness.light,
      primaryColor: Colors.blue,
      textTheme: TTextTheme.lighttheme,
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: TAppBarTheme.lightAppBarTheme,
      bottomSheetTheme: TBottomSheetTheme.light,
      checkboxTheme: TCheckBoxTheme.light,
      elevatedButtonTheme: TElevatedButtonTheme.lightElevatedButtonTheme);
  static ThemeData darkTheme = ThemeData(
      useMaterial3: true,
      fontFamily: 'popins',
      brightness: Brightness.dark,
      primaryColor: Colors.blue,
      textTheme: TTextTheme.darkTheme,
      scaffoldBackgroundColor: Colors.black,
      appBarTheme: TAppBarTheme.blackAppBarTheme,
      bottomSheetTheme: TBottomSheetTheme.Dark,
      checkboxTheme: TCheckBoxTheme.Dark,
      elevatedButtonTheme: TElevatedButtonTheme.darkElevatedButton);
}
