import 'package:dasarata_mobile/controllers/prospect_customer_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapsProspectCustomerWidget extends StatelessWidget {
  const MapsProspectCustomerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final ProspectCustomerController prospectCustomerController = Get.find();
    return Obx(
      () {
        return GoogleMap(
          initialCameraPosition: prospectCustomerController.cameraPosition.value,
          mapType: prospectCustomerController.selectedMapType.value,
          compassEnabled: false,
          zoomControlsEnabled: false,
          myLocationEnabled: true,
          myLocationButtonEnabled: true,
        );
      },
    );
  }
}
