import 'package:dasarata_mobile/constants/spacing_constant.dart';
import 'package:flutter/material.dart';
import 'package:dasarata_mobile/constants/color_constant.dart';
import 'package:dasarata_mobile/constants/text_style_constant.dart';

class DropdownFieldGlobalWidget extends StatelessWidget {
  final String? labelName;
  final String? additionalLabel;
  final Function()? additionalAction;
  final List<String> items;
  final String? value;
  final Function(String?)? onChanged;
  final String? Function(String?)? validator;
  final String hint;
  const DropdownFieldGlobalWidget({
    this.labelName,
    this.additionalAction,
    this.additionalLabel,
    required this.items,
    this.value,
    this.onChanged,
    this.validator,
    required this.hint,
    super.key,
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
          constraints: const BoxConstraints(
            minHeight: 48,
          ),
          child: Theme(
            data: Theme.of(context).copyWith(
              canvasColor: ColorConstant.whiteColor,
            ),
            child: DropdownButtonFormField(
              hint: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  hint,
                  style: TextStyleConstant.mediumParagraph.copyWith(
                    color: const Color(0XFFB5B7B9),
                  ),
                ),
              ),
              items: items.map((item) {
                return DropdownMenuItem(
                  value: item,
                  child: Text(
                    item,
                    style: TextStyleConstant.regularParagraph,
                  ),
                );
              }).toList(),
              onChanged: onChanged,
              validator: validator,
              decoration: InputDecoration(
                hintText: hint,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 10,
                ),
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
          ),
        ),
      ],
    );
  }
}
