import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:dasarata_mobile/constants/color_constant.dart';

class LoadingAnimationGlobalWidget extends StatelessWidget {
  final double? size;
  const LoadingAnimationGlobalWidget({
    super.key,
    this.size,
  });

  @override
  Widget build(BuildContext context) {
    return LoadingAnimationWidget.threeArchedCircle(
      color: ColorConstant.primaryColor,
      size: size ?? 45,
    );
  }
}
