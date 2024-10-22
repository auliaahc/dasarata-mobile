import 'package:dasarata_mobile/controllers/login_controller.dart';
import 'package:dasarata_mobile/widgets/button_global_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ButtonLoginWidget extends StatelessWidget {
  const ButtonLoginWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginController loginController = Get.find();
    return ButtonGlobalWidget(
      isDisabled: false,
      label: "Login",
      onTap: () => loginController.login(),
    );
  }
}
