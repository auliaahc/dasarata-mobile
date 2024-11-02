import 'package:dasarata_mobile/controllers/prospect_customer_controller.dart';
import 'package:dasarata_mobile/widgets/button_global_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NextButtonFooterMapsProspectCustomerWidget extends StatelessWidget {
  const NextButtonFooterMapsProspectCustomerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final ProspectCustomerController prospectCustomerController = Get.find();
    return Obx(
      () {
        return ButtonGlobalWidget(
          isLoading: prospectCustomerController.isLoadingGetAddress.value || prospectCustomerController.currentLatLng.value == null,
          isDisabled: prospectCustomerController.isLoadingGetAddress.value || prospectCustomerController.currentLatLng.value == null,
          label: "Selanjutnya",
          onTap: () => prospectCustomerController.onSubmitMaps(),
        );
      },
    );
  }
}
