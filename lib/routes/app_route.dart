import 'package:dasarata_mobile/screens/login/login_screen.dart';
import 'package:dasarata_mobile/screens/main_screen.dart';
import 'package:dasarata_mobile/screens/splash/splash_screen.dart';
import 'package:get/get.dart';

class AppRoute {
  static const String home = "/";
  static const String splash = "/splash";
  static const String login = "/login";

  static final routes = [
    GetPage(name: home, page: () => const MainScreen()),
    GetPage(name: splash, page: () => const SplashScreen()),
    GetPage(name: login, page: () => const LoginScreen()),
  ];
}
