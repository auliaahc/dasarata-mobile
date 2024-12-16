import 'package:dasarata_mobile/controllers/spliter_closing_customer_controller.dart';
import 'package:dasarata_mobile/widgets/type_maps_toggle_global_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TypeToggleHeaderSpliterClosingCustomerWidget extends StatelessWidget {
  const TypeToggleHeaderSpliterClosingCustomerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final SpliterClosingCustomerController spliterClosingCustomerController =
        Get.find();
    return Obx(
      () {
        return TypeMapsToggleGlobalWidget(
          onToggle: (index) =>
              spliterClosingCustomerController.changeMapType(index!),
          index: spliterClosingCustomerController.selectedMapTypeIndex.value,
        );
      },
    );
  }
}
