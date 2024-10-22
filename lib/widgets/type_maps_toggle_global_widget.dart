import 'package:dasarata_mobile/constants/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';

class TypeMapsToggleGlobalWidget extends StatelessWidget {
  final Function(int?) onToggle;
  final int index;
  const TypeMapsToggleGlobalWidget({
    super.key,
    required this.onToggle,
    required this.index
  });

  @override
  Widget build(BuildContext context) {
    return ToggleSwitch(
      labels: const [
        "Map",
        "Satellite",
      ],
      dividerColor: const Color(0XFFF2F2F2),
      animate: true,
      centerText: true,
      onToggle: onToggle,
      activeFgColor: ColorConstant.whiteColor,
      inactiveFgColor: ColorConstant.neutralColor800,
      activeBgColor: [ColorConstant.primaryColor],
      inactiveBgColor: ColorConstant.whiteColor,
      animationDuration: 150,
      minHeight: 30,
      minWidth: 80,
      initialLabelIndex: index,
    );
  }
}
