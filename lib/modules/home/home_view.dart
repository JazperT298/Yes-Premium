import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:yes_premium/configs/app_endpoints.dart';
import 'package:yes_premium/modules/announcement/announcement_controller.dart';
import 'package:yes_premium/modules/home/home_controller.dart';
import 'package:yes_premium/modules/home/home_video_widget.dart';
import 'package:yes_premium/modules/videolab/videolab_controller.dart';
import 'package:yes_premium/routes/app_routes.dart';
import 'package:yes_premium/services/get_storage_service.dart';
import 'package:yes_premium/shared/dialogs.dart';

class HomeView extends GetView<HomeController> {
  final videoController = Get.put(VideolabController());
  @override
  Widget build(BuildContext context) {
    var announceController = Get.put(AnnouncementController());
    var controller = Get.put(HomeController());
    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () {
            return Future.delayed(
              Duration(seconds: 2),
              () async {
                await controller.getAllAnnouncementBySchool();
              },
            );
          },
          child: CustomScrollView(
            controller: videoController.scrollController,
            slivers: [
              SliverAppBar(
                brightness: Brightness.light,
                backgroundColor: Colors.white,
                title: Text(
                  'Yestech Premium',
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp),
                ),
                centerTitle: false,
                floating: true,
                automaticallyImplyLeading: false,
                actions: [
                  Container(
                    margin: EdgeInsets.only(top: 6.0, bottom: 6.0, right: 6.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey.shade300,
                    ),
                    child: IconButton(
                      onPressed: () {
                        Get.toNamed(AppRoutes.SEARCH);
                      },
                      icon: Icon(
                        Icons.search_rounded,
                        size: 25,
                      ),
                    ),
                  ),
                  // if (GetStorageService.c.appdata.read('userName') != null)
                  Container(
                    margin: EdgeInsets.only(top: 6.0, bottom: 6.0, right: 6.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey.shade300,
                    ),
                    child: IconButton(
                      onPressed: () {
                        print(
                            '${Get.find<GetStorageService>().appdata.read('UserId')}');
                        print(
                            '${Get.find<GetStorageService>().appdata.read('SchoolId')}');
                        print(
                            '${Get.find<GetStorageService>().appdata.read('access_token')}');
                      },
                      icon: Icon(
                        Icons.chat_bubble_outlined,
                        size: 25,
                      ),
                    ),
                  ),
                  // Container(
                  //   margin: EdgeInsets.only(top: 6.0, bottom: 6.0, right: 6.0),
                  //   decoration: BoxDecoration(
                  //     shape: BoxShape.circle,
                  //     color: Colors.grey.shade300,
                  //   ),
                  //   child: IconButton(
                  //     onPressed: () => HomeApi.getAllAnnouncementBySchool(),
                  //     icon: Icon(
                  //       Icons.dehaze,
                  //       size: 25,
                  //     ),
                  //   ),
                  // ),
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
                            Get.find<GetStorageService>()
                                        .appdata
                                        .read('Roles') ==
                                    'SchoolAdmin'
                                ? GestureDetector(
                                    onTap: () => Get.toNamed(AppRoutes.PROFILE),
                                    child: Container(
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
                                  )
                                : GestureDetector(
                                    onTap: () => Get.toNamed(AppRoutes.PROFILE),
                                    child: Container(
                                      width: 10.w,
                                      height: 7.h,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: NetworkImage(
                                              "$photoDir/${Get.find<GetStorageService>().appdata.read('Avatar')}"),
                                          fit: BoxFit.cover,
                                        ),
                                        shape: BoxShape.circle,
                                      ),
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
                            GestureDetector(
                              onTap: () => Get.toNamed(AppRoutes.ANNOUNCEMENT),
                              child: Container(
                                width: 79.0.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(50.0),
                                  ),
                                  border: Border.all(
                                    color: Colors.grey.shade300,
                                  ),
                                ),
                                padding: EdgeInsets.only(
                                  top: 1.h,
                                  bottom: 1.h,
                                  left: 3.w,
                                ),
                                child: Text(
                                  'Write something here...',
                                  style: TextStyle(
                                    fontSize: 11.sp,
                                  ),
                                ),
                              ),
                            ),
                            // Expanded(
                            //   child: TextField(
                            //     decoration: InputDecoration.collapsed(
                            //       hintText: 'Write something here...',
                            //     ),
                            //   ),
                            // ),
                          ],
                        ),
                        Divider(
                          height: 10.0,
                          thickness: 0.5,
                          color: Colors.grey.shade300,
                        ),
                        Container(
                          height: 40.0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ElevatedButton.icon(
                                onPressed: () {
                                  announceController.getVideo();
                                  Get.toNamed(AppRoutes.ANNOUNCEMENT);
                                },
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
                                color: Colors.grey.shade300,
                              ),
                              ElevatedButton.icon(
                                onPressed: () {
                                  announceController.getImage();
                                  Get.toNamed(AppRoutes.ANNOUNCEMENT);
                                },
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
              SliverToBoxAdapter(
                child: Obx(
                  () => controller.isLoading.value &&
                          controller.listofAnnouncement.length <= 0
                      ? Container(
                          height: 30.h,
                          color: Colors.grey[200],
                        )
                      : ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: controller.listofAnnouncement.length,
                          itemBuilder: (context, index) {
                            return Card(
                              child: Container(
                                margin: EdgeInsets.symmetric(vertical: 5.0),
                                padding: EdgeInsets.symmetric(vertical: 8.0),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 12.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        children: [
                                          //Post Header
                                          Row(
                                            children: [
                                              ClipOval(
                                                child: Image.network(
                                                  '$photoDir/${Get.find<GetStorageService>().appdata.read('SchoolAvatar')}',
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
                                                      '${Get.find<GetStorageService>().appdata.read('School')}',
                                                      style: TextStyle(
                                                        fontSize: 11.sp,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                    ),
                                                    Row(
                                                      children: [
                                                        Text(
                                                          '${controller.listofAnnouncement[index].announceCreatedDate}  •  ',
                                                          style: TextStyle(
                                                            color: Colors
                                                                .grey[600],
                                                            fontSize: 9.sp,
                                                          ),
                                                        ),
                                                        Icon(
                                                          Icons.public,
                                                          color:
                                                              Colors.grey[400],
                                                          size: 12.0,
                                                        ),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ),
                                              deleteButton(
                                                  context,
                                                  controller
                                                      .listofAnnouncement[index]
                                                      .announceID,
                                                  controller
                                                      .listofAnnouncement[index]
                                                      .announceSchoolID),
                                              // IconButton(
                                              //   icon: Icon(
                                              //     Icons.delete,
                                              //     color: Colors.red,
                                              //   ),
                                              //   onPressed: () => {
                                              //     Dialogs.showDelete(
                                              //         context,
                                              //         controller
                                              //             .listofAnnouncement[
                                              //                 index]
                                              //             .announceID,
                                              //         controller
                                              //             .listofAnnouncement[
                                              //                 index]
                                              //             .announceSchoolID),
                                              //     // controller.showPopupMenu(
                                              //     //     context, index),
                                              //     print(
                                              //         '${controller.listofAnnouncement[index].announceFile}'),
                                              //     print(
                                              //         '${controller.listofAnnouncement[index].announceFileExt}'),
                                              //     print(
                                              //         '${controller.listofAnnouncement.length}'),
                                              //     print(
                                              //         '${Get.find<GetStorageService>().appdata.read('UserId')} '),
                                              //     print(
                                              //         '${Get.find<GetStorageService>().appdata.read('SchoolId')} '),
                                              //     print(
                                              //         '${Get.find<GetStorageService>().appdata.read('access_token')} '),
                                              //   },
                                              // ),
                                            ],
                                          ),

                                          //Post caption
                                          Text(
                                            '${controller.parseHtmlString(controller.listofAnnouncement[index].announceDetails!)}',
                                            style: TextStyle(fontSize: 11.sp),
                                          ),

                                          controller.listofAnnouncement[index]
                                                          .announceFile !=
                                                      null ||
                                                  controller
                                                          .listofAnnouncement[
                                                              index]
                                                          .announceFile !=
                                                      ""
                                              ? SizedBox.shrink()
                                              : SizedBox(
                                                  height: 6.0,
                                                ),
                                        ],
                                      ),
                                    ),
                                    controller.listofAnnouncement[index].announceFile != "" &&
                                                controller.listofAnnouncement[index].announceFileExt ==
                                                    ".jpg" ||
                                            controller.listofAnnouncement[index]
                                                    .announceFileExt ==
                                                ".jpeg" ||
                                            controller.listofAnnouncement[index]
                                                    .announceFileExt ==
                                                ".png"
                                        ? Image.network('$photoDir/${controller.listofAnnouncement[index].announceFile}')
                                            .paddingSymmetric(vertical: 8.0)
                                        : controller.listofAnnouncement[index]
                                                            .announceFile !=
                                                        "" &&
                                                    controller
                                                            .listofAnnouncement[
                                                                index]
                                                            .announceFileExt ==
                                                        ".mp4" ||
                                                controller.listofAnnouncement[index].announceFileExt ==
                                                    ".flv" ||
                                                controller
                                                        .listofAnnouncement[index]
                                                        .announceFileExt ==
                                                    ".wmv"
                                            ? Container(
                                                width: double.infinity,
                                                height: 345.0,
                                                child: HomeVideoWidget(
                                                    play: true,
                                                    url:
                                                        '$photoDir/${controller.listofAnnouncement[index].announceFile}'),
                                              )
                                            : SizedBox.shrink(),
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
        ),
      ),
    );
  }

  Widget deleteButton(context, announceID, schoolID) {
    final List<String> _choices = <String>["Delete"];

    void choiceAction(String choice) {
      if (choice == "Delete") {
        //Remove
        Dialogs.showDeleteAnnouncement(context, announceID, schoolID);
      }
    }

    return PopupMenuButton<String>(
      onSelected: choiceAction,
      itemBuilder: (BuildContext context) {
        return _choices.map((String choice) {
          return PopupMenuItem<String>(
            value: choice,
            child: Text(choice),
          );
        }).toList();
      },
    );
  }
}
