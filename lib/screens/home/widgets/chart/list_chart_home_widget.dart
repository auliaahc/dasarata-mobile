import 'package:dasarata_mobile/constants/color_constant.dart';
import 'package:dasarata_mobile/constants/spacing_constant.dart';
import 'package:dasarata_mobile/constants/text_style_constant.dart';
import 'package:dasarata_mobile/controllers/home_controller.dart';
import 'package:dasarata_mobile/screens/home/widgets/chart/item_chart_home_widget.dart';
import 'package:dasarata_mobile/widgets/container_global_widget.dart';
import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListChartHomeWidget extends StatelessWidget {
  const ListChartHomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.find();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Obx(() {
        final prospectStats = homeController.prospectStatisticts.value;
        final closingStats = homeController.closingStatisticts.value;

        return DynamicHeightGridView(
          itemCount: 2,
          crossAxisCount: 1,
          mainAxisSpacing: 16,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          builder: (context, index) {
            if (index == 0) {
              return _buildStatSection(
                "Statistik Customer Prospek",
                prospectStats,
              );
            } else {
              return _buildStatSection(
                "Statistik Customer Closing",
                closingStats,
              );
            }
          },
        );
      }),
    );
  }

  Widget _buildStatSection(String title, List<dynamic>? data) {
    if (data == null || data.isEmpty) {
      return _buildEmptyState(title);
    }

    return ItemChartHomeWidget(
      title: title,
      data: data
          .map((e) => {
                "month": e.monthName,
                "total": e.total,
              })
          .toList(),
    );
  }

  Widget _buildEmptyState(String title) {
    return ContainerGlobalWidget(
      width: double.infinity,
      height: 200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyleConstant.mediumParagraph,
          ),
          SpacingConstant.verticalSpacing24px,
          Expanded(
            child: Center(
              child: Text(
                "Data tidak tersedia",
                style: TextStyleConstant.regularCaption.copyWith(
                  color: ColorConstant.neutralColor600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
