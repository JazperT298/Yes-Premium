import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class VideolabController extends GetxController {
  final scrollController = TrackingScrollController();
  late VideoPlayerController videoPlayerController;
  ChewieController? chewieController;
  RxList<VideoLab> videoList = <VideoLab>[
    VideoLab(
      title: 'Tony Atillo Solo',
      video: 'assets/images/solo.mp4',
    ),
    VideoLab(
      title: 'TMarty Friedman Solo',
      video: 'assets/images/solo.mp4',
    ),
    VideoLab(
      title: 'John Petrucci Solo',
      video: 'assets/images/solo.mp4',
    ),
  ].obs;

  @override
  void onInit() {
    super.onInit();
    initializedPlayer();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    videoPlayerController.dispose();
    chewieController!.dispose();
  }

  Future<void> initializedPlayer() async {
    videoPlayerController =
        VideoPlayerController.asset('${videoList[0].video}');
    await Future.wait([videoPlayerController.initialize()]);
    chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      autoPlay: true,
      looping: true,
      materialProgressColors: ChewieProgressColors(
        playedColor: Colors.red,
        handleColor: Colors.cyanAccent,
        backgroundColor: Colors.yellow,
        bufferedColor: Colors.lightGreen,
      ),
      placeholder: Container(
        color: Colors.greenAccent,
      ),
      autoInitialize: true,
    );
    update();
  }
}

class VideoLab {
  String? title;
  String? video;

  VideoLab({this.title, this.video});
}
