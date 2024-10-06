import 'package:dasarata_mobile/constants/color_constant.dart';
import 'package:dasarata_mobile/constants/spacing_constant.dart';
import 'package:dasarata_mobile/screens/home/widgets/chart/list_chart_home_widget.dart';
import 'package:dasarata_mobile/screens/home/widgets/count/list_count_home_widget.dart';
import 'package:dasarata_mobile/screens/home/widgets/header_home_widget.dart';
import 'package:dasarata_mobile/screens/home/widgets/subtitle_dashboard_home_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstant.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const HeaderHomeWidget(),
              SpacingConstant.verticalSpacing32px,
              const SubtitleDashboardHomeWidget(),
              SpacingConstant.verticalSpacing16px,
              const ListCountHomeWidget(),
              SpacingConstant.verticalSpacing16px,
              const ListChartHomeWidget(),
              SpacingConstant.verticalSpacing32px,
            ],
          ),
        ),
      ),
    );
  }
}
