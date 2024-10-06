import 'package:dasarata_mobile/constants/spacing_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:dasarata_mobile/constants/color_constant.dart';
import 'package:dasarata_mobile/constants/text_style_constant.dart';
import 'package:dasarata_mobile/widgets/container_global_widget.dart';

class ItemCountHomeWidget extends StatelessWidget {
  final String title;
  final String icon;
  final int count;
  const ItemCountHomeWidget({
    super.key,
    required this.title,
    required this.icon,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    return ContainerGlobalWidget(
      width: double.infinity,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(icon),
          SpacingConstant.horizontalSpacing12px,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: TextStyleConstant.regularCaption.copyWith(
                  color: ColorConstant.neutralColor700,
                ),
              ),
              Text(
                count.toString(),
                style: TextStyleConstant.semiboldParagraph,
              ),
            ],
          )
        ],
      ),
    );
  }
}