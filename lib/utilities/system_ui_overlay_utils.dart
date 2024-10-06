import 'package:dasarata_mobile/constants/color_constant.dart';
import 'package:flutter/services.dart';

class SystemUiOverlayUtils {
  static void setSystemUiOverlay() {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: ColorConstant.whiteColor,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
  }
}
