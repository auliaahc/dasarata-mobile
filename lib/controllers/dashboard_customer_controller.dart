import 'package:dasarata_mobile/controllers/closing_customer_controller.dart';
import 'package:dasarata_mobile/controllers/prospect_customer_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardCustomerController extends GetxController {
  final ClosingCustomerController closingCustomerController = Get.put(ClosingCustomerController());
  final ProspectCustomerController prospectCustomerController = Get.put(ProspectCustomerController());
  final TextEditingController searchCustomerController = TextEditingController();
  RxString searchCustomerQuery = RxString("");
  RxInt selectedCustomerTabIndex = RxInt(0);

  void setCustomerTabIndex(int index) {
    if (selectedCustomerTabIndex.value != index) {
      Future.delayed(
        const Duration(milliseconds: 100),
        () {
          searchCustomerController.clear();
          searchCustomerQuery.value = "";
        },
      );
    }
    selectedCustomerTabIndex.value = index;
  }

  void resetCustomerTabIndex() {
    searchCustomerController.clear();
    searchCustomerQuery.value = "";
    selectedCustomerTabIndex.value = 0;
  }

  void onClearSearchCustomer() {
    searchCustomerController.clear();
    searchCustomerQuery.value = "";
    if (selectedCustomerTabIndex.value == 0) {
      prospectCustomerController.resetDashboardProspectCustomer();
    } else {
      closingCustomerController.resetDashboardClosingCustomer();
    }
  }
}
