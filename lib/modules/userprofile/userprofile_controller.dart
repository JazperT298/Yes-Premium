import 'package:get/get.dart';

class UserProfileController extends GetxController {
  var userID = ''.obs;

  @override
  void onInit() {
    super.onInit();
    userID.value = Get.arguments['userID'];
  }
}
