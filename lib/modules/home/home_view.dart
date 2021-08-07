import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:yes_premium/configs/app_endpoints.dart';
import 'package:yes_premium/modules/home/home_controller.dart';
import 'package:yes_premium/services/get_storage_service.dart';
import 'package:yes_premium/shared/dialogs.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    return CustomScrollView(
      controller: controller.scrollController,
      slivers: [
        SliverAppBar(
          brightness: Brightness.light,
          backgroundColor: Colors.white,
          title: Text(
            'Yestech Premium',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp),
          ),
          centerTitle: false,
          floating: true,
          actions: [
            Container(
              margin: EdgeInsets.only(top: 7.0, bottom: 7.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey.shade300,
              ),
              child: IconButton(
                onPressed: () {
                  print(
                      '${Get.find<GetStorageService>().appdata.read('SchoolAvatar')}');
                },
                icon: Icon(
                  Icons.search_rounded,
                  size: 30,
                ),
              ),
            ),
            // if (GetStorageService.c.appdata.read('userName') != null)
            Container(
              margin: EdgeInsets.only(top: 7.0, bottom: 7.0, right: 7.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey.shade300,
              ),
              child: IconButton(
                onPressed: () => Dialogs.showLogout(context),
                icon: Icon(
                  Icons.chat_bubble_outlined,
                  size: 30,
                ),
              ),
            ),
          ],
        ),
        SliverToBoxAdapter(
          child: Card(
            child: Container(
              // height: 120.0,
              // width: double.infinity,
              padding: EdgeInsets.fromLTRB(12.0, 8.0, 12.0, 0.0),
              // color: Colors.red,
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        width: 10.w,
                        height: 7.h,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                                "$photoDir/${Get.find<GetStorageService>().appdata.read('SchoolAvatar')}"),
                            fit: BoxFit.cover,
                          ),
                          shape: BoxShape.circle,
                        ),
                      ),
                      // Image.asset(
                      //   'assets/images/user_placeholder.png',
                      //   width: 40.0,
                      //   height: 40.0,
                      // ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration.collapsed(
                            hintText: 'Write something here...',
                          ),
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    height: 10.0,
                    thickness: 0.5,
                  ),
                  Container(
                    height: 40.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton.icon(
                          onPressed: () => print('Video'),
                          icon: Icon(
                            Icons.videocam,
                            color: Colors.red,
                          ),
                          label: Text(
                            'Video',
                            style: TextStyle(color: Colors.black),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            elevation: 0.0,
                            shadowColor: Colors.transparent,
                          ),
                        ),
                        VerticalDivider(
                          width: 8.0,
                        ),
                        ElevatedButton.icon(
                          onPressed: () => print('Photo'),
                          icon: Icon(
                            Icons.photo_library,
                            color: Colors.green,
                          ),
                          label: Text(
                            'Photo',
                            style: TextStyle(color: Colors.black),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            elevation: 0.0,
                            shadowColor: Colors.transparent,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              final Post post = controller.postList[index];
              return Card(
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 5.0),
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            //Post Header
                            Row(
                              children: [
                                ClipOval(
                                  child: Image.asset(
                                    '${controller.postList[index].image}',
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
                                        '${controller.postList[index].name}',
                                        style: TextStyle(
                                          fontSize: 11.sp,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            '${controller.postList[index].timeAgo}  •  ',
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
                                  onPressed: () => print('More'),
                                ),
                              ],
                            ),
                            //Post caption
                            Text(
                              '${controller.postList[index].caption} ',
                              style: TextStyle(fontSize: 11.sp),
                            ),
                            controller.postList[index].imageUrl != ''
                                ? SizedBox.shrink()
                                : SizedBox(height: 6.0),
                          ],
                        ),
                      ),
                      controller.postList[index].imageUrl != ''
                          ? Image.asset(
                                  '${controller.postList[index].imageUrl}')
                              .paddingSymmetric(vertical: 8.0)
                          : SizedBox.shrink(),
                    ],
                  ),
                ),
              );
            },
            childCount: controller.postList.length,
          ),
        ),
      ],
    );
  }
}
