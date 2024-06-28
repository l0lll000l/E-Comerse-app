import 'package:flutter/material.dart';

class TBottomSheetTheme {
  TBottomSheetTheme._();
  static BottomSheetThemeData light = BottomSheetThemeData(
      showDragHandle: true,
      backgroundColor: Colors.white,
      modalBarrierColor: Colors.white,
      constraints: const BoxConstraints(minWidth: double.infinity),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)));
  static BottomSheetThemeData Dark = BottomSheetThemeData(
      showDragHandle: true,
      backgroundColor: Colors.black,
      modalBarrierColor: Colors.black,
      constraints: const BoxConstraints(minWidth: double.infinity),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)));
}
