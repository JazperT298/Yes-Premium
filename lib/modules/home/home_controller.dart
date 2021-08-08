import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:encrypt/encrypt.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:html/parser.dart';
import 'package:yes_premium/models/announcement.dart';
import 'package:yes_premium/modules/home/home_api.dart';
import 'package:yes_premium/services/get_storage_service.dart';

class HomeController extends GetxController {
  // final scrollController = TrackingScrollController();
  var isLoading = true.obs;
  RxList<AnnouncementData> listofAnnouncement = <AnnouncementData>[].obs;

  RxString schoolAvatar = ''.obs;

  @override
  void onInit() {
    super.onInit();
    getAllAnnouncementBySchool();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void getAllAnnouncementBySchool() async {
    try {
      List result = await HomeApi.getAllAnnouncementBySchool();
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
        print('yawa');
        print(jsonStringEncoded);
        listofAnnouncement.add(announcementdataFromJson(jsonStringEncoded));
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
}
