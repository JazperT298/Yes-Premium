import 'dart:convert';

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:html/parser.dart';
import 'package:video_player/video_player.dart';
import 'package:yes_premium/models/video_lib.dart';
import 'package:yes_premium/modules/videolab/videolab_api.dart';

class VideolabController extends GetxController {
  final scrollController = TrackingScrollController();
  late VideoPlayerController videoPlayerController;
  var isLoading = true.obs;
  RxList<VideoLibData> videolibList = <VideoLibData>[].obs;
  ChewieController? chewieController;

  @override
  void onInit() {
    super.onInit();
    getSchoolVideoLibrary();
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

  void getSchoolVideoLibrary() async {
    try {
      List result = await VideoLabApi.getSchoolVideoLibrary();
      if (!isLoading.value) isLoading(true);
      for (var i = 0; i < result.length; i++) {
        Map mapping = {
          "VideoLib_ID": result[i]['VideoLib_ID'],
          "School_ID": result[i]['School_ID'],
          "VideoLib_Title": result[i]['VideoLib_Title'],
          "VideoLib_Details": result[i]['VideoLib_Details'],
          "VideoLib_FileName": result[i]['VideoLib_FileName'],
          "VideoLib_FileExt": result[i]['VideoLib_FileExt'],
          "VideoLib_CreatedDate": result[i]['VideoLib_CreatedDate'],
        };

        var jsonStringEncoded = jsonEncode(mapping);
        print('yawa');
        print(jsonStringEncoded);
        videolibList.add(videolibdataFromJson(jsonStringEncoded));
      }
      isLoading(false);
    } catch (e) {
      print('err $e');
    }
  }

  String parseHtmlString(String htmlString) {
    final document = parse(htmlString);
    final String parsedString =
        parse(document.body!.text).documentElement!.text;

    return parsedString;
  }

  Future<void> initializedPlayer() async {
    videoPlayerController =
        VideoPlayerController.asset('assets/images/solo.mp4');
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
