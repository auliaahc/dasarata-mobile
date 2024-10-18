import 'package:dasarata_mobile/controllers/dashboard_customer_controller.dart';
import 'package:dasarata_mobile/widgets/text_field_global_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';

class SearchBarDashboardCustomerWidget extends StatelessWidget {
  const SearchBarDashboardCustomerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final DashboardCustomerController dashboardCustomerController = Get.put(DashboardCustomerController());
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextFieldGlobalWidget(
        controller: dashboardCustomerController.searchController,
        icon: LineIcons.search,
        hint: "Search",
        textInputAction: TextInputAction.search,
        keyboardType: TextInputType.text,
      ),
    );
  }
}