import 'package:dasarata_mobile/controllers/spliter_closing_customer_controller.dart';
import 'package:dasarata_mobile/widgets/button_global_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SubmitButtonFooterSpliterClosingCustomerWidget extends StatelessWidget {
  const SubmitButtonFooterSpliterClosingCustomerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final SpliterClosingCustomerController spliterClosingCustomerController =
        Get.find();
    return Obx(
      () {
        final bool isDisabled = spliterClosingCustomerController
                .isLoadingGetClosingCustomerData.value ||
            spliterClosingCustomerController.isLoadingGetSplitersData.value ||
            spliterClosingCustomerController.isLoadingUpdateSpliterData.value ||
            spliterClosingCustomerController.selectedSpliter.value == null;
        return ButtonGlobalWidget(
          isLoading:
              spliterClosingCustomerController.isLoadingUpdateSpliterData.value,
          isDisabled: isDisabled,
          label: "Submit",
          onTap: spliterClosingCustomerController.updateSpliterData,
        );
      },
    );
  }
}
