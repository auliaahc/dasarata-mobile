import 'package:dasarata_mobile/constants/color_constant.dart';
import 'package:dasarata_mobile/constants/text_style_constant.dart';
import 'package:dasarata_mobile/controllers/dashboard_customer_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TabBarDashboardCustomerWidget extends StatelessWidget {
  const TabBarDashboardCustomerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final DashboardCustomerController dashboardCustomerController = Get.find();
    return TabBar(
      onTap: (index) => dashboardCustomerController.setCustomerTabIndex(index),
      dividerColor: ColorConstant.neutralColor600,
      dividerHeight: 0.5,
      indicatorWeight: 3,
      indicatorColor: ColorConstant.primaryColor,
      indicatorSize: TabBarIndicatorSize.label,
      labelColor: ColorConstant.primaryColor,
      labelStyle: TextStyleConstant.semiboldSubtitle.copyWith(
        fontFamily: "Poppins",
      ),
      unselectedLabelColor: ColorConstant.neutralColor600,
      unselectedLabelStyle: TextStyleConstant.mediumSubtitle.copyWith(
        fontFamily: "Poppins",
      ),
      overlayColor: WidgetStateProperty.resolveWith<Color?>(
        (Set<WidgetState> states) {
          if (states.contains(WidgetState.pressed)) {
            return Colors.transparent;
          }
          return null;
        },
      ),
      tabs: const [
        Tab(text: "Prospek"),
        Tab(text: "Closing"),
      ],
    );
  }
}
