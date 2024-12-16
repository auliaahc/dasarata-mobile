import 'package:dasarata_mobile/constants/color_constant.dart';
import 'package:dasarata_mobile/controllers/detail_closing_customer_controller.dart';
import 'package:dasarata_mobile/controllers/spliter_closing_customer_controller.dart';
import 'package:dasarata_mobile/screens/customer/closing/spliter/widgets/footer/footer_spliter_closing_customer_widget.dart';
import 'package:dasarata_mobile/screens/customer/closing/spliter/widgets/header/header_spliter_closing_customer_widget.dart';
import 'package:dasarata_mobile/screens/customer/closing/spliter/widgets/maps_spliter_closing_customer_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class SpliterClosingCustomerScreen extends StatelessWidget {
  const SpliterClosingCustomerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final DetailClosingCustomerController detailClosingCustomerController = Get.put(DetailClosingCustomerController());
    final SpliterClosingCustomerController spliterClosingCustomerController = Get.put(SpliterClosingCustomerController());
    Get.engine.addPostFrameCallback((_) {
      spliterClosingCustomerController.fetchData(detailClosingCustomerController.detailClosingCustomer.value!.id);
    });
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(statusBarColor: ColorConstant.whiteColor),
      child: Scaffold(
        backgroundColor: ColorConstant.whiteColor,
        body: const SafeArea(
          child: Stack(
            children: [
              MapsSpliterClosingCustomerWidget(),
              Positioned(
                left: 0,
                right: 0,
                child: HeaderSpliterClosingCustomerWidget(),
              ),
              Positioned(
                bottom: 32,
                left: 0,
                right: 0,
                child: FooterSpliterClosingCustomerWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
