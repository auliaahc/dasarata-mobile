import 'package:flutter/material.dart';

class ResponsiveComponentUtils {
  final BuildContext context;
  final double small;
  final double medium;
  final double large;
  ResponsiveComponentUtils({
    required this.context,
    required this.small,
    required this.medium,
    required this.large
  });

  static const double androidSmall = 360;
  static const double androidMedium = 412;
  static const double androidLarge = 480;

  double setComponentWidth() {
    double screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth <= androidSmall) {
      return small;
    } else if (screenWidth <= androidMedium) {
      return medium;
    } else {
      return large;
    }
  }
}
