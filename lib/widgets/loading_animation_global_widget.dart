import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:dasarata_mobile/constants/color_constant.dart';

class LoadingAnimationGlobalWidget extends StatelessWidget {
  final double? size;
  final bool? isLinearAnimation;
  const LoadingAnimationGlobalWidget({
    super.key,
    this.size,
    this.isLinearAnimation,
  });

  @override
  Widget build(BuildContext context) {
    if (isLinearAnimation == null || isLinearAnimation!) {
      return LoadingAnimationWidget.horizontalRotatingDots(
        color: ColorConstant.whiteColor,
        size: size ?? 45,
      );
    } else {
      return LoadingAnimationWidget.threeArchedCircle(
        color: ColorConstant.primaryColor,
        size: size ?? 45,
      );
    }
  }
}
