import 'package:dasarata_mobile/constants/color_constant.dart';
import 'package:dasarata_mobile/constants/spacing_constant.dart';
import 'package:dasarata_mobile/constants/text_style_constant.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:dasarata_mobile/constants/lottie_constant.dart';

class EmptyStateGlobalWidget extends StatelessWidget {
  final double? size;
  final Widget? additionalSpacing;
  const EmptyStateGlobalWidget({
    super.key,
    this.size,
    this.additionalSpacing,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRect(
              child: Align(
                alignment: Alignment.center,
                heightFactor: 0.8,
                child: Lottie.asset(
                  LottieConstant.emptyState,
                  width: size ?? 250,
                  height: size ?? 250,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SpacingConstant.horizontalSpacing10px
          ],
        ),
        Text(
          "Hmm, tidak ada data di sini!",
          style: TextStyleConstant.regularCaption.copyWith(
            color: ColorConstant.neutralColor600,
          ),
        ),
        if (additionalSpacing != null) additionalSpacing!
      ],
    );
  }
}
