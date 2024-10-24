import 'package:dasarata_mobile/controllers/login_controller.dart';
import 'package:dasarata_mobile/utilities/validator_input_utils.dart';
import 'package:dasarata_mobile/widgets/text_field_global_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';

class EmailFieldLoginWidget extends StatelessWidget {
  const EmailFieldLoginWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginController loginController = Get.find();
    return TextFieldGlobalWidget(
      onSaved: (value) => loginController.email.value = value,
      controller: loginController.emailController,
      icon: LineIcons.user,
      hint: "Email",
      validator: (value) => ValidatorInputUtils(
        name: "Email",
        value: value,
        validationType: ValidationType.email,
      ).validate(),
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.emailAddress,
      maxLines: 1,
    );
  }
}
