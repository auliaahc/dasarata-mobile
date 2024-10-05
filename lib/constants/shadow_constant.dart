import 'package:flutter/material.dart';

class ShadowConstant {
  static List<BoxShadow> shadowSm = [
    BoxShadow(
      color: const Color(0XFF000000).withOpacity(0.08),
      offset: const Offset(0, 4),
      blurRadius: 19,
    ),
  ];
  static List<BoxShadow> shadowMd = [
    BoxShadow(
      color: const Color(0XFF000000).withOpacity(0.1),
      offset: const Offset(0, 4),
      blurRadius: 48,
      spreadRadius: -2,
    ),
  ];
}
