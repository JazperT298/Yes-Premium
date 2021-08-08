import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yes_premium/modules/account/account_view.dart';
import 'package:yes_premium/modules/files/files_view.dart';
import 'package:yes_premium/modules/home/home_view.dart';
import 'package:yes_premium/modules/notification/notification_view.dart';
import 'package:yes_premium/modules/videolab/videolab_view.dart';

class BottomNavController extends GetxController {
  var isLoading = true.obs;
  var timeout = false.obs;

  RxInt selectedIndex = 0.obs;

  List<Widget> bodyContext = [
    HomeView(),
    VideoLabView(),
    FilesView(),
    NotificationView(),
    AccountView(),
  ];
  List<BottomNavigationBarItem> navItem = [
    BottomNavigationBarItem(
      icon: Icon(
        Icons.home,
        size: 30,
      ),
      label: '',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.video_label,
        size: 30,
      ),
      label: '',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.note,
        size: 30,
      ),
      label: '',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.notifications,
        size: 30,
      ),
      label: '',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.dehaze,
        size: 30,
      ),
      label: '',
    ),
  ];
}
