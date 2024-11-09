import 'package:dasarata_mobile/controllers/login_controller.dart';
import 'package:dasarata_mobile/widgets/button_global_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SubmitButtonLoginWidget extends StatelessWidget {
  const SubmitButtonLoginWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginController loginController = Get.find();
    return Obx(
      () {
        return ButtonGlobalWidget(
          isLoading: loginController.isLoadingLogin.value,
          isDisabled: loginController.isLoadingLogin.value,
          label: "Login",
          onTap: loginController.login,
        );
      },
    );
  }
}
