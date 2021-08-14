import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:html/parser.dart';
import 'package:yes_premium/models/notes.dart';
import 'package:yes_premium/modules/files/files_api.dart';
import 'package:yes_premium/services/get_storage_service.dart';
import 'package:yes_premium/shared/dialogs.dart';

class FilesController extends GetxController {
  final scrollController = TrackingScrollController();
  final storageService = Get.find<GetStorageService>();
  RxList<NotesData> notesdataList = <NotesData>[].obs;

  var titleEditingController = TextEditingController();
  var detailsEditingController = TextEditingController();
  RxList<String> attachments = <String>[].obs;
  RxList<String> videoAttachments = <String>[].obs;
  NotesData? notesData;
  File? file;
  File? imgprofile;

  var filenameprofile = "".obs;
  var fileTypeprofile = "".obs;
  var splitTheimage;
  var isLoading = true.obs;
  int counter = 1;
  Timer? timer;
  @override
  void onInit() {
    super.onInit();
    getUserNotesLists();
    // incrementNotesData();
  }

  @override
  void onReady() {
    super.onReady();
  }

  void getUserNotesLists() async {
    try {
      List result = await FilesApi.getUserNotesLists();
      notesdataList.clear();
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

  Future getFiles() async {
    FilePickerResult? pickedFile = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pptx', 'docx', 'pdf', 'xlsx'],
    );
    print("FilePickerResult Response : ${pickedFile.toString()}");

    if (pickedFile != null) {
      imgprofile = File(pickedFile.files.single.path!);

      attachments.add(pickedFile.files.single.path!);

      try {
        file = imgprofile;
        String filenamewholeimge = imgprofile!.path.split('/').last;
        splitTheimage = filenamewholeimge.split('.');
        filenameprofile.value = splitTheimage[0];
        fileTypeprofile.value = splitTheimage[1];
        update();
      } catch (e) {
        print("'File' path errror");
      }
    } else {}
  }

  void mapNotesData(context) async {
    if (titleEditingController.text.isNotEmpty) {
      // Map map = {
      //   "Notes_ID": "2",
      //   "User_ID": Get.find<GetStorageService>().appdata.read('UserId'),
      //   "School_ID": Get.find<GetStorageService>().appdata.read('SchoolId'),
      //   "Notes_Title": titleEditingController.text,
      //   "Notes_Desc": detailsEditingController.text,
      //   "Notes_FileName": splitTheimage,
      //   "Notes_File": file,
      // };
      // addUserNotes(context, jsonEncode(map));
      notesData!.notesID =
          Get.find<GetStorageService>().appdata.read('UserId') ?? null;
      notesData!.userID =
          Get.find<GetStorageService>().appdata.read('UserId') ?? null;
      print('BWESIT KA  ${notesData!.userID}');
      notesData!.schoolID =
          Get.find<GetStorageService>().appdata.read('SchoolId') ?? null;
      notesData!.notesTitle = titleEditingController.text;
      notesData!.notesDesc = detailsEditingController.text;
      notesData!.notesFileName = splitTheimage ?? null;
      notesData!.notesFile = file ?? null;

      addUserNotes(context, notesData);
    }

    //addUserNotes(context, notesData);
  }

  void addUserNotes(context, notesData) async {
    try {
      var result = await FilesApi.addUserNotes(notesData);
      if (result == "Success") {
        Get.back();
        Dialogs.showMyToast(context, "Annoucenment successfully posted!");
        filenameprofile.value = '';
        fileTypeprofile.value = '';
        detailsEditingController.text = "";
        titleEditingController.text = "";

        attachments.length = 0;
      } else {
        Dialogs.showMyToast(context, "Error posting an announcement  !");
      }
    } catch (e) {
      print('err $e');
    } finally {
      getUserNotesLists();
    }
  }
}
