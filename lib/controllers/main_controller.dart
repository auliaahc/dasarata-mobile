import 'package:dasarata_mobile/config/app_route.dart';
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
  }

  void checkToken() async {
    final token = await SharedPref.getToken();
    Future.delayed(
      const Duration(seconds: 3),
      () {
        if (token != null) {
          Get.offNamed(AppRoute.home);
        } else {
          Get.offNamed(AppRoute.login);
        }
      },
    );
  }
}
