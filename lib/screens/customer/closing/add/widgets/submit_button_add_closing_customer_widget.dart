import 'package:dasarata_mobile/controllers/add_closing_customer_controller.dart';
import 'package:dasarata_mobile/widgets/button_global_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SubmitButtonAddClosingCustomerWidget extends StatelessWidget {
  const SubmitButtonAddClosingCustomerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final AddClosingCustomerController addClosingCustomerController = Get.find();
    return Positioned(
      left: 0,
      right: 0,
      bottom: 32,
      child: ButtonGlobalWidget(
        isLoading: false,
        isDisabled: false,
        label: "Submit",
        onTap: addClosingCustomerController.submitAddClosingCustomer,
      ),
    );
  }
}
