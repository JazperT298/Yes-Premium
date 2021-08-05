import 'package:flutter/material.dart';
import 'package:yes_premium/colors.dart';

ThemeData lightTheme = ThemeData(
  accentColor: mainColor,
  primaryColor: mainColor,
  brightness: Brightness.light,
  textTheme: TextTheme(
    //BT1
    headline1: TextStyle(
      fontSize: 36,
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w700,
      color: fontColor,
    ),
    //BT2
    headline2: TextStyle(
      fontSize: 26,
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w600,
      color: fontColor,
    ),
    //BT3
    headline3: TextStyle(
      fontSize: 20,
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w600,
      color: fontColor,
    ),
    //BT4
    headline4: TextStyle(
      fontSize: 18,
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w500,
      color: fontColor,
    ),
    //BT5
    headline5: TextStyle(
      fontSize: 16,
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w400,
      color: fontColor,
    ),
    //BT6
    headline6: TextStyle(
      fontSize: 14,
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w300,
      color: fontColor,
    ),
    // //Text for AppBar
    bodyText1: TextStyle(
      fontSize: 20,
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w800,
      color: fontColor,
    ),
    //BT7
    subtitle1: TextStyle(
      fontSize: 16,
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w300,
      color: fontColor.withOpacity(0.8),
    ),
    //BT8
    subtitle2: TextStyle(
      fontSize: 11,
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w300,
      // color: fontColor.withOpacity(0.8),
    ),
  ),
);
