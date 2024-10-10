import 'package:dasarata_mobile/constants/text_style_constant.dart';
import 'package:flutter/material.dart';
import 'package:dasarata_mobile/constants/color_constant.dart';

class ButtonGlobalWidget extends StatelessWidget {
  final double? width;
  final double? height;
  final Color? rippleColor;
  final Color? color;
  final String label;
  final Function() onTap;
  const ButtonGlobalWidget({
    super.key,
    this.width,
    this.height,
    this.color,
    this.rippleColor,
    required this.label, 
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color ?? ColorConstant.primaryColor,
      borderRadius: BorderRadius.circular(32),
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: onTap,
        splashColor: rippleColor ?? const Color(0XFF012B56),
        highlightColor: rippleColor ?? const Color(0XFF012B56),
        child: SizedBox(
          width: width ?? double.infinity,
          height: height ?? 48,
          child: Center(
            child: Text(
              label,
              style: TextStyleConstant.semiboldButton.copyWith(
                color: ColorConstant.whiteColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
