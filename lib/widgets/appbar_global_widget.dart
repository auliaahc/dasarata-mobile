import 'package:dasarata_mobile/constants/text_style_constant.dart';
import 'package:flutter/material.dart';
import 'package:dasarata_mobile/constants/color_constant.dart';

class AppbarGlobalWidget extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Color? shadowColor;
  final bool? implyLeading;
  const AppbarGlobalWidget({
    super.key,
    required this.title,
    this.implyLeading,
    this.shadowColor,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: implyLeading ?? false,
      shadowColor: shadowColor,
      toolbarHeight: 50,
      backgroundColor: ColorConstant.whiteColor,
      centerTitle: true,
      title: Text(title),
      titleTextStyle: TextStyleConstant.semiboldTitle.copyWith(fontFamily: "Poppins"),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(50),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
