import 'package:dasarata_mobile/controllers/login_controller.dart';
import 'package:dasarata_mobile/utilities/validator_input_utils.dart';
import 'package:dasarata_mobile/widgets/text_field_global_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_icons/line_icons.dart';

class NipFieldLoginWidget extends StatelessWidget {
  const NipFieldLoginWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginController loginController = Get.find();
    return TextFieldGlobalWidget(
      controller: loginController.nipController,
      icon: LineIcons.user,
      hint: "NIP",
      validator: (value) => ValidatorInputUtils(name: "NIP", value: value).validate(), 
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.number,
    );
  }
}
