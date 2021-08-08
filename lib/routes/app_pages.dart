import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yes_premium/modules/announcement/announcement_view.dart';
import 'package:yes_premium/modules/bottomnav/bottomnav_view.dart';
import 'package:yes_premium/modules/educatorlist/educatorlist_view.dart';
import 'package:yes_premium/modules/home/home_view.dart';
import 'package:yes_premium/modules/login/login_view.dart';
import 'package:yes_premium/modules/profile/profile_view.dart';
import 'package:yes_premium/modules/search/search_view.dart';
import 'package:yes_premium/modules/splashscreen/logout_loading.dart';
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
    GetPage(
      name: AppRoutes.LOGIN,
      page: () => LoginView(),
    ),
    GetPage(
      name: AppRoutes.LOGOUTLOADING,
      page: () => LoadingLogout(),
      transition: Transition.downToUp,
      curve: Curves.linearToEaseOut,
    ),
    GetPage(
      name: AppRoutes.SEARCH,
      page: () => SearchView(),
      transition: Transition.rightToLeft,
      curve: Curves.linearToEaseOut,
    ),
    GetPage(
      name: AppRoutes.ANNOUNCEMENT,
      page: () => AnnouncementView(),
      transition: Transition.downToUp,
      curve: Curves.linearToEaseOut,
    ),
    GetPage(
      name: AppRoutes.PROFILE,
      page: () => ProfileView(),
      transition: Transition.leftToRight,
      curve: Curves.linearToEaseOut,
    ),
    GetPage(
      name: AppRoutes.EDUCATORLIST,
      page: () => EducatorListView(),
      transition: Transition.downToUp,
      curve: Curves.linearToEaseOut,
    ),
  ];
}
