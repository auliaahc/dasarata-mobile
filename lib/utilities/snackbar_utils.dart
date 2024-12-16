import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:get/get.dart';

class SnackbarUtils {
  static void show(
      {required String messageText, required AnimatedSnackBarType type}) {
    AnimatedSnackBar.material(
      messageText,
      type: type,
      duration: const Duration(seconds: 3),
      mobileSnackBarPosition: MobileSnackBarPosition.top,
    ).show(Get.context!);
  }
}
