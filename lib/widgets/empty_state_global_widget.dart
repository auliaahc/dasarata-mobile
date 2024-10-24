import 'package:dasarata_mobile/constants/color_constant.dart';
import 'package:dasarata_mobile/constants/spacing_constant.dart';
import 'package:dasarata_mobile/constants/text_style_constant.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:dasarata_mobile/constants/lottie_constant.dart';

class EmptyStateGlobalWidget extends StatelessWidget {
  final double? size;
  const EmptyStateGlobalWidget({
    super.key,
    this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Lottie.asset(
          LottieConstant.emptyState,
          width: size ?? 200,
          height: size ?? 200,
        ),
        SpacingConstant.verticalSpacing4px,
        Text(
          "Data tidak tersedia",
          style: TextStyleConstant.regularCaption.copyWith(
            color: ColorConstant.neutralColor600,
          ),
        ),
      ],
    );
  }
}
