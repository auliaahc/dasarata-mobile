import 'package:dasarata_mobile/screens/home/widgets/chart/item_chart_home_widget.dart';
import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';

class ListChartHomeWidget extends StatelessWidget {
  const ListChartHomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    const List<Map<String, dynamic>> prospectData = [
      {"month": "Jan", "total": 200},
      {"month": "Feb", "total": 300},
      {"month": "Mar", "total": 350},
    ];
    const List<Map<String, dynamic>> closingData = [
      {"month": "Jan", "total": 200},
      {"month": "Feb", "total": 300},
      {"month": "Mar", "total": 350},
    ];
    const List<Map<String, dynamic>> statisticData = [
      {"title": "Statistik Customer Prospek", "data": prospectData},
      {"title": "Statistik Customer Closing", "data": closingData}
    ];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: DynamicHeightGridView(
        itemCount: statisticData.length,
        crossAxisCount: 1,
        mainAxisSpacing: 16,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        builder: (context, index) {
          final data = statisticData[index];
          return ItemChartHomeWidget(
            title: data["title"],
            data: data["data"],
          );
        },
      ),
    );
  }
}
