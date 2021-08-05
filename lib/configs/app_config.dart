import 'package:flutter/material.dart';

class App {
  final double fontScale = 1.0;
  late BuildContext context;
  late double height;
  late double width;
  late double heightPadding;
  late double widthPadding;

  App(context) {
    this.context = context;
    MediaQueryData queryData = MediaQuery.of(this.context);
    height = queryData.size.height / 100.0;
    width = queryData.size.width / 100.0;
    height = double.parse(height.toStringAsFixed(1));
    width = double.parse(width.toStringAsFixed(1));
    heightPadding =
        height - ((queryData.padding.top + queryData.padding.bottom) / 100.0);
    widthPadding =
        width - (queryData.padding.left + queryData.padding.right) / 100.0;
  }

  double appHeight(double v) {
    return height * v;
  }

  double appWidth(double v) {
    return width * v;
  }

  double appVerticalPadding(double v) {
    return heightPadding * v;
  }

  double appHorizontalPadding(double v) {
    return widthPadding * v;
  }

  // double fourZero = 4.0;
  // double fourThree = 4.3;
  // double fourFive = 4.5;
  // double fourSeven = 4.7;
  // double fiveZero = 5.0;
  // double fiveFive = 5.5;
  // double fiveSeven = 5.7;
  // double sixZero = 6.0;
  // double sixOne = 6.1;
  // double sixTwo = 6.2;
  // double sixThree = 6.3;
  // double sixFour = 6.4;
  // double sixFive = 6.5;
  // double sixSix = 6.6;
  // double sixSeven = 6.7;
  // double sixEight = 6.8;
  // double sevenZero = 7.0;
  // double sevenOne = 7.1;
  // double sevenTwo = 7.2;
  // double sevenThree = 7.3;
  // double sevenFour = 7.4;
  // double sevenFive = 7.5;
  // double sevenSix = 7.6;
  // double sevenSeven = 7.7;
  // double sevenEight = 7.8;
  // double sevenNine = 7.9;
  // double eightZero = 8.0;

  double textScaler(double d) {
    double textScale = 1.0;

    if (d >= 4.0 && d <= 4.7) {
      //476.0 = 4.8 inches
      double value = 0.7;
      textScale = value;
    } else if (d >= 4.7 && d <= 4.9) {
      //476.0 = 4.8 inches
      double value = 0.8;
      textScale = value;
    } else if (d >= 4.9 && d <= 5.1) {
      //500.0 = 5.0 inches
      double value = 0.85;
      textScale = value;
    } else if (d >= 5.1 && d <= 5.45) {
      //500.0 = 5.0 inches
      double value = 0.85;
      textScale = value;
    } else if (d >= 5.45 && d <= 5.8) {
      //545.0 = 5.5 inches == base screen
      double value = 0.85;
      textScale = value;
    } else if (d >= 5.8 && d <= 6.0) {
      //580.0 = 5.8 inches
      double value = 0.85;
      textScale = value;
    } else if (d >= 6.0 && d <= 6.2) {
      //6.17 = 6.1 inches
      double value = 0.85;
      textScale = value;
    } else if (d >= 6.2 && d <= 6.6) {
      //650.0 = 6.5 inches
      double value = 0.85;
      textScale = value;
    } else {
      //default
      double value = 0.85;
      textScale = value;
    }

    // if (d >= fourZero && d <= fourThree) {
    //   textScale = 0.6;
    // } else if (d >= fourThree && d <= fourFive) {
    //   textScale = 0.6;
    // } else if (d >= fourFive && d <= fourSeven) {
    //   textScale = 0.625;
    // } else if (d >= fourSeven && d <= fiveZero) {
    //   textScale = 0.625;
    // } else if (d >= fiveZero && d <= fiveFive) {
    //   textScale = 0.625;
    // } else if (d >= fiveFive && d <= fiveSeven) {
    //   textScale = 0.8;
    // } else if (d >= fiveSeven && d <= sixZero) {
    //   textScale = 0.8;
    // } else if (d >= sixZero && d <= sixOne) {
    //   textScale = 0.8;
    // } else if (d >= sixOne && d <= sixTwo) {
    //   textScale = 0.8;
    // } else if (d >= sixTwo && d <= sixThree) {
    //   textScale = 0.8;
    // } else if (d >= sixThree && d <= sixFour) {
    //   textScale = 0.8;
    // } else if (d >= sixFour && d <= sixFive) {
    //   textScale = 0.9;
    // } else if (d >= sixFive && d <= sixSix) {
    //   textScale = 0.9;
    // } else if (d >= sixSix && d <= sixSeven) {
    //   textScale = 0.9;
    // } else if (d >= sixSeven && d <= sixEight) {
    //   textScale = 0.9;
    // } else if (d >= sixEight && d <= sevenZero) {
    //   textScale = 0.9;
    // } else if (d >= sevenZero && d <= sevenOne) {
    //   textScale = 0.9;
    // } else if (d >= sevenOne && d <= sevenTwo) {
    //   textScale = 0.9;
    // } else if (d >= sevenTwo && d <= sevenThree) {
    //   textScale = 0.9;
    // } else if (d >= sevenThree && d <= sevenFour) {
    //   textScale = 0.9;
    // } else if (d >= sevenFour && d <= sevenFive) {
    //   textScale = 0.9;
    // } else {
    //   textScale = 0.85;
    //   //textScale = 1.0;
    // }

    // print("textScale $textScale");
    return textScale;
  }
}
