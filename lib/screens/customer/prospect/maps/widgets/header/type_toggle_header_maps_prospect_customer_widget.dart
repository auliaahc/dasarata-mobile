import 'package:dasarata_mobile/controllers/prospect_customer_controller.dart';
import 'package:dasarata_mobile/widgets/type_maps_toggle_global_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TypeToggleHeaderMapsProspectCustomerWidget extends StatelessWidget {
  const TypeToggleHeaderMapsProspectCustomerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    ProspectCustomerController prospectCustomerController = Get.find();
    return TypeMapsToggleGlobalWidget(
        onToggle: (index) => prospectCustomerController.changeMapType(index!),
        index: prospectCustomerController.selectedMapTypeIndex.value);
  }
}
