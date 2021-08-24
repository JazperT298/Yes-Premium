import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
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
    _checkUserLoggedIn();
    print('${box.read('UserId')}');
  }

  //Check if user has logged in
  void _checkUserLoggedIn() {
    if (box.read('UserId') == "" || box.read('UserId') == null) {
      Get.offNamed(AppRoutes.LOGIN);
    }
    // else if (box.read('expires_in') == 0) {
    //   // Dialogs.showSessionExpire(context);
    //   print('${box.read('expires_in')}');
    // }
    else {
      Get.offNamed(AppRoutes.BOTTOMNAV);
    }
  }
}
