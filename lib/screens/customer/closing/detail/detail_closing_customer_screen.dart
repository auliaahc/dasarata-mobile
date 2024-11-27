import 'package:dasarata_mobile/constants/color_constant.dart';
import 'package:dasarata_mobile/constants/spacing_constant.dart';
import 'package:dasarata_mobile/controllers/closing_customer_controller.dart';
import 'package:dasarata_mobile/controllers/detail_closing_customer_controller.dart';
import 'package:dasarata_mobile/screens/customer/closing/detail/widgets/address_detail_closing_customer_widget.dart';
import 'package:dasarata_mobile/screens/customer/closing/detail/widgets/documentation_detail_closing_customer_widget.dart';
import 'package:dasarata_mobile/screens/customer/closing/detail/widgets/personal_detail_closing_customer_widget.dart';
import 'package:dasarata_mobile/screens/customer/closing/detail/widgets/status_detail_closing_customer_widget.dart';
import 'package:dasarata_mobile/screens/customer/closing/detail/widgets/subscription_detail_closing_customer_widget.dart';
import 'package:dasarata_mobile/screens/customer/closing/detail/widgets/technical_detail_closing_customer_widget.dart';
import 'package:dasarata_mobile/widgets/appbar_global_widget.dart';
import 'package:dasarata_mobile/widgets/empty_state_global_widget.dart';
import 'package:dasarata_mobile/widgets/loading_animation_global_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';

class DetailClosingCustomerScreen extends StatelessWidget {
  const DetailClosingCustomerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final DetailClosingCustomerController detailClosingCustomerController = Get.put(DetailClosingCustomerController());
    final ClosingCustomerController closingCustomerController = Get.put(ClosingCustomerController());
    Get.engine.addPostFrameCallback((_) {
      detailClosingCustomerController.getClosingCustomerData(closingCustomerController.selectedCustomerId.value!);
    });
    return Scaffold(
      backgroundColor: ColorConstant.whiteColor,
      appBar: AppbarGlobalWidget(
        title: "Detail Customer Closing",
        implyLeading: true,
        action: Icon(
          LineIcons.mapMarker,
          color: ColorConstant.neutralColor900,
        ),
        tooltip: "Update Status Phase",
        onPressedAction: () => detailClosingCustomerController.moveToUpdateStatusPhaseScreen(detailClosingCustomerController.detailClosingCustomer.value!.phaseStatus),
      ),
      body: Obx(
        () {
          if (detailClosingCustomerController.isLoadingGetClosingCustomer.value) {
            return const Center(
              child: LoadingAnimationGlobalWidget(),
            );
          } else if (detailClosingCustomerController.detailClosingCustomer.value == null) {
            return Center(
              child: EmptyStateGlobalWidget(
                additionalSpacing: SpacingConstant.verticalSpacing80px,
              ),
            );
          } else {
            return SingleChildScrollView(
              child: Column(
                children: [
                  SpacingConstant.verticalSpacing12px,
                  const StatusDetailClosingCustomerWidget(),
                  SpacingConstant.verticalSpacing12px,
                  const PersonalDetailClosingCustomerWidget(),
                  SpacingConstant.verticalSpacing6px,
                  const AddressDetailClosingCustomerWidget(),
                  SpacingConstant.verticalSpacing6px,
                  const SubscriptionDetailClosingCustomerWidget(),
                  SpacingConstant.verticalSpacing6px,
                  const TechnicalDetailClosingCustomerWidget(),
                  SpacingConstant.verticalSpacing6px,
                  const DocumentationDetailClosingCustomerWidget(),
                  SpacingConstant.verticalSpacing12px,
                ],
              ),
            );
          }
        },
      ),
    );
  }
}