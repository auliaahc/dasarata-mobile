import 'package:dasarata_mobile/constants/logger_constant.dart';
import 'package:dasarata_mobile/routes/app_route.dart';
import 'package:dasarata_mobile/utilities/shared_pref.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  RxInt selectedIndex = RxInt(0);

  @override
  void onReady() {
    super.onReady();
    checkToken();
  }

  void onTabChange(int index) {
    selectedIndex.value = index;
    LoggerConstant.info(index.toString());
  }

  void checkToken() async {
    final token = await SharedPref.getToken();
    Future.delayed(
      const Duration(seconds: 3),
      () {
        if (token != null) {
          Get.offNamed(AppRoute.home);
        } else {
          // TODO
          // Get.offNamed(AppRoute.login);
        }
      },
    );
  }

  void logout() {
    SharedPref.removeToken();
    Get.deleteAll();
    Get.offAllNamed(AppRoute.splash);
  }
}
