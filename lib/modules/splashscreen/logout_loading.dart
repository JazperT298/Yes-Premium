import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yes_premium/modules/bottomnav/bottomnav_controller.dart';
import 'package:yes_premium/routes/app_routes.dart';

class LoadingLogout extends StatefulWidget {
  const LoadingLogout({key}) : super(key: key);

  @override
  _LoadingLogoutState createState() => _LoadingLogoutState();
}

class _LoadingLogoutState extends State<LoadingLogout> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 500), () {
      Get.offNamed(AppRoutes.LOGIN);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
