import 'package:dasarata_mobile/constants/lottie_constant.dart';
import 'package:dasarata_mobile/constants/spacing_constant.dart';
import 'package:dasarata_mobile/utilities/responsive_component_utils.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AnimationLoginWidget extends StatelessWidget {
  const AnimationLoginWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        LottieBuilder.asset(
          LottieConstant.login,
          width: ResponsiveComponentUtils(
            context: context,
            small: 312,
            medium: 364,
            large: 375,
          ).setComponentWidth(),
        ),
        SpacingConstant.horizontalSpacing16px
      ],
    );
  }
}
