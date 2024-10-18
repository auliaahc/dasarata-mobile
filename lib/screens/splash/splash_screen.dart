import 'package:dasarata_mobile/constants/color_constant.dart';
import 'package:dasarata_mobile/constants/image_constant.dart';
import 'package:dasarata_mobile/controllers/main_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MainController());
    return Scaffold(
      backgroundColor: ColorConstant.whiteColor,
      body: Center(
        child: Image.asset(
          ImageConstant.dasarata,
          width: 250,
        ),
      ),
    );
  }
}
