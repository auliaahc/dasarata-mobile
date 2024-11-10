import 'package:dasarata_mobile/constants/color_constant.dart';
import 'package:dasarata_mobile/controllers/closing_customer_controller.dart';
import 'package:dasarata_mobile/screens/customer/closing/detail/widgets/address_detail_closing_customer_widget.dart';
import 'package:dasarata_mobile/screens/customer/closing/detail/widgets/documentation_detail_closing_customer_widget.dart';
import 'package:dasarata_mobile/screens/customer/closing/detail/widgets/personal_detail_closing_customer_widget.dart';
import 'package:dasarata_mobile/screens/customer/closing/detail/widgets/status_detail_closing_customer_widget.dart';
import 'package:dasarata_mobile/screens/customer/closing/detail/widgets/subscription_detail_closing_customer_widget.dart';
import 'package:dasarata_mobile/screens/customer/closing/detail/widgets/technical_detail_closing_customer_widget.dart';
import 'package:dasarata_mobile/screens/customer/closing/route/route_closing_customer_screen.dart';
import 'package:dasarata_mobile/screens/customer/closing/spliter/spliter_closing_customer_screen.dart';
import 'package:dasarata_mobile/widgets/appbar_global_widget.dart';
import 'package:dasarata_mobile/widgets/loading_animation_global_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';

class DetailClosingCustomerScreen extends StatelessWidget {
  const DetailClosingCustomerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ClosingCustomerController closingCustomerController =
        Get.put(ClosingCustomerController());

    return Scaffold(
      backgroundColor: ColorConstant.whiteColor,
      appBar: AppbarGlobalWidget(
        title: "Detail Customer Closing",
        implyLeading: true,
        action: const Icon(LineIcons.map),
        onPressedAction: () => Get.to(const RouteClosingCustomerScreen()),
      ),
      body: Obx(
        () {
          if (closingCustomerController.isLoadingGetClosingCustomer.value) {
            return const Center(
              child: LoadingAnimationGlobalWidget(),
            );
          } else {
            return const SingleChildScrollView(
              child: Column(
                children: [
                  StatusDetailClosingCustomerWidget(),
                  PersonalDetailClosingCustomerWidget(),
                  AddressDetailClosingCustomerWidget(),
                  TechnicalDetailClosingCustomerWidget(),
                  SubscriptionDetailClosingCustomerWidget(),
                  DocumentationDetailClosingCustomerWidget(),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
