import 'package:flutter/material.dart';

class TTextfieldTheme {
  TTextfieldTheme._();
  static InputDecorationTheme light = InputDecorationTheme(
    errorMaxLines: 3,
    suffixIconColor: Colors.grey,
    prefixIconColor: Colors.grey,
    labelStyle: TextStyle().copyWith(fontSize: 14, color: Colors.black),
    hintStyle: TextStyle().copyWith(fontSize: 14, color: Colors.black),
    floatingLabelStyle: TextStyle()
        .copyWith(fontSize: 14, color: Colors.black.withOpacity(0.8)),
    errorStyle: TextStyle().copyWith(fontSize: 14, fontStyle: FontStyle.normal),
    border: const OutlineInputBorder().copyWith(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(width: 1, color: Colors.grey)),
    enabledBorder: const OutlineInputBorder().copyWith(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(width: 1, color: Colors.grey)),
    focusedBorder: const OutlineInputBorder().copyWith(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(width: 1, color: Colors.black12)),
    errorBorder: const OutlineInputBorder().copyWith(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(width: 1, color: Colors.red)),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(width: 1, color: Colors.orange)),
  );
  static InputDecorationTheme dark = InputDecorationTheme(
    errorMaxLines: 3,
    suffixIconColor: Colors.grey,
    prefixIconColor: Colors.grey,
    labelStyle: TextStyle().copyWith(fontSize: 14, color: Colors.white),
    hintStyle: TextStyle().copyWith(fontSize: 14, color: Colors.white),
    floatingLabelStyle: TextStyle().copyWith(
        fontSize: 14,
        color: const Color.fromARGB(255, 255, 255, 255).withOpacity(0.8)),
    errorStyle: TextStyle().copyWith(fontSize: 14, fontStyle: FontStyle.normal),
    border: const OutlineInputBorder().copyWith(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(width: 1, color: Colors.grey)),
    enabledBorder: const OutlineInputBorder().copyWith(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(width: 1, color: Colors.grey)),
    focusedBorder: const OutlineInputBorder().copyWith(
        borderRadius: BorderRadius.circular(14),
        borderSide:
            BorderSide(width: 1, color: Color.fromRGBO(255, 255, 255, 1))),
    errorBorder: const OutlineInputBorder().copyWith(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(width: 1, color: Colors.red)),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide(width: 1, color: Colors.orange)),
  );
}
