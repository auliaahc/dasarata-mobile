import 'package:dasarata_mobile/constants/color_constant.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData appTheme = ThemeData(
    fontFamily: "Poppins",
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: ColorConstant.primaryColor,
      selectionHandleColor: ColorConstant.primaryColor,
      selectionColor: const Color(0XFFD6E9F9),
    ),
  );
}
