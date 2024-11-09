import 'package:dasarata_mobile/constants/color_constant.dart';
import 'package:dasarata_mobile/constants/spacing_constant.dart';
import 'package:dasarata_mobile/controllers/login_controller.dart';
import 'package:dasarata_mobile/screens/login/widgets/animation_login_widget.dart';
import 'package:dasarata_mobile/screens/login/widgets/submit_button_login_widget.dart';
import 'package:dasarata_mobile/screens/login/widgets/form_login_widget.dart';
import 'package:dasarata_mobile/screens/login/widgets/greeting_login_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LoginController());
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: ColorConstant.whiteColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 16,
              right: 16,
              bottom: 32,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SpacingConstant.verticalSpacing32px,
                const AnimationLoginWidget(),
                SpacingConstant.verticalSpacing40px,
                const GreetingLoginWidget(),
                SpacingConstant.verticalSpacing24px,
                const FormLoginWidget(),
                SpacingConstant.verticalSpacing24px,
                const SubmitButtonLoginWidget()
              ],
            ),
          ),
        ),
      ),
    );
  }
}