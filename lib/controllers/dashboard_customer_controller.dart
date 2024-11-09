import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardCustomerController extends GetxController {
  final TextEditingController searchCustomerController = TextEditingController();
  RxInt selectedCustomerTabIndex = RxInt(0);

  void setCustomerTabIndex(int index) {
    if (selectedCustomerTabIndex.value != index) {
      Future.delayed(
        const Duration(milliseconds: 100),
        () {
          searchCustomerController.clear();
        },
      );
    }
    selectedCustomerTabIndex.value = index;
  }

  void resetCustomerTabIndex() {
    searchCustomerController.clear();
    selectedCustomerTabIndex.value = 0;
  }
}
