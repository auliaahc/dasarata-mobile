import "package:dasarata_mobile/config/app_theme.dart";
import "package:dasarata_mobile/config/app_route.dart";
import "package:dasarata_mobile/utilities/system_ui_overlay_utils.dart";
import "package:device_preview_minus/device_preview_minus.dart";
import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:flutter_localizations/flutter_localizations.dart";

void main() async {
  SystemUiOverlayUtils.setSystemUiOverlay();
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: AppTheme.appTheme,
      debugShowCheckedModeBanner: false,
      getPages: AppRoute.routes,
      initialRoute: AppRoute.splash,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
      ],
    );
  }
}
