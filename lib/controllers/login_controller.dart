import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:dasarata_mobile/controllers/main_controller.dart';
import 'package:dasarata_mobile/models/login/request_login_model.dart';
import 'package:dasarata_mobile/models/login/response_login_model.dart';
import 'package:dasarata_mobile/config/app_route.dart';
import 'package:dasarata_mobile/services/authentication_service.dart';
import 'package:dasarata_mobile/utilities/snackbar_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final MainController mainController = Get.find();
  final loginFormKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final authenticationService = AuthenticationService();
  RxBool isObscurePassword = RxBool(true);
  RxBool isLoadingLogin = RxBool(false);
  RxnString email = RxnString();
  RxnString password = RxnString();

  void resetFormFields() {
    isObscurePassword.value = true;
    emailController.clear();
    passwordController.clear();
    email.value = null;
    password.value = null;
  }

  void resetPasswordField() {
    isObscurePassword.value = true;
    passwordController.clear();
    password.value = null;
  }

  Future<void> login() async {
    isLoadingLogin.value = true;
    if (loginFormKey.currentState!.validate()) {
      loginFormKey.currentState!.save();
      try {
        final response = await authenticationService.loginWithEmail(
          RequestLoginModel(
            email: email.value!,
            password: password.value!,
          ),
        );
        SnackbarUtils.show(
          messageText: response.message,
          type: AnimatedSnackBarType.success,
        );
        mainController.selectedIndex.value = 0;
        await Get.offNamed(AppRoute.home);
        resetFormFields();
      } catch (e) {
        if (e is ResponseLoginModel) {
          resetPasswordField();
          SnackbarUtils.show(
            messageText: e.message,
            type: AnimatedSnackBarType.error,
          );
        }
      }
    }
    isLoadingLogin.value = false;
  }
}
