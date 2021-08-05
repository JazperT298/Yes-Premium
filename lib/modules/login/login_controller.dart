import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  //   var loginCredentials = <LoginData>[].obs;
  // var userCredentials = <UserEducator>[].obs;

  var username = TextEditingController();
  var password = TextEditingController();

  RxBool isObsecureText = true.obs;
}
