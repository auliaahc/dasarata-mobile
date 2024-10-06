import 'package:flutter/material.dart';
import 'package:dasarata_mobile/constants/color_constant.dart';
import 'package:dasarata_mobile/constants/shadow_constant.dart';

class ContainerGlobalWidget extends StatelessWidget {
  final double? width;
  final double? height;
  final Widget child;
  const ContainerGlobalWidget({
    super.key,
    this.width,
    this.height,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        boxShadow: ShadowConstant.shadowSm,
        color: ColorConstant.whiteColor,
        borderRadius: BorderRadius.circular(12)
      ),
      width: width,
      height: height,
      child: child,
    );
  }
}
