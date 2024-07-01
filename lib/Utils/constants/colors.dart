import 'package:flutter/material.dart';

class TColors {
  TColors._();
  // App  Basic Colors
  static const Color primary = Color.fromARGB(255, 3, 55, 211);
  static const Color secondary = Color.fromARGB(255, 255, 230, 0);
  static const Color accent = Colors.grey;
  static const Color orange = Colors.orange;
// Gradient color
  static const Gradient lineargradient = LinearGradient(
      end: Alignment(0.707, -0.707),
      begin: Alignment(0.0, 0.0),
      colors: [
        Colors.orange,
        Colors.orangeAccent,
        Colors.deepOrange,
        Colors.deepOrangeAccent
      ]);
  // Text Color
  static const Color textPrimary = Color.fromARGB(136, 0, 0, 0);
  static const Color textSeconsary = Color.fromARGB(255, 45, 43, 43);
  static const Color textwhite = Colors.white;
  // Background color
  static const Color light = Colors.white;
  static const Color dark = Colors.black;
  static const Color primarybackground = Colors.white;
  //background container
  static const Color lightContainer = Colors.white;
  static const Color darkContainer = Colors.black;
  // Button color
  static const Color buttonPrimary = Color.fromARGB(255, 3, 34, 173);
  static const Color buttonSecondary = Colors.grey;
  static const Color buttonDisabled = Colors.white;
  // Border color
  static const Color borderPrimary = Colors.grey;
  static const Color borderSecondary = Colors.grey;

  //Error and validationcolors
  static const Color error = Colors.red;
  static const Color success = Colors.green;
  static const Color warning = Colors.orange;
  static const Color info = Colors.blue;
  //neutral shadows
  static const Color black = Colors.black;
  static const Color darkerGrey = Color.fromARGB(255, 41, 39, 39);
  static const Color darkGrey = Color.fromARGB(255, 56, 52, 52);
  static const Color grey = Colors.grey;
}
