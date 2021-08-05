import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:yes_premium/colors.dart';
import 'package:yes_premium/modules/bottomnav/bottomnav_controller.dart';
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
                title: Text(
                  'Logout',
                  style: TextStyle(
                    fontFamily: theme.textTheme.headline3!.fontFamily,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                content: Text(
                  'Are you sure you want to logout?',
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
              )
            : CupertinoAlertDialog(
                title: Text(
                  'Logout',
                  style: TextStyle(
                    fontFamily: theme.textTheme.headline3!.fontFamily,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                content: Text(
                  'Are you sure you want to logout?',
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
}
