import "package:dasarata_mobile/constants/app_theme_constant.dart";
import "package:dasarata_mobile/env/env.dart";
import "package:dasarata_mobile/screens/home/home_screen.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:supabase_flutter/supabase_flutter.dart";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(url: Env.supabaseUrl, anonKey: Env.supabaseKey);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: AppThemeConstant.appTheme,
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}
