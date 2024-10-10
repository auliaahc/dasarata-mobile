import 'package:dasarata_mobile/constants/spacing_constant.dart';
import 'package:dasarata_mobile/controllers/login_controller.dart';
import 'package:dasarata_mobile/screens/login/widgets/nip_field_login_widget.dart';
import 'package:dasarata_mobile/screens/login/widgets/password_field_login_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FormLoginWidget extends StatelessWidget {
  const FormLoginWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginController loginControler = Get.find();
    return Form(
      key: loginControler.formKey,
      child: Column(
        children: [
          const NipFieldLoginWidget(),
          SpacingConstant.verticalSpacing12px,
          const PasswordFieldLoginWidget(),
        ],
      ),
    );
  }
}
