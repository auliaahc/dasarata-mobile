import 'package:dasarata_mobile/constants/color_constant.dart';
import 'package:dasarata_mobile/controllers/closing_customer_controller.dart';
import 'package:dasarata_mobile/controllers/route_closing_customer_controller.dart';
import 'package:dasarata_mobile/screens/customer/closing/route/widgets/footer/footer_route_closing_customer_widget.dart';
import 'package:dasarata_mobile/screens/customer/closing/route/widgets/header/header_route_closing_customer_widget.dart';
import 'package:dasarata_mobile/screens/customer/closing/route/widgets/maps_route_closing_customer_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class RouteClosingCustomerScreen extends StatelessWidget {
  const RouteClosingCustomerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final RouteClosingCustomerController routeClosingCustomerController =
        Get.put(RouteClosingCustomerController());
    final ClosingCustomerController closingCustomerController =
        Get.put(ClosingCustomerController());
    Get.engine.addPostFrameCallback((_) {
      routeClosingCustomerController.getClosingCustomerData(
          closingCustomerController.detailClosingCustomer.value!.id);
    });
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(statusBarColor: ColorConstant.whiteColor),
      child: Scaffold(
        backgroundColor: ColorConstant.whiteColor,
        body: const SafeArea(
          child: Stack(
            children: [
              MapsRouteClosingCustomerWidget(),
              Positioned(
                left: 0,
                right: 0,
                child: HeaderRouteClosingCustomerWidget(),
              ),
              Positioned(
                bottom: 32,
                left: 0,
                right: 0,
                child: FooterRouteClosingCustomerWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
