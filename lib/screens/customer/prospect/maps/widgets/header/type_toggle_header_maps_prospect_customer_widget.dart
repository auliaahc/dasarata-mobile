import 'package:dasarata_mobile/controllers/maps_prospect_customer_controller.dart';
import 'package:dasarata_mobile/widgets/type_maps_toggle_global_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TypeToggleHeaderMapsProspectCustomerWidget extends StatelessWidget {
  const TypeToggleHeaderMapsProspectCustomerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    MapsProspectCustomerController mapsProspectCustomerController = Get.find();
    return TypeMapsToggleGlobalWidget(
      onToggle: (index) => mapsProspectCustomerController.changeMapType(index!),
      index: mapsProspectCustomerController.selectedMapTypeIndex.value,
    );
  }
}
