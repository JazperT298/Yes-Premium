import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:chewie/chewie.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:html/parser.dart';
import 'package:video_player/video_player.dart';
import 'package:yes_premium/configs/app_endpoints.dart';
import 'package:yes_premium/models/video_lib.dart';
import 'package:yes_premium/modules/videolab/videolab_api.dart';
import 'package:yes_premium/services/get_storage_service.dart';
import 'package:yes_premium/shared/dialogs.dart';

class VideolabController extends GetxController {
  var titleEditingController = TextEditingController();
  var detailsEditingController = TextEditingController();

  late VideoPlayerController videoPlayerController;
  late Future<void> initializeVideoPlayerFuture;

  RxList<String> attachments = <String>[].obs;
  RxList<String> videoAttachments = <String>[].obs;
  late VideoPlayerController videoController;
  File? image;
  File? video;
  File? imgprofile;
  var filenameimageprofile = "".obs;
  var fileTypeimageprofile = "".obs;
  var filenamevideoprofile = "".obs;
  var fileTypevideoprofile = "".obs;
  var filenamewholeimge = "".obs;

  final scrollController = TrackingScrollController();
  final storageService = Get.find<GetStorageService>();

  var isLoading = true.obs;
  RxList<VideoLibData> videolibList = <VideoLibData>[].obs;
  ChewieController? chewieController;
  int counter = 1;
  Timer? timer;
  var url = '';
  String urls = '';
  @override
  void onInit() {
    super.onInit();
    // videoPlayerController = VideoPlayerController.network(url.value);

    // initializeVideoPlayerFuture = videoPlayerController.initialize();

    getSchoolVideoLibrary();

    //incrementVideoData();
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
      videolibList.clear();
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
        storageService.saveVideoLibItems(jsonStringEncoded);
        videolibList.add(videolibdataFromJson(jsonStringEncoded));

        // for (var category in videolibList) {
        //   urls = category.videoLibFileName!;
        //   initializedPlayer('$photoDir/$urls');
        //   print('YAWA KA $urls');
        // }
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

  Future getVideo() async {
    FilePickerResult? pickedFile = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['mp4', 'flv', 'wmv'],
    );
    print("FilePickerResult Response : ${pickedFile.toString()}");

    if (pickedFile != null) {
      imgprofile = File(pickedFile.files.single.path!);

      attachments.add(pickedFile.files.single.path!);

      try {
        video = imgprofile;
        String filenamewholeimge = imgprofile!.path.split('/').last;
        var splitTheimage = filenamewholeimge.split('.');
        filenamevideoprofile.value = splitTheimage[0];
        fileTypevideoprofile.value = splitTheimage[1];
        update();
      } catch (e) {
        print("'video' path errror");
      }
    } else {}
  }

  void uploadVideoLibrary(
      context, fileToUpload, title, details, schoolId) async {
    try {
      var result = await VideoLabApi.uploadVideoLibrary(
          fileToUpload, title, details, schoolId);
      if (result == "Successfully Uploaded") {
        Get.back();
        Dialogs.showMyToast(context, "Video successfully posted!");
        filenamevideoprofile.value = '';
        fileTypevideoprofile.value = '';
        detailsEditingController.text = "";
        filenameimageprofile.value = "";
        fileTypeimageprofile.value = "";
        attachments.length = 0;
      } else {
        Dialogs.showMyToast(context, "Error posting an video  !");
      }
    } catch (e) {
      print('err $e');
    } finally {
      getSchoolVideoLibrary();
    }
  }

  void deleteVideoLibrary(videoLibId, schoolId) async {
    try {
      await VideoLabApi.deleteVideoLibrary(videoLibId, schoolId);
    } catch (error) {
      print("deleteStoreRider $error");
    } finally {
      //HomeApi.getAllAnnouncementBySchool();
      getSchoolVideoLibrary();
    }
  }

  Future<void> initializedPlayer(url) async {
    videoPlayerController = VideoPlayerController.network(url);
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
