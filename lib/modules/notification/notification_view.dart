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
    return SafeArea(
      child: CustomScrollView(
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
            automaticallyImplyLeading: false,
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
          SliverToBoxAdapter(
            // final VideoLab post = controller.videoList[index];
            child: Obx(
              () => controller.isLoading.value &&
                      controller.notificationList.length <= 0
                  ? Container(
                      height: 30.h,
                      color: Colors.grey[200],
                    )
                  : ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: controller.notificationList.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: Container(
                            margin: EdgeInsets.symmetric(vertical: 5.0),
                            padding: EdgeInsets.symmetric(vertical: 8.0),
                            child: Column(
                              children: [
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 12.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      //Post Header
                                      Row(
                                        children: [
                                          ClipOval(
                                            child: Image.asset(
                                              '${controller.notificationList[index].image}',
                                              height: 40.0,
                                              width: 40.0,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 8.0,
                                          ),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  '${controller.notificationList[index].content}',
                                                  style: TextStyle(
                                                    fontSize: 11.sp,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      '${controller.notificationList[index].time}  •  ',
                                                      style: TextStyle(
                                                        color: Colors.grey[600],
                                                        fontSize: 9.sp,
                                                      ),
                                                    ),
                                                    Icon(
                                                      Icons.public,
                                                      color: Colors.grey[400],
                                                      size: 12.0,
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                          IconButton(
                                            icon: const Icon(Icons.more_horiz),
                                            onPressed: () => {
                                              print(
                                                  '${controller.notificationList.length}'),
                                            },
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
