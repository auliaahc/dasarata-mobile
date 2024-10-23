import 'package:flutter/material.dart';
import 'package:dasarata_mobile/constants/spacing_constant.dart';
import 'package:dasarata_mobile/constants/text_style_constant.dart';
import 'package:dasarata_mobile/screens/home/widgets/chart/chart_home_widget.dart';
import 'package:dasarata_mobile/widgets/container_global_widget.dart';

class ItemChartHomeWidget extends StatelessWidget {
  final String title;
  final List<Map<String, dynamic>> data;
  const ItemChartHomeWidget({
    super.key,
    required this.title,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return ContainerGlobalWidget(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyleConstant.mediumParagraph,
          ),
          SpacingConstant.verticalSpacing24px,
          if (data != [])
          ChartHomeWidget(data: data)
          else
          const Text("Tidak ada data"),
        ],
      ),
    );
  }
}
