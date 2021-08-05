import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import 'package:yes_premium/modules/videolab/videolab_controller.dart';
import 'package:sizer/sizer.dart';

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
          leading: Container(
            margin: EdgeInsets.only(top: 7.0, bottom: 7.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey.shade300,
            ),
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.close,
                size: 30,
              ),
            ),
          ),
          title: Text(
            'Videos',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp),
          ),
          centerTitle: true,
          floating: true,
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              final VideoLab post = controller.videoList[index];
              return Card(
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 5.0),
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: controller.chewieController != null &&
                          controller.chewieController!.videoPlayerController
                              .value.isInitialized
                      ? Chewie(
                          controller: controller.chewieController!,
                        )
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircularProgressIndicator(),
                            SizedBox(
                              height: 10.0,
                            ),
                            Text('Loading')
                          ],
                        ),
                ),
              );
            },
            childCount: controller.videoList.length,
          ),
        ),
      ],
    );
  }
}
