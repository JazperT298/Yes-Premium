import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yes_premium/models/login_data.dart';
import 'package:yes_premium/modules/login/login_api.dart';
import 'package:yes_premium/routes/app_routes.dart';
import 'package:yes_premium/services/get_storage_service.dart';
import 'package:yes_premium/widgets/custom_dialog.dart';

class LoginController extends GetxController {
  var loginCredentials = <LoginData>[].obs;
  Rx<LoginData> loginData = LoginData().obs;
  // var userCredentials = <UserEducator>[].obs;

  var username = TextEditingController();
  var password = TextEditingController();

  RxBool isObsecureText = true.obs;

  //login
  Future<String> loadingLogin(context, usernameParamL, passwordParamL) async {
    //BuildContext dialogContext;
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        //dialogContext = context;
        return Dialog(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomLoading(),
                Text("Loading..."),
                SizedBox(width: 50.0),
              ],
            ),
          ),
        );
      },
    );
    var result = await loginUser(usernameParamL, passwordParamL);

    Future.delayed(Duration(milliseconds: 500), () {
      Navigator.pop(context);
    });
    return Future.delayed(Duration(milliseconds: 500), () {
      return Future<String>.value(result);
    });
  }

  Future<String> loginUser(usernameParam, passwordParam) async {
    //var finalusername = "+63" + usernameParam;

    try {
      var login = await LoginApi.loginUser(usernameParam, passwordParam);
      if (login != null) {
        loginCredentials.assignAll(login);
        Get.find<GetStorageService>().setLoginStorage(
          loginCredentials[0].accessToken,
          loginCredentials[0].tokenType,
          loginCredentials[0].expiresIn,
          loginCredentials[0].userName,
          loginCredentials[0].issued,
          loginCredentials[0].expires,
        );

        return "success";
      } else {
        return "invalid";
      }
    } catch (e) {
      print('loginEducator $e');
      return "catch";
    }
  }

  void successNavigate() {
    Future.delayed(Duration(milliseconds: 200), () {
      Get.offNamed(
        AppRoutes.BOTTOMNAV,
      );

      username.clear();
      password.clear();
    });
    // }
  }
}
