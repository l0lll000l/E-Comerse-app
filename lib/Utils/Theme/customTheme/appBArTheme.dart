import 'package:flutter/material.dart';

class TAppBarTheme {
  TAppBarTheme._();
  static const lightAppBarTheme = AppBarTheme(
      actionsIconTheme: IconThemeData(color: Colors.black),
      elevation: 0,
      centerTitle: false,
      scrolledUnderElevation: 0,
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      iconTheme:
          IconThemeData(color: Color.fromARGB(255, 126, 126, 126), size: 24),
      titleTextStyle: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      ));
  static const blackAppBarTheme = AppBarTheme(
      actionsIconTheme: IconThemeData(color: Colors.white),
      elevation: 0,
      centerTitle: false,
      scrolledUnderElevation: 0,
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      iconTheme:
          IconThemeData(color: Color.fromARGB(255, 126, 126, 126), size: 24),
      titleTextStyle: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ));
}
