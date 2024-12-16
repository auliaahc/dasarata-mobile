import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:dasarata_mobile/constants/color_constant.dart';

class LoadingAnimationGlobalWidget extends StatelessWidget {
  final double? size;
  final bool? isLinearAnimation;
  final Color? color;
  const LoadingAnimationGlobalWidget({
    super.key,
    this.size,
    this.isLinearAnimation,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    if (isLinearAnimation == null || !isLinearAnimation!) {
      return LoadingAnimationWidget.threeArchedCircle(
        color: color ?? ColorConstant.primaryColor,
        size: size ?? 45,
      );
    } else {
      return LoadingAnimationWidget.horizontalRotatingDots(
        color: color ?? ColorConstant.whiteColor,
        size: size ?? 45,
      );
    }
  }
}
