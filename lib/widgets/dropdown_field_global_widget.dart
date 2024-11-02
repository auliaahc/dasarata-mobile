import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:dasarata_mobile/constants/color_constant.dart';
import 'package:dasarata_mobile/constants/spacing_constant.dart';
import 'package:dasarata_mobile/constants/text_style_constant.dart';

class DropdownFieldGlobalWidget<T> extends StatelessWidget {
  final String? labelName;
  final String? additionalLabel;
  final Function()? additionalAction;
  final Function(String?)? onChanged;
  final String? Function(String?)? validator;
  final String hint;
  final List<T> items;
  final String? value;
  final String Function(T) getValue;
  final String Function(T) getLabel;
  final Function(String?)? onSaved;

  const DropdownFieldGlobalWidget({
    this.onSaved,
    this.labelName,
    this.additionalAction,
    this.additionalLabel,
    required this.items,
    this.value,
    this.onChanged,
    this.validator,
    required this.hint,
    required this.getValue,
    required this.getLabel,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
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
                    "$additionalLabel >",
                    style: TextStyleConstant.regularParagraph.copyWith(
                      color: ColorConstant.primaryColor,
                    ),
                  ),
                ),
            ],
          ),
          SpacingConstant.verticalSpacing6px,
        ],
        DropdownButtonFormField2(
          buttonStyleData: ButtonStyleData(
            height: 48,
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(32),
            ),
          ),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.zero,
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(32),
              borderSide: BorderSide(
                color: ColorConstant.neutralColor700,
                width: 0.5,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(32),
              borderSide: BorderSide(
                color: ColorConstant.neutralColor700,
                width: 0.5,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(32),
              borderSide: BorderSide(
                color: ColorConstant.secondaryColor,
                width: 2,
              ),
            ),
          ),
          dropdownStyleData: DropdownStyleData(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: ColorConstant.whiteColor,
            ),
          ),
          hint: Text(
            hint,
            style: TextStyleConstant.mediumParagraph.copyWith(
              color: const Color(0XFFB5B7B9),
            ),
          ),
          value: value,
          isExpanded: true,
          items: items.map((item) {
            final itemValue = getValue(item);
            return DropdownMenuItem(
              value: itemValue,
              child: Text(
                getLabel(item),
                style: TextStyleConstant.regularParagraph,
              ),
            );
          }).toList(),
          onChanged: onChanged,
          validator: validator,
          onSaved: onSaved,
        ),
      ],
    );
  }
}
