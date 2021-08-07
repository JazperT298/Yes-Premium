import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:launch_review/launch_review.dart';
import 'package:new_version/new_version.dart';
import 'package:yes_premium/routes/app_routes.dart';
// import 'package:yestech_flutter/routes/app_routes.dart';
// import 'package:yestech_flutter/services/new_version.dart';

class SplashScreenController extends GetxController {
  final newVersion = NewVersion(
    androidId: 'com.theyestech.yes_premium',
    iOSId: 'com.theyestech.yespremium',
  );

  RxString storeLink = ''.obs;

  final box = GetStorage();

  //Get app version
  void _getAppVersion() async {
    try {
      final VersionStatus? status = await newVersion.getVersionStatus();

      print("localVersion ${status!.localVersion}");
      print("storeVersion ${status.storeVersion}");
      print("canUpdate ${status.canUpdate}");
      print("appStoreLink ${status.appStoreLink}");

      storeLink.value = status.appStoreLink;

      //Remove the ! if you want to show dialog
      if (status.canUpdate) {
        _newVersionDialog();
      } else {
        //check if user has logged in
        if (box.read('user_id') != null) {
          Get.offAndToNamed(
            AppRoutes.BOTTOMNAV,
          );
        } else {
          Get.offAndToNamed(
            AppRoutes.LOGIN,
          );
        }
      }
    } catch (err) {
      print('_getAppVersion $err');
      Get.offAndToNamed(
        AppRoutes.BOTTOMNAV,
      );
    }
  }

  //Navigate to play/app store
  void _launchToStore() {
    LaunchReview.launch(
        androidAppId: "com.theyestech.yes_premium", iOSAppId: "1517630422");
  }

  // void askLocalNotificationRequest() async {
  //   print('askLocalNotificationRequest');
  //   AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
  //     if (!isAllowed) {
  //       // Insert here your friendly dialog box before call the request method
  //       // This is very important to not harm the user experience
  //       AwesomeNotifications().requestPermissionToSendNotifications();
  //     }
  //   });
  // }

  @override
  void onInit() async {
    super.onInit();
    // Get.offAndToNamed(
    //   AppRoutes.BOTTOMNAV,
    // );
    _getAppVersion();
  }

  //App updater dialog
  Future<void> _newVersionDialog() {
    return Get.dialog(
      GetPlatform.isAndroid
          ? AlertDialog(
              title: Text(
                'Update Available',
              ),
              content: Text(
                'Update app to get the best version!',
              ),
              actions: <Widget>[
                TextButton(
                  onPressed: _launchToStore,
                  child: Text(
                    "Let's go!",
                  ),
                ),
              ],
            )
          : CupertinoAlertDialog(
              title: Text(
                'Update Available',
              ),
              content: Text(
                'Update app to get the best version!',
              ),
              actions: <Widget>[
                CupertinoDialogAction(
                  onPressed: _launchToStore,
                  child: Text(
                    "Let's go!",
                  ),
                ),
              ],
            ),
      barrierDismissible: false,
    );
  }
}
