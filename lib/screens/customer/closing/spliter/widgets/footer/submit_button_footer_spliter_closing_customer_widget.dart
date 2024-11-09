import 'package:dasarata_mobile/controllers/spliter_closing_customer_controller.dart';
import 'package:dasarata_mobile/widgets/button_global_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SubmitButtonFooterSpliterClosingCustomerWidget extends StatelessWidget {
  const SubmitButtonFooterSpliterClosingCustomerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final SpliterClosingCustomerController spliterClosingCustomerController = Get.find();
    return Obx(
      () {
        return ButtonGlobalWidget(
          isLoading: false,
          isDisabled: spliterClosingCustomerController.selectedSpliter.value == null,
          label: "Submit",
          onTap: () {},
        );
      },
    );
  }
}
