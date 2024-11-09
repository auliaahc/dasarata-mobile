import 'package:dasarata_mobile/controllers/home_point_closing_customer_controller.dart';
import 'package:dasarata_mobile/widgets/type_maps_toggle_global_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TypeToggleHeaderHomePointClosingCustomerWidget extends StatelessWidget {
  const TypeToggleHeaderHomePointClosingCustomerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final HomePointClosingCustomerController homePointClosingCustomerController = Get.find();
    return TypeMapsToggleGlobalWidget(
      onToggle: (index) => homePointClosingCustomerController.changeMapType(index!),
      index: homePointClosingCustomerController.selectedMapTypeIndex.value,
    );
  }
}
