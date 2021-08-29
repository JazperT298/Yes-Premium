import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:html/parser.dart';
import 'package:yes_premium/models/announcement.dart';
import 'package:yes_premium/modules/home/home_api.dart';
import 'package:yes_premium/services/get_storage_service.dart';
import 'package:yes_premium/shared/dialogs.dart';

class HomeController extends GetxController {
  final scrollController = TrackingScrollController();
  final GlobalKey<ScaffoldState> scaffoldkey = new GlobalKey<ScaffoldState>();
  var isLoading = true.obs;
  RxList<AnnouncementData> listofAnnouncement = <AnnouncementData>[].obs;
  final storageService = Get.find<GetStorageService>();
  RxString schoolAvatar = ''.obs;
  int counter = 1;
  Timer? timer;

  @override
  void onInit() async {
    super.onInit();
    getAllAnnouncementBySchool();
    // Get.find<VideolabController>().getSchoolVideoLibrary();
    //incrementAnnoucementData();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> getAllAnnouncementBySchool() async {
    try {
      var result = await HomeApi.getAllAnnouncementBySchool();
      listofAnnouncement.clear();
      if (result == 'Authorization has been denied for this request.') {
        // print('YAWA {}');
        Future.delayed(Duration.zero, () {
          Dialogs.showSessionExpire(Get.context);
        });
      } else {
        if (!isLoading.value) isLoading(true);
        for (var i = 0; i < result.length; i++) {
          Map mapping = {
            "Announce_ID": result[i]['Announce_ID'],
            "Announce_School_ID": result[i]['Announce_School_ID'],
            "Announce_Details": result[i]['Announce_Details'],
            "Announce_File": result[i]['Announce_File'],
            "Announce_FileWidth": result[i]['Announce_FileWidth'],
            "Announce_FileHeight": result[i]['Announce_FileHeight'],
            "Announce_CreatedDate": result[i]['Announce_CreatedDate'],
            "Announce_FileExt": result[i]['Announce_FileExt'],
          };

          var jsonStringEncoded = jsonEncode(mapping);
          storageService.saveAnnouncementItems(jsonStringEncoded);
          listofAnnouncement.add(announcementdataFromJson(jsonStringEncoded));
        }
      }
      isLoading(false);
    } catch (e) {
      print('err $e');
    }
  }

  // incrementAnnoucementData() async {
  //   Timer.periodic(Duration(seconds: 3), (timer) {
  //     print('YAWA HOME ${listofAnnouncement.length}');
  //     if (counter == 10) {
  //       timer.cancel();
  //     } else {
  //       counter++;
  //       getAllAnnouncementBySchool(counter);
  //     }
  //   });
  // }

  String parseHtmlString(String htmlString) {
    final document = parse(htmlString);
    final String parsedString = parse(document.body!.text).documentElement!.text;

    return parsedString;
  }
}
