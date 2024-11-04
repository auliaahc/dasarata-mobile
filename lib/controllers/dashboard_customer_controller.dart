import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardCustomerController extends GetxController {
  final TextEditingController searchController = TextEditingController();
  RxInt selectedCustomerTabIndex = RxInt(0);

  void setCustomerTabIndex(int index) {
    if (selectedCustomerTabIndex.value != index) {
      Future.delayed(
        const Duration(milliseconds: 100),
        () {
          searchController.clear();
        },
      );
    }
    selectedCustomerTabIndex.value = index;
  }

  void resetCustomerTabIndex() {
    searchController.clear();
    selectedCustomerTabIndex.value = 0;
  }
}
