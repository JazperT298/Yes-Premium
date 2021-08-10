import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:yes_premium/configs/app_endpoints.dart';
import 'package:yes_premium/modules/videolab/videolab_controller.dart';
import 'package:sizer/sizer.dart';
import 'package:yes_premium/modules/videolab/videolab_widget.dart';
import 'package:yes_premium/routes/app_routes.dart';
import 'package:yes_premium/services/get_storage_service.dart';

class VideoLabView extends StatelessWidget {
  const VideoLabView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VideolabController());
    return SafeArea(
      child: CustomScrollView(
        controller: controller.scrollController,
        slivers: [
          SliverAppBar(
            brightness: Brightness.light,
            backgroundColor: Colors.white,
            title: Text(
              'Videos',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp),
            ),
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
              Container(
                margin: EdgeInsets.only(top: 7.0, bottom: 7.0, right: 7.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey.shade300,
                ),
                child: IconButton(
                  onPressed: () {
                    //controller.isSearchClick.value = true;
                  }, //=> Get.toNamed(AppRoutes.ANNOUNCEMENT),
                  icon: Icon(
                    Icons.add_to_drive_sharp,
                    size: 30,
                  ),
                ),
              )
            ],
            centerTitle: false,
            floating: true,
          ),
          SliverToBoxAdapter(
            child: Obx(
              () => controller.isLoading.value &&
                      controller.videolibList.length <= 0
                  ? Container(
                      height: 30.h,
                      color: Colors.grey[200],
                    )
                  : ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: controller.videolibList.length,
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
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      '${controller.videolibList[index].videoLibCreatedDate}  •  ',
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
                                              // print(
                                              //     '${controller.videolibList[index].announceFile}'),
                                              print(
                                                  '${controller.videolibList.length}'),
                                              // print(
                                              //     '${Get.find<GetStorageService>().appdata.read('UserId')} '),
                                              // print(
                                              //     '${Get.find<GetStorageService>().appdata.read('access_token')} '),
                                            },
                                          ),
                                        ],
                                      ),
                                      //Post caption
                                      Text(
                                        '${controller.parseHtmlString(controller.videolibList[index].videoLibTitle!)}',
                                        style: TextStyle(fontSize: 11.sp),
                                      ),

                                      controller.videolibList[index]
                                                      .videoLibFileName !=
                                                  null ||
                                              controller.videolibList[index]
                                                      .videoLibFileName !=
                                                  ""
                                          ? SizedBox.shrink()
                                          : SizedBox(
                                              height: 6.0,
                                            ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: double.infinity,
                                  height: 345.0,
                                  child: VideoWidget(
                                      play: true,
                                      url:
                                          '$photoDir/${controller.videolibList[index].videoLibFileName}'),
                                )
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
