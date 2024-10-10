import 'package:dasarata_mobile/constants/logger_constant.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  RxInt selectedIndex = RxInt(0);

  void onTabChange(int index) {
    selectedIndex.value = index;
    LoggerConstant.info(index.toString());
  }
}
