import 'package:dasarata_mobile/controllers/route_closing_customer_controller.dart';
import 'package:dasarata_mobile/widgets/type_maps_toggle_global_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TypeToggleHeaderRouteClosingCustomerWidget extends StatelessWidget {
  const TypeToggleHeaderRouteClosingCustomerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final RouteClosingCustomerController routeClosingCustomerController =
        Get.find();
    return Obx(
      () {
        return TypeMapsToggleGlobalWidget(
          onToggle: (index) =>
              routeClosingCustomerController.changeMapType(index!),
          index: routeClosingCustomerController.selectedMapTypeIndex.value,
        );
      },
    );
  }
}
