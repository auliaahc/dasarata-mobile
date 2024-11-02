import 'package:dasarata_mobile/screens/customer/dashboard/dashboard_customer_screen.dart';
import 'package:dasarata_mobile/screens/customer/prospect/add/add_prospect_customer_screen.dart';
import 'package:dasarata_mobile/screens/customer/prospect/maps/maps_prospect_customer_screen.dart';
import 'package:dasarata_mobile/screens/login/login_screen.dart';
import 'package:dasarata_mobile/screens/main_screen.dart';
import 'package:dasarata_mobile/screens/profile/profile_screen.dart';
import 'package:dasarata_mobile/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppRoute {
  static const String home = "/";
  static const String splash = "/splash";
  static const String login = "/login";
  static const String customer = "/customer";
  static const String addProspectCustomer = "$customer/prospect/add";
  static const String prospectMaps = "$customer/prospect/add/maps";
  static const String profile = "/profile";

  static final routes = [
    GetPage(name: home, page: () => const MainScreen()),
    GetPage(name: splash, page: () => const SplashScreen()),
    GetPage(name: login, page: () => const LoginScreen()),
    GetPage(name: customer, page: () => const DashboardCustomerScreen()),
    GetPage(
      name: addProspectCustomer,
      page: () => const AddProspectCustomerScreen(),
      transition: Transition.downToUp,
      transitionDuration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    ),
    GetPage(name: prospectMaps, page: () => const MapsProspectCustomerScreen()),
    GetPage(name: profile, page: () => const ProfileScreen()),
  ];
}
