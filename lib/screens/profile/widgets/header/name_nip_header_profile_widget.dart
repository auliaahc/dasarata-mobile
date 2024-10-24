import 'package:dasarata_mobile/constants/color_constant.dart';
import 'package:dasarata_mobile/constants/spacing_constant.dart';
import 'package:dasarata_mobile/constants/text_style_constant.dart';
import 'package:flutter/material.dart';

class NameNipHeaderProfileWidget extends StatelessWidget {
  const NameNipHeaderProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "John Doe",
          style: TextStyleConstant.semiboldSubtitle,
        ),
        SpacingConstant.verticalSpacing2px,
        Text(
          "215150701111019",
          style: TextStyleConstant.mediumParagraph.copyWith(
            color: ColorConstant.neutralColor700,
          ),
        ),
      ],
    );
  }
}