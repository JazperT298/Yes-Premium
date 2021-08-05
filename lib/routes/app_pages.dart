import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yes_premium/modules/bottomnav/bottomnav_view.dart';
import 'package:yes_premium/modules/home/home_view.dart';
import 'package:yes_premium/modules/splashscreen/splashscreen_view.dart';
import 'package:yes_premium/routes/app_routes.dart';

class AppPages {
  static var list = [
    GetPage(
      name: AppRoutes.SPLASHSCREEN,
      page: () => SplashScreenView(),
    ),
    GetPage(
      name: AppRoutes.HOME,
      page: () => HomeView(),
      transition: Transition.rightToLeft,
      curve: Curves.linearToEaseOut,
    ),
    GetPage(
      name: AppRoutes.BOTTOMNAV,
      page: () => BottomNavView(),
      // transition: Transition.rightToLeft,
      // curve: Curves.linearToEaseOut,
    ),
  ];
}
