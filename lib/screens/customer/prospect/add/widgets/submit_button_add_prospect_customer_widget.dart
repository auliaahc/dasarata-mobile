import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dasarata_mobile/controllers/add_prospect_customer_controller.dart';
import 'package:dasarata_mobile/widgets/button_global_widget.dart';

class SubmitButtonAddProspectCustomerWidget extends StatelessWidget {
  const SubmitButtonAddProspectCustomerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final AddProspectCustomerController addProspectCustomerController = Get.find();
    return Positioned(
      left: 0,
      right: 0,
      bottom: 32,
      child: Obx(
        () {
          final isDisabled = !addProspectCustomerController.isFormAddProspectCustomerValid.value || addProspectCustomerController.isLoadingAddProspectCustomer.value || addProspectCustomerController.salesNip.value == null;
          return ButtonGlobalWidget(
            isLoading: addProspectCustomerController.isLoadingAddProspectCustomer.value,
            isDisabled: isDisabled,
            label: "Submit",
            onTap: addProspectCustomerController.onSubmitFormAddProspectCustomer,
          );
        },
      ),
    );
  }
}
