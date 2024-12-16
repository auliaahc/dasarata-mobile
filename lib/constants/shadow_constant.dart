import 'package:flutter/material.dart';

class ShadowConstant {
  static List<BoxShadow> shadowSm = [
    BoxShadow(
      color: const Color(0XFF000000).withValues(alpha: 0.08),
      offset: const Offset(0, 4),
      blurRadius: 19,
    ),
  ];
  static List<BoxShadow> shadowMd = [
    BoxShadow(
      color: const Color(0XFF000000).withValues(alpha: 0.1),
      offset: const Offset(0, 4),
      blurRadius: 48,
      spreadRadius: -2,
    ),
  ];
  static List<BoxShadow> appbarShadow = [
    BoxShadow(
      color: const Color(0XFF000000).withValues(alpha: 0.15),
      offset: const Offset(0, 5),
      blurRadius: 13,
      spreadRadius: 0,
    )
  ];
  static List<BoxShadow> mapTypeShadow = [
    BoxShadow(
      color: const Color(0XFF000000).withValues(alpha: 0.25),
      offset: const Offset(0, 1),
      blurRadius: 3,
    )
  ];
}
