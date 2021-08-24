import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:yes_premium/colors.dart';
import 'package:yes_premium/modules/announcement/announcement_controller.dart';
import 'package:yes_premium/modules/bottomnav/bottomnav_controller.dart';
import 'package:yes_premium/modules/files/files_controller.dart';
import 'package:yes_premium/modules/studentlist/studentlist_controller.dart';
import 'package:yes_premium/modules/videolab/videolab_controller.dart';
import 'package:yes_premium/routes/app_routes.dart';
import 'package:yes_premium/services/get_storage_service.dart';

class Dialogs {
  static void showMyToast(context, String message) {
    final theme = Theme.of(context);
    showToast(
      message,
      context: context,
      animation: StyledToastAnimation.scale,
      reverseAnimation: StyledToastAnimation.fade,
      position: StyledToastPosition(align: Alignment.bottomCenter, offset: 225),
      animDuration: Duration(seconds: 1),
      duration: Duration(seconds: 3),
      curve: Curves.elasticOut,
      reverseCurve: Curves.linear,
      backgroundColor: newmainColor,
      textStyle: TextStyle(
        fontFamily: theme.textTheme.headline3!.fontFamily,
        color: Colors.white,
        fontSize: 12.sp,
      ),
    );
  }

  static void showMyToast2(message) {
    final theme = Theme.of(Get.context!);
    showToast(
      message,
      animation: StyledToastAnimation.scale,
      reverseAnimation: StyledToastAnimation.fade,
      position: StyledToastPosition(align: Alignment.bottomCenter, offset: 225),
      animDuration: Duration(seconds: 1),
      duration: Duration(seconds: 3),
      curve: Curves.elasticOut,
      reverseCurve: Curves.linear,
      backgroundColor: newmainColor,
      textStyle: TextStyle(
        fontFamily: theme.textTheme.headline3!.fontFamily,
        color: Colors.white,
        fontSize: 12.sp,
      ),
    );
  }

