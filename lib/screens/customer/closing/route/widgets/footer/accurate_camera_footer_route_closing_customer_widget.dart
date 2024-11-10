import 'package:dasarata_mobile/constants/color_constant.dart';
import 'package:dasarata_mobile/constants/icon_constant.dart';
import 'package:dasarata_mobile/controllers/route_closing_customer_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class AccurateCameraFooterRouteClosingCustomerWidget extends StatelessWidget {
  const AccurateCameraFooterRouteClosingCustomerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final RouteClosingCustomerController routeClosingCustomerController =
        Get.put(RouteClosingCustomerController());
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SizedBox(
          width: 56,
          height: 56,
          child: FloatingActionButton(
            backgroundColor: ColorConstant.whiteColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(32),
            ),
            onPressed: routeClosingCustomerController.moveCameraToBounds,
            child: Center(
              child: SvgPicture.asset(IconConstant.currentLocation),
            ),
          ),
        ),
      ],
    );
  }
}
