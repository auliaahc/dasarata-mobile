import 'package:dasarata_mobile/constants/spacing_constant.dart';
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
  final bool? isOutlined;
  final Icon? icon;
  const ButtonGlobalWidget({
    super.key,
    this.width,
    this.height,
    this.color,
    this.rippleColor,
    this.isOutlined,
    this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    switch (isOutlined) {
      case true:
        return OutlinedButton(
          style: OutlinedButton.styleFrom(
            side: BorderSide(
              color: color ?? ColorConstant.primaryColor,
            ),
            minimumSize: Size.fromHeight(height ?? 48),
          ),
          onPressed: onTap,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (icon != null) ...[
                icon!,
                SpacingConstant.horizontalSpacing8px,
              ],
              Text(
                label,
                style: TextStyleConstant.mediumParagraph.copyWith(
                  color: color ?? ColorConstant.primaryColor,
                ),
              ),
            ],
          ),
        );
      default:
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
}
