import 'package:dasarata_mobile/controllers/route_closing_customer_controller.dart';
import 'package:dasarata_mobile/widgets/button_global_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SubmitButtonFooterRouteClosingCustomerWidget extends StatelessWidget {
  const SubmitButtonFooterRouteClosingCustomerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    RouteClosingCustomerController routeClosingCustomerController = Get.find();
    return Obx(
      () {
        final isDisabled = routeClosingCustomerController
                .isLoadingGetClosingCustomerData.value ||
            routeClosingCustomerController.isLoadingUpdateRouteData.value ||
            routeClosingCustomerController.distance.value == 0;
        return ButtonGlobalWidget(
          isLoading:
              routeClosingCustomerController.isLoadingUpdateRouteData.value,
          isDisabled: isDisabled,
          label: "Submit",
          onTap: routeClosingCustomerController.updateRouteData,
        );
      },
    );
  }
}
