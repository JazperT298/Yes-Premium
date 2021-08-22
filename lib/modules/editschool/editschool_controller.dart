import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditSchoolController extends GetxController {
  var schoolID = ''.obs;
  var schoolName = ''.obs;
  var schoolLogo = ''.obs;
  var schoolAddress = ''.obs;
  var schoolDetails = ''.obs;
  var schoolMotto = ''.obs;
  var adminUsername = ''.obs;

  final name = TextEditingController();
  final address = TextEditingController();
  final details = TextEditingController();
  final motto = TextEditingController();
  final username = TextEditingController();
  final password = TextEditingController();
  final confirmpassword = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    schoolID.value = Get.arguments['schoolID'];
    schoolName.value = Get.arguments['schoolName'];
    schoolLogo.value = Get.arguments['schoolLogo'];
    schoolAddress.value = Get.arguments['schoolAddress'];
    schoolDetails.value = Get.arguments['schoolDetails'];
    schoolMotto.value = Get.arguments['schoolMotto'];
    adminUsername.value = Get.arguments['adminUsername'];

    name.text = schoolName.value;
    address.text = schoolAddress.value;
    details.text = schoolDetails.value;
    motto.text = schoolMotto.value;
    username.text = adminUsername.value;
  }
}
