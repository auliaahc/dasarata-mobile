import 'package:dasarata_mobile/constants/color_constant.dart';
import 'package:dasarata_mobile/constants/spacing_constant.dart';
import 'package:dasarata_mobile/controllers/closing_customer_controller.dart';
import 'package:dasarata_mobile/controllers/dashboard_customer_controller.dart';
import 'package:dasarata_mobile/controllers/prospect_customer_controller.dart';
import 'package:dasarata_mobile/screens/customer/dashboard/widgets/search_bar_dashboard_customer_widget.dart';
import 'package:dasarata_mobile/screens/customer/dashboard/widgets/tab_bar_dashboard_customer_widget.dart';
import 'package:dasarata_mobile/screens/customer/dashboard/widgets/view_tab_bar_dashboard_customer_widget.dart';
import 'package:dasarata_mobile/services/closing_customer_service.dart';
import 'package:dasarata_mobile/widgets/appbar_global_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardCustomerScreen extends StatelessWidget {
  const DashboardCustomerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final DashboardCustomerController dashboardCustomerController = Get.put(DashboardCustomerController());
    final ProspectCustomerController prospectCustomerController = Get.put(ProspectCustomerController());
    final ClosingCustomerController closingCustomerController = Get.put(ClosingCustomerController());
    Get.engine.addPostFrameCallback((_) {
      dashboardCustomerController.resetCustomerTabIndex();
      prospectCustomerController.resetSearchProspectCustomer();
    });
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
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