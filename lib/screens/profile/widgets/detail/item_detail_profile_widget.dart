import 'package:flutter/material.dart';
import 'package:dasarata_mobile/constants/color_constant.dart';
import 'package:dasarata_mobile/constants/spacing_constant.dart';
import 'package:dasarata_mobile/constants/text_style_constant.dart';

class ItemDetailProfileWidget extends StatelessWidget {
  final IconData icon;
  final String label;
  final String data;
  const ItemDetailProfileWidget({
    super.key,
    required this.icon,
    required this.label,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Icon(
              icon,
              color: ColorConstant.neutralColor700,
            ),
            SpacingConstant.horizontalSpacing32px,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: TextStyleConstant.regularParagraph.copyWith(
                      color: ColorConstant.neutralColor600,
                    ),
                  ),
                  SpacingConstant.verticalSpacing2px,
                  Text(
                    data,
                    style: TextStyleConstant.semiboldParagraph.copyWith(
                      color: ColorConstant.neutralColor800,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(
            bottom: 16,
            top: 8,
          ),
          child: Row(
            children: [
              SpacingConstant.horizontalSpacing24px,
              SpacingConstant.horizontalSpacing32px,
              const Expanded(
                child: Divider(
                  thickness: 0.5,
                  color: Color(0XFFC3CAD4),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
