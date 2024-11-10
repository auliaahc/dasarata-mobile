import 'package:dasarata_mobile/constants/color_constant.dart';
import 'package:dasarata_mobile/constants/spacing_constant.dart';
import 'package:dasarata_mobile/controllers/route_closing_customer_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';

class DistanceHeaderRouteClosingCustomerWidget extends StatelessWidget {
  const DistanceHeaderRouteClosingCustomerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final RouteClosingCustomerController routeClosingCustomerController = Get.find();
    return Container(
      padding: const EdgeInsets.only(
        left: 16,
        right: 16,
        top: 10,
        bottom: 20,
      ),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.vertical(
          bottom: Radius.circular(12),
        ),
        color: ColorConstant.whiteColor,
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              LineIcons.rulerHorizontal,
              color: ColorConstant.primaryColor,
            ),
            SpacingConstant.horizontalSpacing8px,
            Obx(
              () {
                return Text(
                  "${routeClosingCustomerController.distance.toStringAsFixed(2)} m",
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
