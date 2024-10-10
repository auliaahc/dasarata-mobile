import 'package:flutter/material.dart';
import 'package:dasarata_mobile/constants/color_constant.dart';
import 'package:dasarata_mobile/constants/text_style_constant.dart';

class TextFieldGlobalWidget extends StatelessWidget {
  final TextEditingController controller;
  final IconData icon;
  final String hint;
  final bool? isPassword;
  final bool? obscureText;
  final Function(String)? onChanged;
  final Widget? suffixIcon;
  final String? errorText;
  final String? Function(String?)? validator;
  final TextInputAction textInputAction;
  final TextInputType keyboardType;
  final double? height;
  const TextFieldGlobalWidget({
    super.key,
    required this.controller,
    required this.icon,
    required this.hint,
    this.isPassword,
    this.obscureText,
    this.onChanged,
    this.suffixIcon,
    this.errorText,
    this.validator,
    required this.textInputAction,
    required this.keyboardType,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minHeight: height ?? 48,
      ),
      child: TextFormField(
        validator: validator,
        onChanged: onChanged,
        obscureText: obscureText ?? false,
        controller: controller,
        style: TextStyleConstant.regularParagraph,
        textInputAction: textInputAction,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          errorText: errorText,
          prefixIcon: Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Icon(icon),
          ),
          prefixIconColor: ColorConstant.primaryColor,
          suffixIcon: Padding(
            padding: const EdgeInsets.only(right: 8),
            child: suffixIcon,
          ),
          suffixIconColor: ColorConstant.neutralColor700,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 10,
          ),
          hintText: hint,
          hintStyle: TextStyleConstant.mediumParagraph.copyWith(
            color: const Color(0XFFB5B7B9),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32),
            borderSide: BorderSide(
              color: ColorConstant.secondaryColor,
              width: 2,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32),
            borderSide: BorderSide(
              color: ColorConstant.neutralColor700,
              width: 1,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32),
            borderSide: BorderSide(
              color: ColorConstant.dangerColor,
              width: 1.5,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32),
            borderSide: BorderSide(
              color: ColorConstant.dangerColor,
              width: 2,
            ),
          ),
        ),
      ),
    );
  }
}
