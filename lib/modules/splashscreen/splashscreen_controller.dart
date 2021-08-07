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

  @override
  void onInit() async {
    super.onInit();
    await Future.delayed(Duration(seconds: 3));
    _checkUserLoggedin();
  }

  //Check if user has logged in
  void _checkUserLoggedin() {
    if (box.read('userName') != 0) {
      Get.offNamed(AppRoutes.BOTTOMNAV);
    } else {
      Get.offNamed(AppRoutes.LOGIN);
    }
  }
}
