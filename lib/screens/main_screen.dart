import 'package:dasarata_mobile/controllers/main_controller.dart';
import 'package:dasarata_mobile/screens/home/home_screen.dart';
import 'package:dasarata_mobile/widgets/bottom_navbar_global_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final MainController mainController = Get.put(MainController());
    return Scaffold(
      body: Obx(() {
        switch (mainController.selectedIndex.value) {
          default: return const HomeScreen();
        }
      }),
      bottomNavigationBar: BottomNavbarGlobalWidget(
        selectedIndex: mainController.selectedIndex.value,
        onTabChange: (index) => mainController.onTabChange(index),
      ),
    );
  }
}
