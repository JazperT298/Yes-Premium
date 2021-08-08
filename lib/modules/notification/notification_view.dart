import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yes_premium/modules/notification/notification_controller.dart';
import 'package:yes_premium/routes/app_routes.dart';
import 'package:sizer/sizer.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NotificationController());
    return CustomScrollView(
      controller: controller.scrollController,
      slivers: [
        SliverAppBar(
          brightness: Brightness.light,
          backgroundColor: Colors.white,
          title: Text(
            'Notification',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp),
          ),
          centerTitle: false,
          floating: true,
          actions: [
            Container(
              margin: EdgeInsets.only(top: 7.0, bottom: 7.0, right: 7.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey.shade300,
              ),
              child: IconButton(
                onPressed: () => Get.toNamed(AppRoutes.SEARCH),
                icon: Icon(
                  Icons.search_rounded,
                  size: 30,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
