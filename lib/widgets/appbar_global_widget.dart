import 'package:dasarata_mobile/constants/text_style_constant.dart';
import 'package:flutter/material.dart';
import 'package:dasarata_mobile/constants/color_constant.dart';

class AppbarGlobalWidget extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Color? shadowColor;
  final bool? implyLeading;
  final Widget? action;
  final Function()? onPressedAction;
  const AppbarGlobalWidget({
    super.key,
    required this.title,
    this.onPressedAction,
    this.implyLeading,
    this.shadowColor,
    this.action,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: action != null && onPressedAction != null
          ? [
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: IconButton(
                  onPressed: onPressedAction,
                  icon: action!,
                ),
              )
            ]
          : null,
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
