import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yes_premium/configs/app_config.dart';
import 'package:yes_premium/modules/login/login_controller.dart';
import 'package:yes_premium/shared/dialogs.dart';

class LoginView extends StatelessWidget {
  final controller = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    final node = FocusScope.of(context);

    final config = App(context);
    final _node = FocusScope.of(context);

    Container imageLogo() {
      return Container(
        height: config.appWidth(40),
        width: config.appWidth(40),
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          image: DecorationImage(
            image: AssetImage('assets/images/the_yes_logo.png'),
          ),
        ),
      );
    }

    TextField _usernameInput() {
      return TextField(
        controller: controller.username,
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.next,
        onEditingComplete: () => _node.nextFocus(),
        decoration: InputDecoration(
          labelText: 'Username',
        ),
      );
    }

    TextField _passwordInput() {
      return TextField(
        controller: controller.password,
        //obscureText: controller.isObsecureText.value,
        onSubmitted: (_) => _node.unfocus(),
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          labelText: 'Password',
          suffixIcon: IconButton(
            icon: Icon(Icons.remove_red_eye_outlined),
            onPressed: () {
              //controller.isObsecureText.toggle();
            },
          ),
        ),
      );
    }

    Widget _button() {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: MaterialButton(
              color: Colors.green,
              height: 50,
              child: Text(
                'Login',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onPressed: () async {
                node.unfocus();
                if (!controller.username.text.contains('@') ||
                    !controller.username.text.endsWith('.com')) {
                  Dialogs.showMyToast(context, "Invalid email address");
                } else if (controller.username.text.isEmpty) {
                  Dialogs.showMyToast(
                      context, "Phone number must not be Empty");
                } else if (controller.password.text.isEmpty) {
                  Dialogs.showMyToast(context, "Password must not be Empty");
                } else {
                  var loginReturn = await controller.loadingLogin(context,
                      controller.username.text, controller.password.text);
                  //await controller.loadingGetUserInfo(context);
                  print(loginReturn);
                  if (loginReturn != 'success') {
                    Dialogs.showMyToast(context, "Invalid credentials");
                  } else if (loginReturn == 'catch') {
                    Dialogs.showMyToast(context, "Oops, something went wrong");
                  } else {
                    controller.successNavigate();
                  }
                }
              },
            ),
          ),
        ],
      );
    }

    Widget _bottomText() {
      return Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Forgot Password?",
          ),
          SizedBox(width: 5.0),
          GestureDetector(
            onTap: () {
              // Get.offAllNamed(AppRoutes.REGISTEREDUCATOR);
            },
            child: Text(
              "New here? Register now",
              style: TextStyle(
                color: Colors.blueAccent,
              ),
            ),
          ),
        ],
      );
    }

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            imageLogo(),
            SizedBox(height: 30.0),
            _usernameInput(),
            _passwordInput(),
            SizedBox(height: 20.0),
            _button(),
            SizedBox(height: 15.0),
            _bottomText(),
          ],
        ),
      ),
    );
  }
}
