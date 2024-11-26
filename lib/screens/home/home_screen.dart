import 'package:dasarata_mobile/constants/color_constant.dart';
import 'package:dasarata_mobile/constants/spacing_constant.dart';
import 'package:dasarata_mobile/controllers/dashboard_controller.dart';
import 'package:dasarata_mobile/screens/home/widgets/chart/list_chart_home_widget.dart';
import 'package:dasarata_mobile/screens/home/widgets/count/list_count_home_widget.dart';
import 'package:dasarata_mobile/screens/home/widgets/header_home_widget.dart';
import 'package:dasarata_mobile/screens/home/widgets/dashboard_subtitle_home_widget.dart';
import 'package:dasarata_mobile/utilities/system_ui_overlay_utils.dart';
import 'package:dasarata_mobile/widgets/loading_animation_global_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SystemUiOverlayUtils.setSystemUiOverlay();
    final DashboardController dashboardController = Get.put(DashboardController());
    Get.engine.addPostFrameCallback((_) {
      dashboardController.fetchDashboardData();
    });
    return Scaffold(
      backgroundColor: ColorConstant.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Obx(
            () {
              return Column(
                children: [
                  const HeaderHomeWidget(),
                  SpacingConstant.verticalSpacing32px,
                  const DashboardSubtitleHomeWidget(),
                  SpacingConstant.verticalSpacing16px,
                  if (dashboardController.isLoadingGetDashboard.value)
                    const Padding(
                      padding: EdgeInsets.only(top: 175),
                      child: LoadingAnimationGlobalWidget(),
                    )
                  else ...[
                    const ListCountHomeWidget(),
                    SpacingConstant.verticalSpacing16px,
                    const ListChartHomeWidget(),
                    SpacingConstant.verticalSpacing32px,
                  ]
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
