import 'package:dasarata_mobile/widgets/empty_state_global_widget.dart';
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
          if (data.isNotEmpty) ...[
            SpacingConstant.verticalSpacing24px,
            ChartHomeWidget(data: data)
          ] else
            const Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: Center(
                child: EmptyStateGlobalWidget(
                  size: 225,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
