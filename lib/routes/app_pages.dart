import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yes_premium/modules/adduser/adduser_view.dart';
import 'package:yes_premium/modules/announcement/announcement_view.dart';
import 'package:yes_premium/modules/bottomnav/bottomnav_binding.dart';
import 'package:yes_premium/modules/bottomnav/bottomnav_view.dart';
import 'package:yes_premium/modules/editschool/editschool_view.dart';
import 'package:yes_premium/modules/educatorlist/educatorlist_view.dart';
import 'package:yes_premium/modules/filesadd/filesadd_view.dart';
import 'package:yes_premium/modules/filesshare/filesshare_view.dart';
import 'package:yes_premium/modules/meeting/facultymeeting_view.dart';
// import 'package:yes_premium/modules/home/home_view.dart';
import 'package:yes_premium/modules/login/login_view.dart';
import 'package:yes_premium/modules/profile/profile_view.dart';
import 'package:yes_premium/modules/search/search_view.dart';
import 'package:yes_premium/modules/splashscreen/logout_loading.dart';
import 'package:yes_premium/modules/splashscreen/splashscreen_view.dart';
import 'package:yes_premium/modules/studentlist/studentlist_view.dart';
import 'package:yes_premium/modules/userprofile/userprofile_view.dart';
import 'package:yes_premium/modules/videolab/videolabadd_view.dart';
import 'package:yes_premium/routes/app_routes.dart';

class AppPages {
  static var list = [
    GetPage(
      name: AppRoutes.SPLASHSCREEN,
      page: () => SplashScreenView(),
    ),
    // GetPage(
    //   name: AppRoutes.HOME,
    //   page: () => HomeView(),
    //   transition: Transition.rightToLeft,
    //   curve: Curves.linearToEaseOut,
    // ),
    GetPage(
      name: AppRoutes.BOTTOMNAV,
      page: () => BottomNavView(),
      binding: BottomNavBinding(),
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
    GetPage(
      name: AppRoutes.STUDENTLIST,
      page: () => StudentListView(),
      transition: Transition.downToUp,
      curve: Curves.linearToEaseOut,
    ),
    GetPage(
      name: AppRoutes.FACULTYMEETING,
      page: () => FacultyMeetingView(),
      transition: Transition.downToUp,
      curve: Curves.linearToEaseOut,
    ),
    GetPage(
      name: AppRoutes.VIDEOLABADD,
      page: () => VideoLabAddView(),
      transition: Transition.downToUp,
      curve: Curves.linearToEaseOut,
    ),
    GetPage(
      name: AppRoutes.FILESADD,
      page: () => FilesAddView(),
      transition: Transition.downToUp,
      curve: Curves.linearToEaseOut,
    ),
    GetPage(
      name: AppRoutes.FILESSHARE,
      page: () => FilesShareView(),
      transition: Transition.downToUp,
      curve: Curves.linearToEaseOut,
    ),
    GetPage(
      name: AppRoutes.EDITSCHOOL,
      page: () => EditSchoolView(),
      transition: Transition.downToUp,
      curve: Curves.linearToEaseOut,
    ),
    GetPage(
      name: AppRoutes.USERPROFILE,
      page: () => UserProfileView(),
      transition: Transition.downToUp,
      curve: Curves.linearToEaseOut,
    ),
    GetPage(
      name: AppRoutes.ADDUSER,
      page: () => AddUserView(),
      transition: Transition.downToUp,
      curve: Curves.linearToEaseOut,
    ),
  ];
}
