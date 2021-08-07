import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:yes_premium/colors.dart';

class CustomLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.orange[50],
      height: 50,
      width: 50,
      child: SpinKitFadingCircle(
        color: mainColor,
        size: 50,
      ),
    );
  }
}
