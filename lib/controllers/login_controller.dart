import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:dasarata_mobile/models/login/request_login_model.dart';
import 'package:dasarata_mobile/models/login/response_login_model.dart';
import 'package:dasarata_mobile/routes/app_route.dart';
import 'package:dasarata_mobile/services/login_service.dart';
import 'package:dasarata_mobile/utilities/snackbar_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final loginService = LoginService();
  RxBool isObscurePassword = RxBool(true);
  RxnBool isLoadingLogin = RxnBool();
  RxnString email = RxnString();
  RxnString password = RxnString();

  Future<void> login() async {
    isLoadingLogin.value = true;
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      try {
        final response = await loginService.loginWithEmail(
          RequestLoginModel(
            email: email.value!,
            password: password.value!,
          ),
        );
        if (response.success) {
          Get.offNamed(AppRoute.home);
        } else {
          SnackbarUtils.show(
            messageText: response.message,
            type: AnimatedSnackBarType.error,
          );
        }
      } catch (e) {
        if (e is ResponseLoginModel) {
          SnackbarUtils.show(
            messageText: e.message,
            type: AnimatedSnackBarType.error,
          );
        }
      } finally {
        isLoadingLogin.value = false;
      }
    }
  }
}
