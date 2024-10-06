import 'package:dasarata_mobile/constants/icon_constant.dart';
import 'package:dasarata_mobile/screens/home/widgets/count/item_count_home_widget.dart';
import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';

class ListCountHomeWidget extends StatelessWidget {
  const ListCountHomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    const List<Map<String, dynamic>> items = [
      {"title": "Cust. Prospek", "icon": IconConstant.prospect, "count": 5},
      {"title": "Cust. Closing", "icon": IconConstant.closing, "count": 10}
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: DynamicHeightGridView(
        crossAxisCount: 2,
        crossAxisSpacing: 20,
        itemCount: items.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        builder: (context, index) {
          final item = items[index];
          return ItemCountHomeWidget(
            title: item["title"],
            icon: item["icon"],
            count: item["count"],
          );
        },
      ),
    );
  }
}
