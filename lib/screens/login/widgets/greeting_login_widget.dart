import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:dasarata_mobile/constants/color_constant.dart';
import 'package:dasarata_mobile/constants/spacing_constant.dart';
import 'package:dasarata_mobile/constants/text_style_constant.dart';
import 'package:flutter/material.dart';

class GreetingLoginWidget extends StatelessWidget {
  const GreetingLoginWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AnimatedTextKit(
          isRepeatingAnimation: false,
          animatedTexts: [
            TyperAnimatedText(
              "Selamat Datang!",
              textStyle: TextStyleConstant.semiboldHeading4.copyWith(
                color: ColorConstant.primaryColor,
              ),
              speed: const Duration(milliseconds: 200),
            ),
          ],
        ),
        SpacingConstant.verticalSpacing8px,
        Text(
          "Masuk untuk mengakses dashboard internal, kelola data pelanggan, serta monitor performa.",
          style: TextStyleConstant.regularParagraph,
        ),
      ],
    );
  }
}