import 'package:dasarata_mobile/controllers/closing_customer_controller.dart';
import 'package:dasarata_mobile/controllers/home_point_closing_customer_controller.dart';
import 'package:dasarata_mobile/widgets/button_global_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SubmitButtonFooterHomePointClosingCustomerWidget extends StatelessWidget {
  const SubmitButtonFooterHomePointClosingCustomerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final HomePointClosingCustomerController homePointClosingCustomerController = Get.find();
    final ClosingCustomerController closingCustomerController = Get.find();
    return Obx(
      () {
        final bool isEnabled = homePointClosingCustomerController.isLoadingGetCurrentLocation.value || homePointClosingCustomerController.isLoadingGetClosingCustomer.value || homePointClosingCustomerController.isLoadingUpdateSurveyData.value;
        return ButtonGlobalWidget(
          isLoading: isEnabled,
          isDisabled: isEnabled,
          label: "Submit",
          onTap: () => homePointClosingCustomerController.updateSurveyData(closingCustomerController.detailClosingCustomer.value!.id),
        );
      },
    );
  }
}
