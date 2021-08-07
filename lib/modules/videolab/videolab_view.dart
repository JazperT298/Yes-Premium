import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import 'package:yes_premium/modules/videolab/videolab_controller.dart';
import 'package:sizer/sizer.dart';
import 'package:yes_premium/modules/videolab/videolab_widget.dart';
import 'package:yes_premium/routes/app_routes.dart';

class VideoLabView extends StatelessWidget {
  const VideoLabView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VideolabController());
    return CustomScrollView(
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
          ],
          centerTitle: true,
          floating: true,
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              final VideoLab post = controller.videoList[index];
              return ListView.separated(
                shrinkWrap: true,
                cacheExtent: 1000,
                physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                key: PageStorageKey(controller.videoList[index].video),
                addAutomaticKeepAlives: true,
                itemCount: controller.videoList.isEmpty
                    ? 0
                    : controller.videoList.length,
                itemBuilder: (BuildContext context, int index) => Container(
                  width: double.infinity,
                  height: 354.0,
                  alignment: Alignment.center,
                  child: Container(
                      key: new PageStorageKey(
                        "keydata$index",
                      ),
                      child: Stack(
                        children: [
                          VideoWidget(
                                  play: true,
                                  url: '${controller.videoList[index].video}')
                              .marginOnly(top: 20.0),
                          Positioned(
                            left: 10,
                            top: 5,
                            child: Text(
                              '${controller.videoList[index].title}',
                              style: TextStyle(
                                fontSize: 11.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      )),
                ),
                separatorBuilder: (context, index) {
                  return Divider();
                },
              );
            },
            childCount: controller.videoList.length,
          ),
        ),
      ],
    );
  }
}
