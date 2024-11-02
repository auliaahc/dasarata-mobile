import 'package:dasarata_mobile/constants/color_constant.dart';
import 'package:dasarata_mobile/constants/icon_constant.dart';
import 'package:dasarata_mobile/constants/spacing_constant.dart';
import 'package:dasarata_mobile/constants/text_style_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class AppbarHeaderMapsProspectCustomerWidget extends StatelessWidget {
  const AppbarHeaderMapsProspectCustomerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: ColorConstant.whiteColor,
      ),
      padding: const EdgeInsets.only(right: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () => Get.back(),
            icon: SvgPicture.asset(
              IconConstant.arrowBack,
              colorFilter: ColorFilter.mode(
                ColorConstant.neutralColor900,
                BlendMode.srcIn,
              ),
            ),
          ),
          Text(
            "Maps",
            style: TextStyleConstant.semiboldSubtitle,
          ),
          SpacingConstant.horizontalSpacing32px
        ],
      ),
    );
  }
}
