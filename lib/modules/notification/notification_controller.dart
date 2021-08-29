import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:html/parser.dart';

class NotificationController extends GetxController {
  final scrollController = TrackingScrollController();
  var isLoading = true.obs;
  @override
  void onInit() {
    super.onInit();
    if (!isLoading.value) isLoading(true);
  }

  RxList<Notifications> notificationList = <Notifications>[
    Notifications(
      image: 'assets/images/mina.jpg',
      content: 'You Shared a PDF file to Kirk Hammett.',
      time: 'Mon at 4:00PM',
    ),
    Notifications(
      image: 'assets/images/sana.jpg',
      content: 'Kim Tae Hee Shared a Word file to you.',
      time: 'Tue at 2:45PM',
    ),
    Notifications(
      image: 'assets/images/cute.jpg',
      content: 'You Shared a Excel file to Marty Friedman.',
      time: 'Wed at 9:10AM',
    ),
    Notifications(
      image: 'assets/images/nayeon.jpg',
      content: 'Im Nayeon Shared a PDF file to you.',
      time: 'Thu at 7:20PM',
    ),
    Notifications(
      image: 'assets/images/sherry.jpg',
      content: 'You Shared a Word file to Dave Msutaine.',
      time: 'Fri at 3:50PM',
    ),
    Notifications(
      image: 'assets/images/soo.jpg',
      content: 'Soo In Lee Shared a POWERPOINT file to you.',
      time: 'Sat at 8:15AM',
    ),
  ].obs;

  String parseHtmlString(String htmlString) {
    final document = parse(htmlString);
    final String parsedString = parse(document.body!.text).documentElement!.text;

    return parsedString;
  }
}

class Notifications {
  String? image;
  String? content;
  String? time;

  Notifications({this.image, this.content, this.time});
}
