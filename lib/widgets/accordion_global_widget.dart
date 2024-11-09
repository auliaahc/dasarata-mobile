import 'package:custom_accordion/custom_accordion.dart';
import 'package:dasarata_mobile/constants/color_constant.dart';
import 'package:dasarata_mobile/constants/text_style_constant.dart';
import 'package:flutter/material.dart';

class AccordionGlobalWidget extends StatelessWidget {
  final String title;
  final Widget widgetItems;
  final bool isOpened;
  const AccordionGlobalWidget({
    super.key,
    this.isOpened = true,
    required this.widgetItems,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return CustomAccordion(
      title: title,
      backgroundColor: ColorConstant.whiteColor,
      headerBackgroundColor: ColorConstant.whiteColor,
      titleStyle: TextStyleConstant.semiboldSubtitle,
      toggleIconOpen: Icons.keyboard_arrow_down_sharp,
      toggleIconClose: Icons.keyboard_arrow_up_sharp,
      headerIconColor: ColorConstant.primaryColor,
      accordionElevation: 0,
      widgetItems: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: widgetItems,
      ),
    );
  }
}
