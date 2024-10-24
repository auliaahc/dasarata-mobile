import 'package:dasarata_mobile/controllers/login_controller.dart';
import 'package:dasarata_mobile/utilities/validator_input_utils.dart';
import 'package:dasarata_mobile/widgets/text_field_global_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';

class PasswordFieldLoginWidget extends StatelessWidget {
  const PasswordFieldLoginWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginController loginController = Get.find();
    return Obx(() {
      return TextFieldGlobalWidget(
        onSaved: (value) => loginController.password.value = value,
        controller: loginController.passwordController,
        icon: LineIcons.key,
        hint: "Password",
        isPassword: true,
        obscureText: loginController.isObscurePassword.value,
        suffixIcon: IconButton(
          onPressed: () {
            bool currentValue = loginController.isObscurePassword.value;
            loginController.isObscurePassword.value = !currentValue;
          },
          icon: loginController.isObscurePassword.value
              ? const Icon(LineIcons.eyeSlash, size: 20)
              : const Icon(LineIcons.eye, size: 20),
        ),
        validator: (value) => ValidatorInputUtils(
          name: "Password",
          value: value,
        ).validate(),
        textInputAction: TextInputAction.done,
        keyboardType: TextInputType.visiblePassword,
        maxLines: 1,
      );
    });
  }
}
