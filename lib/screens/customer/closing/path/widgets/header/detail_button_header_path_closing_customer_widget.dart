import 'package:dasarata_mobile/constants/color_constant.dart';
import 'package:dasarata_mobile/constants/spacing_constant.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class DetailButtonHeaderPathClosingCustomerWidget extends StatelessWidget {
  const DetailButtonHeaderPathClosingCustomerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        left: 16,
        right: 16,
        top: 10,
        bottom: 20,
      ),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.vertical(
          bottom: Radius.circular(12),
        ),
        color: ColorConstant.whiteColor,
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(LineIcons.route, color: ColorConstant.primaryColor),
            SpacingConstant.horizontalSpacing6px,
            const Text(
              "Belum memilih spliter",
            ),
          ],
        ),
      ),
    );
  }
}
