import 'package:dasarata_mobile/constants/logger_constant.dart';
import 'package:dasarata_mobile/routes/app_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final TextEditingController nipController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  RxBool isObscurePassword = RxBool(true);

  @override
  void onInit() {
    checkToken();
    super.onInit();
  }

  void checkToken() async {
    Future.delayed(
      const Duration(seconds: 5),
      () => Get.offNamed(AppRoute.login),
    );
  }

  void login() {
    if (formKey.currentState!.validate()) {
      LoggerConstant.info("NIP: ${nipController.text}; Password: ${passwordController.text}");
      Get.offNamed(AppRoute.home);
    } else {
      LoggerConstant.error("Mampus error");
    }
  }
}