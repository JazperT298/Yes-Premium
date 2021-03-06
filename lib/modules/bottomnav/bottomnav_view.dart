import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yes_premium/modules/account/account_view.dart';
import 'package:yes_premium/modules/bottomnav/bottomnav_controller.dart';
import 'package:sizer/sizer.dart';
import 'package:yes_premium/modules/files/files_view.dart';
import 'package:yes_premium/modules/home/home_view.dart';
import 'package:yes_premium/modules/notification/notification_view.dart';
import 'package:yes_premium/modules/videolab/videolab_view.dart';
import 'package:yes_premium/shared/dialogs.dart';

class BottomNavView extends GetView<BottomNavController> {
  BottomNavView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(BottomNavController());
    final theme = Theme.of(context);

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
    return Scaffold(
      body: WillPopScope(
        onWillPop: () => Dialogs.onBackPressedExit(context),
        child: Obx(
          () => bodyContext[controller.selectedIndex.value],
        ),
      ),
      bottomNavigationBar: Obx(
        () => Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            BottomNavigationBar(
              items: navItem,
              iconSize: 22,
              elevation: 3.0,
              selectedFontSize: 11.sp,
              unselectedFontSize: 11.sp,
              backgroundColor: Colors.white,
              currentIndex: controller.selectedIndex.value,
              onTap: (index) => controller.selectedIndex.value = index,
              selectedItemColor: Colors.green,
              unselectedItemColor: Colors.grey,
              showUnselectedLabels: true,
              unselectedLabelStyle: TextStyle(
                fontFamily: theme.textTheme.headline3!.fontFamily,
                fontSize: 11,
              ),
              selectedLabelStyle: TextStyle(
                fontFamily: theme.textTheme.headline3!.fontFamily,
                fontSize: 11,
              ),
              type: BottomNavigationBarType.fixed,
            ),
          ],
        ),
      ),
    );
  }
}
