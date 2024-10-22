import 'package:dasarata_mobile/constants/color_constant.dart';
import 'package:dasarata_mobile/constants/spacing_constant.dart';
import 'package:dasarata_mobile/screens/customer/dashboard/widgets/search_bar_dashboard_customer_widget.dart';
import 'package:dasarata_mobile/screens/customer/dashboard/widgets/tab_bar_dashboard_customer_widget.dart';
import 'package:dasarata_mobile/screens/customer/dashboard/widgets/view_tab_bar_dashboard_customer_widget.dart';
import 'package:dasarata_mobile/widgets/appbar_global_widget.dart';
import 'package:flutter/material.dart';

class DashboardCustomerScreen extends StatelessWidget {
  const DashboardCustomerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: const AppbarGlobalWidget(title: "Customer"),
        backgroundColor: ColorConstant.whiteColor,
        body: Column(
          children: [
            const SearchBarDashboardCustomerWidget(),
            SpacingConstant.verticalSpacing12px,
            const TabBarDashboardCustomerWidget(),
            const ViewTabBarDashboardCustomerWidget()
          ],
        ),
      ),
    );
  }
}