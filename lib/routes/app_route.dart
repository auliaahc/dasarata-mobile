import 'package:dasarata_mobile/screens/customer/closing/add/add_closing_customer_screen.dart';
import 'package:dasarata_mobile/screens/customer/closing/detail/detail_closing_customer_screen.dart';
import 'package:dasarata_mobile/screens/customer/closing/route/route_closing_customer_screen.dart';
import 'package:dasarata_mobile/screens/customer/closing/spliter/spliter_closing_customer_screen.dart';
import 'package:dasarata_mobile/screens/customer/closing/survey/survey_closing_customer_screen.dart';
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
  static const String detailClosingCustomer = "$customer/closing/detail";
  static const String surveyClosingCustomer = "$customer/closing/survey";
  static const String spliterClosingCustomer = "$customer/closing/spliter";
  static const String routeClosingCustomer = "$customer/closing/route";
  static const String addClosingCustomer = "$customer/closing/add";

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
    GetPage(name: detailClosingCustomer, page: () => const DetailClosingCustomerScreen()),
    GetPage(name: surveyClosingCustomer, page: () => const SurveyClosingCustomerScreen()),
    GetPage(name: spliterClosingCustomer, page: () => const SpliterClosingCustomerScreen()),
    GetPage(name: routeClosingCustomer, page: () => const RouteClosingCustomerScreen()),
    GetPage(name: addClosingCustomer, page: () => const AddClosingCustomerScreen()),
  ];
}
