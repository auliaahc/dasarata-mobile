import 'package:dasarata_mobile/constants/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LoadingAnimationGlobalWidget extends StatelessWidget {
  const LoadingAnimationGlobalWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return LoadingAnimationWidget.staggeredDotsWave(
      color: ColorConstant.primaryColor,
      size: 40,
    );
  }
}