  static Future<bool> onBackPressedExit(context) {
    final theme = Theme.of(context);
    final platform = Theme.of(context).platform;
    return Get.dialog(
      platform == TargetPlatform.android
          ? AlertDialog(
              title: Text(
                'Exit App',
                style: TextStyle(
                  fontFamily: theme.textTheme.headline3!.fontFamily,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              content: Text(
                'Are you sure you want to exit?',
                style: TextStyle(
                  fontFamily: theme.textTheme.headline3!.fontFamily,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              actions: [
                TextButton(
                  child: Text(
                    'No',
                    style: TextStyle(
                      fontFamily: theme.textTheme.headline3!.fontFamily,
                      fontSize: 14.sp,
                      color: mainColor,
                    ),
                  ),
                  onPressed: () {
                    Get.back(result: false);
                  },
                ),
                TextButton(
                  child: Text(
                    'Yes',
                    style: TextStyle(
                      fontFamily: theme.textTheme.headline3!.fontFamily,
                      fontSize: 14.sp,
                      color: mainColor,
                    ),
                  ),
                  onPressed: () async {
                    Get.back(result: true);
                    // exit(0);
                    SystemNavigator.pop();
                  },
                ),
              ],
            )
          : CupertinoAlertDialog(
              title: Text(
                'Exit App',
                style: TextStyle(
                  fontFamily: theme.textTheme.headline3!.fontFamily,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              content: Text(
                'Are you sure you want to exit?',
                style: TextStyle(
                  fontFamily: theme.textTheme.headline3!.fontFamily,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              actions: [
                TextButton(
                  child: Text(
                    'No',
                    style: TextStyle(
                      fontFamily: theme.textTheme.headline3!.fontFamily,
                      fontSize: 14.sp,
                      color: mainColor,
                    ),
                  ),
                  onPressed: () {
                    Get.back(result: false);
                  },
                ),
                TextButton(
                  child: Text(
                    'Yes',
                    style: TextStyle(
                      fontFamily: theme.textTheme.headline3!.fontFamily,
                      fontSize: 14.sp,
                      color: mainColor,
                    ),
                  ),
                  onPressed: () async {
                    Get.back(result: true);
                    // exit(0);
                    SystemNavigator.pop();
                  },
                ),
              ],
            ),
    ).then((value) => value ?? false);
  }

  static void showLogout(context) async {
    final theme = Theme.of(context);
    final platform = Theme.of(context).platform;
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return platform == TargetPlatform.android
            ? AlertDialog(
                title: Row(
                  children: [
                    Icon(
                      Icons.logout,
                      size: 30.0,
                      color: mainColor,
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      'Log Out',
                      style: TextStyle(
                        fontFamily: theme.textTheme.headline3!.fontFamily,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                content: Text(
                  'Are you sure you want to logout?              ',
                  style: TextStyle(
                    fontFamily: theme.textTheme.headline3!.fontFamily,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                actions: [
                  TextButton(
                    child: Text(
                      'No',
                      style: TextStyle(
                        fontFamily: theme.textTheme.headline3!.fontFamily,
                        fontSize: 14.sp,
                        color: mainColor,
                      ),
                    ),
                    onPressed: () {
                      Get.back();
                    },
                  ),
                  TextButton(
                    child: Text(
                      'Yes',
                      style: TextStyle(
                        fontFamily: theme.textTheme.headline3!.fontFamily,
                        fontSize: 14.sp,
                        color: mainColor,
                      ),
                    ),
                    onPressed: () {
                      Get.toNamed(AppRoutes.LOGOUTLOADING);
                      Get.find<GetStorageService>().removeUserStorage();
                      Get.find<GetStorageService>().deleteAnnouncementItems();
                      Get.find<GetStorageService>().deleteVideoLibItems();
                      Get.find<GetStorageService>().deleteNotesItems();
                      //  Get.find<GetStorageService>().deleteNotificationItems();
                      Get.find<BottomNavController>().resetIndex(0);
                    },
                  ),
                ],
              )
            : CupertinoAlertDialog(
                title: Row(
                  children: [
                    Icon(
                      Icons.logout,
                      size: 30.0,
                      color: mainColor,
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      'Logout',
                      style: TextStyle(
                        fontFamily: theme.textTheme.headline3!.fontFamily,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                content: Text(
                  'Are you sure you want to logout?              ',
                  style: TextStyle(
                    fontFamily: theme.textTheme.headline3!.fontFamily,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                actions: [
                  TextButton(
                    child: Text(
                      'No',
                      style: TextStyle(
                        fontFamily: theme.textTheme.headline3!.fontFamily,
                        fontSize: 14.sp,
                        color: mainColor,
                      ),
                    ),
                    onPressed: () {
                      Get.back();
                    },
                  ),
                  TextButton(
                    child: Text(
                      'Yes',
                      style: TextStyle(
                        fontFamily: theme.textTheme.headline3!.fontFamily,
                        fontSize: 14.sp,
                        color: mainColor,
                      ),
                    ),
                    onPressed: () {
                      Get.toNamed(AppRoutes.LOGOUTLOADING);
                      Get.find<GetStorageService>().removeUserStorage();
                      Get.find<BottomNavController>().resetIndex(0);
                    },
                  ),
                ],
              );
      },
    );
  }

  static void showDeleteAnnouncement(context, announceID, schoolID) async {
    final theme = Theme.of(context);
    final platform = Theme.of(context).platform;
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return platform == TargetPlatform.android
            ? AlertDialog(
                title: Row(
                  children: [
                    Icon(
                      Icons.info,
                      size: 30.0,
                      color: Colors.orangeAccent,
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      'Are you sure?',
                      style: TextStyle(
                        fontFamily: theme.textTheme.headline3!.fontFamily,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                content: Text(
                  'You will not be able to recover this file!              ',
                  style: TextStyle(
                    fontFamily: theme.textTheme.headline3!.fontFamily,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                actions: [
                  TextButton(
                    child: Text(
                      'No',
                      style: TextStyle(
                        fontFamily: theme.textTheme.headline3!.fontFamily,
                        fontSize: 14.sp,
                        color: mainColor,
                      ),
                    ),
                    onPressed: () {
                      Get.back();
                    },
                  ),
                  TextButton(
                    child: Text(
                      'Yes',
                      style: TextStyle(
                        fontFamily: theme.textTheme.headline3!.fontFamily,
                        fontSize: 14.sp,
                        color: mainColor,
                      ),
                    ),
                    onPressed: () {
                      Get.find<AnnouncementController>()
                          .deleteAnnouncement(announceID, schoolID);
                      Get.back();
                      // Get.toNamed(AppRoutes.LOGOUTLOADING);
                      // Get.find<GetStorageService>().removeUserStorage();
                    },
                  ),
                ],
              )
            : CupertinoAlertDialog(
                title: Row(
                  children: [
                    Icon(
                      Icons.info,
                      size: 30.0,
                      color: Colors.orangeAccent,
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      'Are you sure?',
                      style: TextStyle(
                        fontFamily: theme.textTheme.headline3!.fontFamily,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                content: Text(
                  'You will not be able to recover this file!              ',
                  style: TextStyle(
                    fontFamily: theme.textTheme.headline3!.fontFamily,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                actions: [
                  TextButton(
                    child: Text(
                      'No',
                      style: TextStyle(
                        fontFamily: theme.textTheme.headline3!.fontFamily,
                        fontSize: 14.sp,
                        color: mainColor,
                      ),
                    ),
                    onPressed: () {
                      Get.back();
                    },
                  ),
                  TextButton(
                    child: Text(
                      'Yes',
                      style: TextStyle(
                        fontFamily: theme.textTheme.headline3!.fontFamily,
                        fontSize: 14.sp,
                        color: mainColor,
                      ),
                    ),
                    onPressed: () {
                      Get.find<AnnouncementController>()
                          .deleteAnnouncement(announceID, schoolID);
                      Get.back();
                      // Get.toNamed(AppRoutes.LOGOUTLOADING);
                      // Get.find<GetStorageService>().removeUserStorage();
                    },
                  ),
                ],
              );
      },
    );
  }

  static void showDeleteVideo(context, videoLibId, schoolID) async {
    final theme = Theme.of(context);
    final platform = Theme.of(context).platform;
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return platform == TargetPlatform.android
            ? AlertDialog(
                title: Row(
                  children: [
                    Icon(
                      Icons.info,
                      size: 30.0,
                      color: Colors.orangeAccent,
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      'Are you sure?',
                      style: TextStyle(
                        fontFamily: theme.textTheme.headline3!.fontFamily,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                content: Text(
                  'You will not be able to recover this file!              ',
                  style: TextStyle(
                    fontFamily: theme.textTheme.headline3!.fontFamily,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                actions: [
                  TextButton(
                    child: Text(
                      'No',
                      style: TextStyle(
                        fontFamily: theme.textTheme.headline3!.fontFamily,
                        fontSize: 14.sp,
                        color: mainColor,
                      ),
                    ),
                    onPressed: () {
                      Get.back();
                    },
                  ),
                  TextButton(
                    child: Text(
                      'Yes',
                      style: TextStyle(
                        fontFamily: theme.textTheme.headline3!.fontFamily,
                        fontSize: 14.sp,
                        color: mainColor,
                      ),
                    ),
                    onPressed: () {
                      Get.find<VideolabController>()
                          .deleteVideoLibrary(videoLibId, schoolID);
                      Get.back();
                      // Get.toNamed(AppRoutes.LOGOUTLOADING);
                      // Get.find<GetStorageService>().removeUserStorage();
                    },
                  ),
                ],
              )
            : CupertinoAlertDialog(
                title: Row(
                  children: [
                    Icon(
                      Icons.info,
                      size: 30.0,
                      color: Colors.orangeAccent,
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      'Are you sure?',
                      style: TextStyle(
                        fontFamily: theme.textTheme.headline3!.fontFamily,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                content: Text(
                  'You will not be able to recover this file!              ',
                  style: TextStyle(
                    fontFamily: theme.textTheme.headline3!.fontFamily,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                actions: [
                  TextButton(
                    child: Text(
                      'No',
                      style: TextStyle(
                        fontFamily: theme.textTheme.headline3!.fontFamily,
                        fontSize: 14.sp,
                        color: mainColor,
                      ),
                    ),
                    onPressed: () {
                      Get.back();
                    },
                  ),
                  TextButton(
                    child: Text(
                      'Yes',
                      style: TextStyle(
                        fontFamily: theme.textTheme.headline3!.fontFamily,
                        fontSize: 14.sp,
                        color: mainColor,
                      ),
                    ),
                    onPressed: () {
                      Get.find<VideolabController>()
                          .deleteVideoLibrary(videoLibId, schoolID);
                      Get.back();
                      // Get.toNamed(AppRoutes.LOGOUTLOADING);
                      // Get.find<GetStorageService>().removeUserStorage();
                    },
                  ),
                ],
              );
      },
    );
  }

  static void showDeleteFile(context, notesID, userID, schoolID) async {
    final theme = Theme.of(context);
    final platform = Theme.of(context).platform;
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return platform == TargetPlatform.android
            ? AlertDialog(
                title: Row(
                  children: [
                    Icon(
                      Icons.info,
                      size: 30.0,
                      color: Colors.orangeAccent,
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      'Are you sure?',
                      style: TextStyle(
                        fontFamily: theme.textTheme.headline3!.fontFamily,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                content: Text(
                  'You will not be able to recover this file!              ',
                  style: TextStyle(
                    fontFamily: theme.textTheme.headline3!.fontFamily,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                actions: [
                  TextButton(
                    child: Text(
                      'No',
                      style: TextStyle(
                        fontFamily: theme.textTheme.headline3!.fontFamily,
                        fontSize: 14.sp,
                        color: mainColor,
                      ),
                    ),
                    onPressed: () {
                      Get.back();
                    },
                  ),
                  TextButton(
                    child: Text(
                      'Yes',
                      style: TextStyle(
                        fontFamily: theme.textTheme.headline3!.fontFamily,
                        fontSize: 14.sp,
                        color: mainColor,
                      ),
                    ),
                    onPressed: () {
                      Get.find<FilesController>()
                          .deleteUserNotes(notesID, userID, schoolID);
                      Get.back();
                      // Get.toNamed(AppRoutes.LOGOUTLOADING);
                      // Get.find<GetStorageService>().removeUserStorage();
                    },
                  ),
                ],
              )
            : CupertinoAlertDialog(
                title: Row(
                  children: [
                    Icon(
                      Icons.info,
                      size: 30.0,
                      color: Colors.orangeAccent,
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      'Are you sure?',
                      style: TextStyle(
                        fontFamily: theme.textTheme.headline3!.fontFamily,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                content: Text(
                  'You will not be able to recover this file!              ',
                  style: TextStyle(
                    fontFamily: theme.textTheme.headline3!.fontFamily,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                actions: [
                  TextButton(
                    child: Text(
                      'No',
                      style: TextStyle(
                        fontFamily: theme.textTheme.headline3!.fontFamily,
                        fontSize: 14.sp,
                        color: mainColor,
                      ),
                    ),
                    onPressed: () {
                      Get.back();
                    },
                  ),
                  TextButton(
                    child: Text(
                      'Yes',
                      style: TextStyle(
                        fontFamily: theme.textTheme.headline3!.fontFamily,
                        fontSize: 14.sp,
                        color: mainColor,
                      ),
                    ),
                    onPressed: () {
                      Get.find<FilesController>()
                          .deleteUserNotes(notesID, userID, schoolID);
                      Get.back();
                    },
                  ),
                ],
              );
      },
    );
  }

  static void showSessionExpire(context) async {
    final theme = Theme.of(context);
    final platform = Theme.of(context).platform;
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return platform == TargetPlatform.android
            ? AlertDialog(
                title: Row(
                  children: [
                    Icon(
                      Icons.info,
                      size: 30.0,
                      color: Colors.orangeAccent,
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      'Log Out',
                      style: TextStyle(
                        fontFamily: theme.textTheme.headline3!.fontFamily,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                content: Text(
                  'You have been automatically logout due to inactivity              ',
                  style: TextStyle(
                    fontFamily: theme.textTheme.headline3!.fontFamily,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                actions: [
                  TextButton(
                    child: Text(
                      'Ok',
                      style: TextStyle(
                        fontFamily: theme.textTheme.headline3!.fontFamily,
                        fontSize: 14.sp,
                        color: mainColor,
                      ),
                    ),
                    onPressed: () {
                      Get.toNamed(AppRoutes.LOGOUTLOADING);
                      Get.find<GetStorageService>().removeUserStorage();
                      Get.find<GetStorageService>().deleteAnnouncementItems();
                      Get.find<GetStorageService>().deleteVideoLibItems();
                      Get.find<GetStorageService>().deleteNotesItems();
                      //  Get.find<GetStorageService>().deleteNotificationItems();
                      Get.find<BottomNavController>().resetIndex(0);
                    },
                  ),
                ],
              )
            : CupertinoAlertDialog(
                title: Row(
                  children: [
                    Icon(
                      Icons.info,
                      size: 30.0,
                      color: Colors.orangeAccent,
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      'Log Out',
                      style: TextStyle(
                        fontFamily: theme.textTheme.headline3!.fontFamily,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                content: Text(
                  'You have been automatically logout due to inactivity              ',
                  style: TextStyle(
                    fontFamily: theme.textTheme.headline3!.fontFamily,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                actions: [
                  TextButton(
                    child: Text(
                      'Ok',
                      style: TextStyle(
                        fontFamily: theme.textTheme.headline3!.fontFamily,
                        fontSize: 14.sp,
                        color: mainColor,
                      ),
                    ),
                    onPressed: () {
                      Get.toNamed(AppRoutes.LOGOUTLOADING);
                      Get.find<GetStorageService>().removeUserStorage();
                      Get.find<GetStorageService>().deleteAnnouncementItems();
                      Get.find<GetStorageService>().deleteVideoLibItems();
                      Get.find<GetStorageService>().deleteNotesItems();
                      //  Get.find<GetStorageService>().deleteNotificationItems();
                      Get.find<BottomNavController>().resetIndex(0);
                    },
                  ),
                ],
              );
      },
    );
  }

  static void showDisableAccount(context, studentID) async {
    final theme = Theme.of(context);
    final platform = Theme.of(context).platform;
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return platform == TargetPlatform.android
            ? AlertDialog(
                title: Row(
                  children: [
                    Icon(
                      Icons.info,
                      size: 40.0,
                      color: Colors.orangeAccent,
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Expanded(
                      child: Text(
                        'Are you sure to disable this account?',
                        style: TextStyle(
                          fontFamily: theme.textTheme.headline3!.fontFamily,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
                content: Text(
                  'Disabling this account will lock the account of the user!              ',
                  style: TextStyle(
                    fontFamily: theme.textTheme.headline3!.fontFamily,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                actions: [
                  TextButton(
                    child: Text(
                      'No, Keep it',
                      style: TextStyle(
                        fontFamily: theme.textTheme.headline3!.fontFamily,
                        fontSize: 14.sp,
                        color: mainColor,
                      ),
                    ),
                    onPressed: () {
                      Get.back();
                    },
                  ),
                  TextButton(
                    child: Text(
                      'Yes, disable this account',
                      style: TextStyle(
                        fontFamily: theme.textTheme.headline3!.fontFamily,
                        fontSize: 14.sp,
                        color: mainColor,
                      ),
                    ),
                    onPressed: () {
                      Get.find<StudentListController>()
                          .disableStudent(context, studentID);

                      // Get.toNamed(AppRoutes.LOGOUTLOADING);
                      // Get.find<GetStorageService>().removeUserStorage();
                    },
                  ),
                ],
              )
            : CupertinoAlertDialog(
                title: Row(
                  children: [
                    Icon(
                      Icons.info,
                      size: 40.0,
                      color: Colors.orangeAccent,
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Expanded(
                      child: Text(
                        'Are you sure to disable this account?',
                        style: TextStyle(
                          fontFamily: theme.textTheme.headline3!.fontFamily,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
                content: Text(
                  'Disabling this account will lock the account of the user!              ',
                  style: TextStyle(
                    fontFamily: theme.textTheme.headline3!.fontFamily,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                actions: [
                  TextButton(
                    child: Text(
                      'No, Keep it',
                      style: TextStyle(
                        fontFamily: theme.textTheme.headline3!.fontFamily,
                        fontSize: 14.sp,
                        color: mainColor,
                      ),
                    ),
                    onPressed: () {
                      Get.back();
                    },
                  ),
                  TextButton(
                    child: Text(
                      'Yes, disable this account',
                      style: TextStyle(
                        fontFamily: theme.textTheme.headline3!.fontFamily,
                        fontSize: 14.sp,
                        color: mainColor,
                      ),
                    ),
                    onPressed: () {
                      Get.find<StudentListController>()
                          .disableStudent(context, studentID);
                    },
                  ),
                ],
              );
      },
    );
  }

  static void showEnableAccount(context, studentID) async {
    final theme = Theme.of(context);
    final platform = Theme.of(context).platform;
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return platform == TargetPlatform.android
            ? AlertDialog(
                title: Row(
                  children: [
                    Icon(
                      Icons.info,
                      size: 40.0,
                      color: Colors.orangeAccent,
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Expanded(
                      child: Text(
                        'Are you sure to enable this account?',
                        style: TextStyle(
                          fontFamily: theme.textTheme.headline3!.fontFamily,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
                content: Text(
                  'Disabling this account will unlock the account of the user!              ',
                  style: TextStyle(
                    fontFamily: theme.textTheme.headline3!.fontFamily,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                actions: [
                  TextButton(
                    child: Text(
                      'No, Keep it',
                      style: TextStyle(
                        fontFamily: theme.textTheme.headline3!.fontFamily,
                        fontSize: 14.sp,
                        color: mainColor,
                      ),
                    ),
                    onPressed: () {
                      Get.back();
                    },
                  ),
                  TextButton(
                    child: Text(
                      'Yes, enable this account',
                      style: TextStyle(
                        fontFamily: theme.textTheme.headline3!.fontFamily,
                        fontSize: 14.sp,
                        color: mainColor,
                      ),
                    ),
                    onPressed: () {
                      Get.find<StudentListController>()
                          .enableStudent(context, studentID);
                      // Get.toNamed(AppRoutes.LOGOUTLOADING);
                      // Get.find<GetStorageService>().removeUserStorage();
                    },
                  ),
                ],
              )
            : CupertinoAlertDialog(
                title: Row(
                  children: [
                    Icon(
                      Icons.info,
                      size: 40.0,
                      color: Colors.orangeAccent,
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Expanded(
                      child: Text(
                        'Are you sure to enable this account?',
                        style: TextStyle(
                          fontFamily: theme.textTheme.headline3!.fontFamily,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
                content: Text(
                  'Disabling this account will unlock the account of the user!              ',
                  style: TextStyle(
                    fontFamily: theme.textTheme.headline3!.fontFamily,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                actions: [
                  TextButton(
                    child: Text(
                      'No, Keep it',
                      style: TextStyle(
                        fontFamily: theme.textTheme.headline3!.fontFamily,
                        fontSize: 14.sp,
                        color: mainColor,
                      ),
                    ),
                    onPressed: () {
                      Get.back();
                    },
                  ),
                  TextButton(
                    child: Text(
                      'Yes, enable this account',
                      style: TextStyle(
                        fontFamily: theme.textTheme.headline3!.fontFamily,
                        fontSize: 14.sp,
                        color: mainColor,
                      ),
                    ),
                    onPressed: () {
                      Get.find<StudentListController>()
                          .enableStudent(context, studentID);

                      // Get.back();
                    },
                  ),
                ],
              );
      },
    );
  }

  static void showDialogs(context) async {
    final theme = Theme.of(context);
    final platform = Theme.of(context).platform;
    showDialog(
      //barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return platform == TargetPlatform.android
            ? AlertDialog(
                title: Expanded(
                  child: Container(
                    height: 300,
                    width: double.infinity,
                    child: Text(
                      '███████████████████████████'
                      '███████████████████████████'
                      '███████▀▀▀░░░░░░░▀▀▀███████'
                      '████▀░░░░░░░░░░░░░░░░░▀████'
                      '███│░░░░░░░░░░░░░░░░░░░│███'
                      '██▌│░░░░░░░░░░░░░░░░░░░│▐██'
                      '██░└┐░░░░░░░░░░░░░░░░░┌┘░██'
                      '██░░└┐░░░░░░░░░░░░░░░┌┘░░██'
                      '██░░┌┘▄▄▄▄▄░░░░░▄▄▄▄▄└┐░░██'
                      '██▌░│██████▌░░░▐██████│░▐██'
                      '███░│▐███▀▀░░▄░░▀▀███▌│░███'
                      '██▀─┘░░░░░░░▐█▌░░░░░░░└─▀██'
                      '██▄░░░▄▄▄▓░░▀█▀░░▓▄▄▄░░░▄██'
                      '████▄─┘██▌░░░░░░░▐██└─▄████'
                      '█████░░▐█─┬┬┬┬┬┬┬─█▌░░█████'
                      '████▌░░░▀┬┼┼┼┼┼┼┼┬▀░░░▐████'
                      '█████▄░░░└┴┴┴┴┴┴┴┘░░░▄█████'
                      '███████▄░░░░░░░░░░░▄███████'
                      '██████████▄▄▄▄▄▄▄██████████'
                      '███████████████████████████',
                      style: TextStyle(
                        fontFamily: theme.textTheme.headline3!.fontFamily,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              )
            : CupertinoAlertDialog(
                title: Row(
                  children: [
                    Icon(
                      Icons.info,
                      size: 30.0,
                      color: Colors.orangeAccent,
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      'Are you sure?',
                      style: TextStyle(
                        fontFamily: theme.textTheme.headline3!.fontFamily,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                content: Text(
                  'You will not be able to recover this file!              ',
                  style: TextStyle(
                    fontFamily: theme.textTheme.headline3!.fontFamily,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                actions: [
                  TextButton(
                    child: Text(
                      'No',
                      style: TextStyle(
                        fontFamily: theme.textTheme.headline3!.fontFamily,
                        fontSize: 14.sp,
                        color: mainColor,
                      ),
                    ),
                    onPressed: () {
                      Get.back();
                    },
                  ),
                  TextButton(
                    child: Text(
                      'Yes',
                      style: TextStyle(
                        fontFamily: theme.textTheme.headline3!.fontFamily,
                        fontSize: 14.sp,
                        color: mainColor,
                      ),
                    ),
                    onPressed: () {
                      // Get.find<AnnouncementController>()
                      //     .deleteAnnouncement(announceID, schoolID);
                      // Get.back();
                      // Get.toNamed(AppRoutes.LOGOUTLOADING);
                      // Get.find<GetStorageService>().removeUserStorage();
                    },
                  ),
                ],
              );
      },
    );
  }
}
