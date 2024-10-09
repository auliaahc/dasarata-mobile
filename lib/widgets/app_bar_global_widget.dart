import 'package:dasarata_mobile/constants/text_style_constant.dart';
import 'package:flutter/material.dart';
import 'package:dasarata_mobile/constants/color_constant.dart';

class AppBarGlobalWidget extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Color? shadowColor;
  const AppBarGlobalWidget({
    super.key,
    required this.title,
    this.shadowColor,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      shadowColor: shadowColor,
      toolbarHeight: 50,
      backgroundColor: ColorConstant.whiteColor,
      centerTitle: true,
      title: Text(title),
      titleTextStyle: TextStyleConstant.semiboldSubtitle.copyWith(fontFamily: "Poppins"),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
