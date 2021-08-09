import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:html/parser.dart';
import 'package:yes_premium/models/notes.dart';
import 'package:yes_premium/modules/files/files_api.dart';
import 'package:yes_premium/services/get_storage_service.dart';

class FilesController extends GetxController {
  final scrollController = TrackingScrollController();
  final storageService = Get.find<GetStorageService>();
  RxList<NotesData> notesdataList = <NotesData>[].obs;

  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    getUserNotesLists();
  }

  @override
  void onReady() {
    super.onReady();
  }

  void getUserNotesLists() async {
    try {
      List result = await FilesApi.getUserNotesLists();
      if (!isLoading.value) isLoading(true);
      for (var i = 0; i < result.length; i++) {
        Map mapping = {
          "Notes_ID": result[i]['Notes_ID'],
          "User_ID": result[i]['User_ID'],
          "School_ID": result[i]['School_ID'],
          "Notes_Title": result[i]['Notes_Title'],
          "Notes_Desc": result[i]['Notes_Desc'],
          "Notes_FileName": result[i]['Notes_FileName'],
          "Notes_File": result[i]['Notes_File'],
          "Notes_FileExt": result[i]['Notes_FileExt'],
          "Notes_CreatedDate": result[i]['Notes_CreatedDate'],
        };

        var jsonStringEncoded = jsonEncode(mapping);
        storageService.saveNotesItems(jsonStringEncoded);
        notesdataList.add(notesdataFromJson(jsonStringEncoded));
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
