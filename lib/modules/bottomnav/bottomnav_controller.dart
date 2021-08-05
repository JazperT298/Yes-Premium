import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yes_premium/modules/educatorlist/educatorlist_view.dart';
import 'package:yes_premium/modules/home/home_view.dart';
import 'package:yes_premium/modules/meeting/facultymeeting_view.dart';
import 'package:yes_premium/modules/studentlist/studentlist_view.dart';
import 'package:yes_premium/modules/videolab/videolab_view.dart';

class BottomNavController extends GetxController {
  var isLoading = true.obs;
  var timeout = false.obs;

  RxInt selectedIndex = 0.obs;

  List<Widget> bodyContext = [
    HomeView(),
    VideoLabView(),
    FacultyMeetingView(),
    EducatorListView(),
    StudentListView(),
  ];
  List<BottomNavigationBarItem> navItem = [
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'Annoucements',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.video_label),
      label: 'Video Lab',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.chat_bubble),
      label: 'Faculty Meeting',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person),
      label: 'Educator List',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person),
      label: 'Student List',
    ),
  ];
  void resetIndex(int index) {
    selectedIndex.value = index;
    update();
  }
}
