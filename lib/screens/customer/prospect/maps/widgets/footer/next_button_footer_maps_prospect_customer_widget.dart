import 'package:dasarata_mobile/controllers/add_prospect_customer_controller.dart';
import 'package:dasarata_mobile/controllers/maps_prospect_customer_controller.dart';
import 'package:dasarata_mobile/widgets/button_global_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NextButtonFooterMapsProspectCustomerWidget extends StatelessWidget {
  const NextButtonFooterMapsProspectCustomerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final MapsProspectCustomerController mapsProspectCustomerController = Get.find();
    final AddProspectCustomerController addProspectCustomerController = Get.find();
    return Obx(
      () {
        bool isLoading = mapsProspectCustomerController.isLoadingGetAddress.value || mapsProspectCustomerController.currentLatLng.value == null;
        bool isDisabled = mapsProspectCustomerController.isLoadingGetAddress.value || mapsProspectCustomerController.currentLatLng.value == null;
        return ButtonGlobalWidget(
          isLoading: isLoading,
          isDisabled: isDisabled,
          label: "Selanjutnya",
          onTap: () {
            addProspectCustomerController.address.text = mapsProspectCustomerController.currentAddress.value!;
            Get.back();
          },
        );
      },
    );
  }
}
