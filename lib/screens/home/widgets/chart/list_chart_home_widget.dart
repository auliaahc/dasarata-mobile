import 'package:dasarata_mobile/controllers/dashboard_controller.dart';
import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dasarata_mobile/screens/home/widgets/chart/item_chart_home_widget.dart';

class ListChartHomeWidget extends StatelessWidget {
  const ListChartHomeWidget({super.key});

  static const List<String> monthOrder = [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December"
  ];

  @override
  Widget build(BuildContext context) {
    final DashboardController dashboardController = Get.find();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Obx(
        () {
          final prospectStats =
              dashboardController.prospectStatisticts.value ?? [];
          final closingStats =
              dashboardController.closingStatisticts.value ?? [];
          return DynamicHeightGridView(
            itemCount: 2,
            crossAxisCount: 1,
            mainAxisSpacing: 16,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            builder: (context, index) {
              if (index == 0) {
                return _buildStatictics(
                  "Statistik Customer Prospek",
                  prospectStats,
                );
              } else {
                return _buildStatictics(
                  "Statistik Customer Closing",
                  closingStats,
                );
              }
            },
          );
        },
      ),
    );
  }

  Widget _buildStatictics(String title, List<dynamic> data) {
    final sortedData = data
        .map(
          (e) => {
            "month_name": e.monthName,
            "total": e.total,
          },
        )
        .toList();

    sortedData.sort((a, b) {
      final monthAIndex = monthOrder.indexOf(a["month_name"]);
      final monthBIndex = monthOrder.indexOf(b["month_name"]);
      return monthAIndex.compareTo(monthBIndex);
    });

    return ItemChartHomeWidget(
      title: title,
      data: sortedData,
    );
  }
}
