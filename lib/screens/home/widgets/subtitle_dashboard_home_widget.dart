import 'package:dasarata_mobile/constants/icon_constant.dart';
import 'package:dasarata_mobile/constants/spacing_constant.dart';
import 'package:dasarata_mobile/constants/text_style_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SubtitleDashboardHomeWidget extends StatelessWidget {
  const SubtitleDashboardHomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SvgPicture.asset(IconConstant.dashboard),
          SpacingConstant.horizontalSpacing12px,
          Text(
            "Dashboard",
            style: TextStyleConstant.semiboldSubtitle,
          )
        ],
      ),
    );
  }
}
