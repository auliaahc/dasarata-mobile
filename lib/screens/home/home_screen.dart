import 'package:dasarata_mobile/constants/color_constant.dart';
import 'package:dasarata_mobile/constants/spacing_constant.dart';
import 'package:dasarata_mobile/controllers/home_controller.dart';
import 'package:dasarata_mobile/screens/home/widgets/chart/list_chart_home_widget.dart';
import 'package:dasarata_mobile/screens/home/widgets/count/list_count_home_widget.dart';
import 'package:dasarata_mobile/screens/home/widgets/header_home_widget.dart';
import 'package:dasarata_mobile/screens/home/widgets/subtitle_dashboard_home_widget.dart';
import 'package:dasarata_mobile/utilities/system_ui_overlay_utils.dart';
import 'package:dasarata_mobile/widgets/loading_animation_global_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SystemUiOverlayUtils.setSystemUiOverlay();
    final HomeController homeController = Get.put(HomeController());
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
                  const SubtitleDashboardHomeWidget(),
                  SpacingConstant.verticalSpacing16px,
                  if (homeController.isLoadingHome.value) ...[
                    const Padding(
                      padding: EdgeInsets.only(top: 175),
                      child: LoadingAnimationGlobalWidget(),
                    )
                  ] else ...[
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
