import 'package:dasarata_mobile/constants/spacing_constant.dart';
import 'package:flutter/material.dart';
import 'package:dasarata_mobile/constants/color_constant.dart';
import 'package:dasarata_mobile/constants/text_style_constant.dart';

class TextFieldGlobalWidget extends StatelessWidget {
  final TextEditingController? controller;
  final IconData? icon;
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
  final dynamic Function(String?)? onSaved;
  final String? labelName;
  final String? additionalLabel;
  final int? minLines;
  final int? maxLines;
  final Function()? additionalAction;

  const TextFieldGlobalWidget({
    this.obscureText,
    this.additionalAction,
    this.additionalLabel,
    this.labelName,
    super.key,
    this.onSaved,
    this.controller,
    this.icon,
    required this.hint,
    this.isPassword,
    this.onChanged,
    this.suffixIcon,
    this.errorText,
    this.validator,
    required this.textInputAction,
    required this.keyboardType,
    this.height,
    this.minLines,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (labelName != null) ...[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                labelName!,
                style: TextStyleConstant.mediumParagraph,
              ),
              if (additionalLabel != null)
                GestureDetector(
                  onTap: additionalAction,
                  child: Text(
                    "${additionalLabel!} >",
                    style: TextStyleConstant.regularParagraph.copyWith(
                      color: ColorConstant.primaryColor,
                    ),
                  ),
                ),
            ],
          ),
          SpacingConstant.verticalSpacing6px
        ],
        ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: height ?? 48,
          ),
          child: TextFormField(
            onSaved: onSaved,
            validator: validator,
            onChanged: onChanged,
            obscureText: obscureText ?? false,
            controller: controller,
            style: TextStyleConstant.regularParagraph,
            textInputAction: textInputAction,
            keyboardType: keyboardType,
            minLines: minLines ?? 1,
            maxLines: maxLines ?? 5,
            decoration: InputDecoration(
              errorText: errorText,
              prefixIcon: icon != null
                  ? Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Icon(icon),
                    )
                  : null,
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
                  width: 0.5,
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
        ),
      ],
    );
  }
}
