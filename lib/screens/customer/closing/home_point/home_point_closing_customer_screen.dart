import 'package:dasarata_mobile/constants/color_constant.dart';
import 'package:dasarata_mobile/controllers/closing_customer_controller.dart';
import 'package:dasarata_mobile/controllers/home_point_closing_customer_controller.dart';
import 'package:dasarata_mobile/screens/customer/closing/home_point/widgets/footer/footer_home_point_closing_customer_widget.dart';
import 'package:dasarata_mobile/screens/customer/closing/home_point/widgets/header/header_home_point_closing_customer_widget.dart';
import 'package:dasarata_mobile/screens/customer/closing/home_point/widgets/maps_home_point_closing_customer_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class HomePointClosingCustomerScreen extends StatelessWidget {
  const HomePointClosingCustomerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ClosingCustomerController closingCustomerController = Get.put(ClosingCustomerController());
    final HomePointClosingCustomerController homePointClosingCustomerController =  Get.put(HomePointClosingCustomerController());
    Get.engine.addPostFrameCallback((_) {
      homePointClosingCustomerController.checkData(closingCustomerController.detailClosingCustomer.value!.id);
    });
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(statusBarColor: ColorConstant.whiteColor),
      child: const Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              MapsHomePointClosingCustomerWidget(),
              Positioned(
                left: 0,
                right: 0,
                child: HeaderHomePointClosingCustomerWidget(),
              ),
              Positioned(
                bottom: 32,
                left: 0,
                right: 0,
                child: FooterHomePointClosingCustomerWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
