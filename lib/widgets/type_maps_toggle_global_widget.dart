import 'package:dasarata_mobile/constants/color_constant.dart';
import 'package:dasarata_mobile/constants/shadow_constant.dart';
import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';

class TypeMapsToggleGlobalWidget extends StatelessWidget {
  final Function(int?) onToggle;
  final int index;
  const TypeMapsToggleGlobalWidget({
    super.key,
    required this.onToggle,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(boxShadow: ShadowConstant.mapTypeShadow),
      child: ToggleSwitch(
        labels: const [
          "Normal",
          "Satellite",
        ],
        dividerColor: ColorConstant.primaryColor,
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
        customTextStyles: const [
          TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 12,
          ),
        ],
      ),
    );
  }
}
