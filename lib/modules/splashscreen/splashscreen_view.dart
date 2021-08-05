import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:yes_premium/configs/app_config.dart';
import 'package:yes_premium/modules/splashscreen/splashscreen_controller.dart';

class SplashScreenView extends StatelessWidget {
  final controller = Get.put(SplashScreenController());

  @override
  Widget build(BuildContext context) {
    final config = App(context);
    return Container(
      decoration: BoxDecoration(color: Colors.white),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: config.appWidth(40),
            width: config.appWidth(40),
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              image: DecorationImage(
                image: AssetImage('assets/images/v4.png'),
              ),
            ),
          ),
          SizedBox(
            height: config.appHeight(5),
          ),
          SpinKitThreeBounce(
            color: Colors.yellow,
            size: 20,
          ),
        ],
      ),
    );
  }
}
